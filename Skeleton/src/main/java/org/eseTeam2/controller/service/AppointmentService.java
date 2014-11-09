package org.eseTeam2.controller.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.eseTeam2.controller.pojos.ApplicantForm;
import org.eseTeam2.controller.pojos.AppointmentFinderForm;
import org.eseTeam2.model.AdApplication;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Appointment;
import org.eseTeam2.model.AppointmentDate;
import org.eseTeam2.model.Message;
import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.AdApplicationDao;
import org.eseTeam2.model.dao.AdvertisementDao;
import org.eseTeam2.model.dao.AppointmentDao;
import org.eseTeam2.model.dao.AppointmentDateDao;
import org.eseTeam2.model.dao.MessageDao;
import org.eseTeam2.model.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * This service class is handling all the logic used to create/ handle
 * Appointment objects.
 * 
 * @author Icewater
 *
 */
@Service
public class AppointmentService implements IAppointmentService {

	@Autowired
	AdvertisementDao adDao;

	@Autowired
	UserDao userDao;

	@Autowired
	AppointmentDao appDao;

	@Autowired
	MessageDao messageDao;

	@Autowired
	AppointmentDateDao dateDao;

	@Autowired
	IMailService mailer;

	@Autowired
	AdApplicationDao adApplicationDao;
	
	/**
	 * This method creates an AdApplication. Therefore it creates an AdApplication for the interested user
	 * and adds the application to the Advertisement he is interested in.
	 * Then it sends out a Message to inform the ad owner, that he has a new application.
	 *
	 */
	// refactor potential
	public void addInteressent(ApplicantForm applicantForm) {
		
		AdApplication application = new AdApplication();
		
		Advertisement ad = adDao.findOne(applicantForm.getAdId());
		User interessent = applicantForm.getInteressent();
		
		application.setAd(ad);
		application.setApplicant(applicantForm.getInteressent());
		application.setMessage(applicantForm.getMessage());
		application.setTitle(applicantForm.getTitle());
		application.setTimeLimitation(applicantForm.getBisWann());
		application.setSmoker(applicantForm.isSmoker());
		
		User adCreator = ad.getCreator();
		List<AdApplication> ads = new ArrayList<AdApplication>();
		List<AdApplication> interessents = new ArrayList<AdApplication>();

		Message notification = new Message();

		List<Message> creatorNotifications = new ArrayList<Message>();

		if (adCreator.getNotifications().isEmpty() == false)
			creatorNotifications = adCreator.getNotifications();

		if (!interessent.getApplications().isEmpty())
			ads = applicantForm.getInteressent().getApplications();

		if (ad.getApplications() != null && !ad.getApplications().isEmpty())
			interessents = ad.getApplications();

		interessents.add(application);

		ad.setApplications(interessents);

		ads.add(application);

		interessent.setApplications(ads);

	
		application = adApplicationDao.save(application);

		notification.setMessageText("Hey, " + adCreator.getFirstName()
				+ ", du hast einen neuen Interessenten für dein Ad mit dem Titel " + ad.getTitle()+  "clicke <a href=\"interessentDetails?applicationId="+application.getId()+"\">"	
							+"HIER </a> um die Bewerbung anzusehen.");
		notification.setTitle("Neuen Interessenten für, " + ad.getTitle());
		notification.setNotifications(adCreator);

		creatorNotifications.add(notification);
		adCreator.setNotifications(creatorNotifications);

		messageDao.save(notification);
		
		
		userDao.save(adCreator);
		userDao.save(interessent);

		adDao.save(ad);

	}

	/**
	 * This method helps an adOwner User object to create an Appointment for his Advertisement.
	 * It creates an Appointment object stores it into the database, and creates notification Messages 
	 * for all Interessents. And also notifies them via E-mail.
	 */
	// refactor potential
	public void sendOutAppointment(AppointmentFinderForm appForm) {

		Appointment appointment = new Appointment();
		AppointmentDate date = new AppointmentDate();

		List<AppointmentDate> appointmentDates = new ArrayList<AppointmentDate>();

		User adOwner = appForm.getAdOwner();

		Advertisement ad = adDao.findOne(appForm.getAdId());
		List<AdApplication> applicationsOfAd = ad.getApplications();
		Set<User> interessentsOfAd = new LinkedHashSet<User>();
		
		for ( AdApplication application : applicationsOfAd) {
			interessentsOfAd.add(application.getApplicant());
			
		}

		appointment.setBlockLength(appForm.getBlockLength());
		appointment.setAdditionalInfosForTheVisitors(appForm.getAdditionalInfosForTheVisitors());

		for (int i = 0; i < appForm.getAppointmentDate().size(); i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Date d = null;
			try {
				d = sdf.parse(appForm.getAppointmentDate().get(i));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			date.setDay(d);
			date.setStartHour(appForm.getStartTimes().get(i));
			date.setEndHour(appForm.getEndTimes().get(i));

			appointmentDates.add(date);

			dateDao.save(date);

		}

		appointment.setAppointmentDate(appointmentDates);

		List<User> adInvitations = new ArrayList<User>();

		for (User interessent : interessentsOfAd) {

			List<Message> appointmentInvitationMessages = new ArrayList<Message>();

			try {
				appointmentInvitationMessages = interessent.getAppointmentInvitations();
			} catch (Exception d) {
			}

			Message inform = new Message();
			inform.setTitle("Einladung zu einer Wohnungbesichtigung");
			inform.setMessageText("Hallo, du wurdest von " + adOwner.getFirstName() + " " + adOwner.getLastName()
					+ " zur besichtigung eingeladen\n" + " der Termin wäre am" + appointmentDates.get(0).getDay()
					+ " um" + appointmentDates.get(0).getStartHour()
					+ "clicke auf den Knopf am ende dieser Nachricht um auszuwählen ob es dir passt oder nicht");
			appointmentInvitationMessages.add(inform);

			interessent.setAppointmentInvitations(appointmentInvitationMessages);

			adInvitations.add(interessent);

			inform.setAppointmentInvitations(interessent);

			inform.setSender(adOwner);

			inform.setAppointedAd(ad.getId());

			String message = "Hallo, " + interessent.getFirstName()	+ " "
					+ interessent.getLastName()
					+ "\n"
					+ " du wurdest eingeladen zu einer Wohnungbesichtigung. Logge dich doch bitte auf deinem Account ein und gehe in deine Inbox \n"
					+ " Dort erhälst du alle Details.";

			mailer.sendEmail(interessent.getEmail(), message, "Einladung zur Wohnungsbesichtigung");
			userDao.save(interessent);

			messageDao.save(inform);

		}

		appointment.setInvitations(adInvitations);
		appointment.setAd(ad);
		appointment.setAdOwner(adOwner);

		ad.setAppointment(appointment);

		appDao.save(appointment);

		adDao.save(ad);

	}

	/**
	 * This method is used to inform the adOwner if an invited user accepted his invitation
	 * Creates a Message object for the adOwner and updates the corresponding Database entities
	 */
	public void informAdOwner(User currentUser, Long appointmentId) {
		Appointment appointment = appDao.findOne(appointmentId);

		List<Message> notifications = new ArrayList<Message>();
		User adOwner = appointment.getAdOwner();

		try {
			adOwner.getNotifications();
		} catch (Exception d) {
		}

		Message answerToInviter = new Message();

		answerToInviter.setMessageText("Hey \n" + currentUser.getFirstName() + " " + currentUser.getLastName()
				+ " hat deine Einladung angenommen\n" + "er wird zum gegebenen Termin am"
				+ appointment.getAppointmentDate().get(0).getDay() + " zwischen "
				+ appointment.getAppointmentDate().get(0).getStartHour() + " und"
				+ appointment.getAppointmentDate().get(0).getEndHour() + "erscheinen");
		answerToInviter.setTitle(currentUser.getFirstName() + " " + currentUser.getLastName()
				+ " hat die Einladung angenommen");

		notifications.add(answerToInviter);
		answerToInviter.setNotifications(adOwner);

		adOwner.setNotifications(notifications);

		messageDao.save(answerToInviter);
		userDao.save(adOwner);

	}

	public void deleteInteressent(Long applicationId) {
		AdApplication application = adApplicationDao.findOne(applicationId);
		Advertisement ad = adDao.findOne(application.getAd().getId());
		User interessent = userDao.findOne(application.getApplicant().getId());
		List<AdApplication> applications = ad.getApplications();
		List<AdApplication> usersApplications = new ArrayList<AdApplication>();
		
			
		
		// remove user from ads interessent list
		AdApplication userToDelete= null;
		AdApplication adToDelete= null;
		for( AdApplication  a : applications ) {
			if( a.getApplicant().getId() == interessent.getId()) 
				userToDelete = a;
			if( a.getAd().getId() == ad.getId()) 
				adToDelete = a;
				
		}
		
		applications.remove(userToDelete);
		ad.setApplications(applications);
		
		
		
		usersApplications.remove(adToDelete);
		interessent.setApplications(usersApplications);
		
		adDao.save(ad);
		userDao.save(interessent);
		adApplicationDao.delete(application);
		
		
		
	}

	public AdApplication findOneApplication(Long applicationId) {
		return adApplicationDao.findOne(applicationId);
	}
}
