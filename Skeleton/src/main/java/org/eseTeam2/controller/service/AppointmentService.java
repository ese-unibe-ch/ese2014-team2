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
import org.eseTeam2.controller.pojos.NoteForm;
import org.eseTeam2.model.AdApplication;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Appointment;
import org.eseTeam2.model.AppointmentAccepted;
import org.eseTeam2.model.AppointmentDate;
import org.eseTeam2.model.Message;
import org.eseTeam2.model.Note;
import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.AdApplicationDao;
import org.eseTeam2.model.dao.AdvertisementDao;
import org.eseTeam2.model.dao.AppointmentAcceptedDao;
import org.eseTeam2.model.dao.AppointmentDao;
import org.eseTeam2.model.dao.AppointmentDateDao;
import org.eseTeam2.model.dao.MessageDao;
import org.eseTeam2.model.dao.NoteDao;
import org.eseTeam2.model.dao.UserDao;
import org.hibernate.Hibernate;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSendException;
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
    NoteDao noteDao;

    @Autowired
    AppointmentDateDao dateDao;

    @Autowired
    IMailService mailer;

    @Autowired
    AdApplicationDao adApplicationDao;
    
    @Autowired
    AppointmentAcceptedDao appAcceptedDao;

    /**
     * This method creates an AdApplication. Therefore it creates an
     * AdApplication for the interested user and adds the application to the
     * Advertisement he is interested in. Then it sends out a Message to inform
     * the ad owner, that he has a new application.
     *
     */
    // refactor potential
    public void addInteressent(ApplicantForm applicantForm) {

	AdApplication application = new AdApplication();

	Advertisement ad = adDao.findOne(applicantForm.getAdId());
	User interessent = applicantForm.getInteressent();

	application.setAd(ad);
	application.setApplicant(applicantForm.getInteressent());
	application.setMessage(Jsoup.parse(applicantForm.getMessage()).text());
	application.setTitle(applicantForm.getTitle());
	
	if (!applicantForm.getBisWann().equals(""))
	    application.setTimeLimitation(applicantForm.getBisWann());
	else
	    application.setTimeLimitation("sobald wie möglich");

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

	notification.setMessageText("Hey, " + adCreator.getFirstName()+ ", du hast einen neuen Interessenten für dein Ad mit dem Titel " + ad.getTitle()+ "clicke <a href=\"interessentDetails?applicationId=" + application.getId() + "\">"
		+ "HIER </a> um die Bewerbung anzusehen.");
	
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
     * This method helps an adOwner User object to create an Appointment for his
     * Advertisement. It creates an Appointment object stores it into the
     * database, and creates notification Messages for all Interessents. And
     * also notifies them via E-mail.
     */
    // refactor potential
    public void sendOutAppointment(AppointmentFinderForm appForm) {
	Advertisement ad = adDao.findOne(appForm.getAdId());
	
	Appointment appointment = new Appointment();

	AppointmentDate date = new AppointmentDate();
	
	List<Appointment> adAppointments = new ArrayList<Appointment>();
	List<Message> allMessagesCreatedHere = new ArrayList<Message>();

	List<AppointmentDate> appointmentDates = new ArrayList<AppointmentDate>();

	User adOwner = appForm.getAdOwner();


	List<AdApplication> applicationsOfAd = new ArrayList<AdApplication>();

	for (int i = 0; i < appForm.getAdAppointmentIds().size(); i++)
	    applicationsOfAd.add(adApplicationDao.findOne(appForm.getAdAppointmentIds().get(i)));

	Set<User> interessentsOfAd = new LinkedHashSet<User>();

	for (AdApplication application : applicationsOfAd) {
	    interessentsOfAd.add(application.getApplicant());

	}

	appointment.setBlockLength(appForm.getBlockLength());
	appointment.setAdditionalInfosForTheVisitors(Jsoup.parse(appForm.getAdditionalInfosForTheVisitors()).text());

	date.setDay(appForm.getAppointmentDate());
	date.setStartHour(appForm.getStartTime());
	date.setEndHour(appForm.getEndTime());

	dateDao.save(date);

	appointment.setAppointmentDate(date);

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
		    + " zur besichtigung des Ads: <a href=\"adprofile?adId=" + ad.getId() + "\">" + ad.getTitle()
		    + "</a> eingeladen<br>" + " der Termin wäre am " + date.getDay() + " um " + date.getStartHour()
		    + " Einladungsnachricht des Zimmerbesitzers: <br> "
		    + appointment.getAdditionalInfosForTheVisitors());
	    appointmentInvitationMessages.add(inform);

	    interessent.setAppointmentInvitations(appointmentInvitationMessages);

	    adInvitations.add(interessent);

	    inform.setAppointmentInvitations(interessent);

	   

	    userDao.save(interessent);

	    inform = messageDao.save(inform);

	    allMessagesCreatedHere.add(inform);

	}

	appointment.setInvitations(adInvitations);
	appointment.setAd(ad.getId());

	List<Long> adAppointmentIds = ad.getAppointments();
	appointment = appDao.save(appointment);
	
	
	adAppointmentIds.add(appointment.getId());
	
	
	
	adAppointments.add(appointment);
	ad.setAppointments(adAppointmentIds);

	

	for (Message m : allMessagesCreatedHere) {
	    AppointmentAccepted hasAcceptedFlag = new AppointmentAccepted();
	    hasAcceptedFlag.setAccepted(false);
	    hasAcceptedFlag.setRejected(false);
	    hasAcceptedFlag.setUser(m.getAppointmentInvitations());
	    hasAcceptedFlag.setAppointment(appointment);
	    appAcceptedDao.save(hasAcceptedFlag);
	    m.setAppointedAppointment(appointment.getId());
	    messageDao.save(m);
	}

	adDao.save(ad);

    }

    /**
     * This method is used to inform the adOwner if an invited user accepted his
     * invitation Creates a Message object for the adOwner and updates the
     * corresponding Database entities
     */
    public void acceptInvitation(User currentUser, Long appointmentId) {
	Appointment appointment = appDao.findOne(appointmentId);
	
	// set to the appointment that the appointment is accepted.
	AppointmentAccepted hasAcceptedFlag = new AppointmentAccepted();
	
	try {
	    hasAcceptedFlag = appAcceptedDao.findByUserAndAppointment(currentUser, appointment);
	}
	catch (Exception d) {
	    hasAcceptedFlag = new AppointmentAccepted();
	}
	
	if ( hasAcceptedFlag == null)
	    hasAcceptedFlag= new AppointmentAccepted();
	
	hasAcceptedFlag.setAccepted(true);
	hasAcceptedFlag.setRejected(false);
	hasAcceptedFlag.setUser(currentUser);
	hasAcceptedFlag.setAppointment(appointment);
	hasAcceptedFlag = appAcceptedDao.save(hasAcceptedFlag);
	
	
	List<AppointmentAccepted> acceptsOfAppointment =    appointment.getWhoAcceptedTheAppointment();
	
	acceptsOfAppointment.add(hasAcceptedFlag);
	appointment.setWhoAcceptedTheAppointment(acceptsOfAppointment);
	appointment = appDao.save(appointment);
	
	
	List<Message> notifications = new ArrayList<Message>();
	User adOwner = adDao.findOne(appointment.getAd()).getCreator();

	try {
	    notifications = adOwner.getNotifications();
	} catch (Exception d) {
	}

	Message answerToInviter = new Message();

	answerToInviter.setMessageText("Hey \n" + currentUser.getFirstName() + " " + currentUser.getLastName()
		+ " hat deine Einladung angenommen\n" + "er wird zum gegebenen Termin am"
		+ appointment.getAppointmentDate().getDay() + " zwischen "
		+ appointment.getAppointmentDate().getStartHour() + " und"
		+ appointment.getAppointmentDate().getEndHour() + "erscheinen");
	
	answerToInviter.setTitle(currentUser.getFirstName() + " " + currentUser.getLastName()
		+ " hat die Einladung angenommen");

	notifications.add(answerToInviter);
	answerToInviter.setNotifications(adOwner);

	adOwner.setNotifications(notifications);

	messageDao.save(answerToInviter);
	userDao.save(adOwner);

	List<Message> appointmentInvs = currentUser.getAppointmentInvitations();

	for (Message m : appointmentInvs) {
	    if (m.getAppointedAppointment() == appointmentId) {
		m.setAccepted(true);
		messageDao.save(m);
	    }
	}

    }

    /**
     * This method is used to inform the adOwner if an invited user rejected his
     * invitation Creates a Message object for the adOwner and updates the
     * corresponding Database entities
     */
    public void rejectInvitation(User currentUser, Long appointmentId) {
	Appointment appointment = appDao.findOne(appointmentId);
	
	
	AppointmentAccepted hasAcceptedFlag = new AppointmentAccepted();
	try {
	    hasAcceptedFlag = appAcceptedDao.findByUserAndAppointment(currentUser, appointment);
	}
	catch (Exception d) {}
	
	if ( hasAcceptedFlag == null)
	    hasAcceptedFlag= new AppointmentAccepted();
	
	
	hasAcceptedFlag.setAccepted(false);
	hasAcceptedFlag.setRejected(true);
	hasAcceptedFlag.setUser(currentUser);
	hasAcceptedFlag.setAppointment(appointment);
	hasAcceptedFlag = appAcceptedDao.save(hasAcceptedFlag);
	
	
	List<AppointmentAccepted> acceptsOfAppointment =    appointment.getWhoAcceptedTheAppointment();
	
	acceptsOfAppointment.add(hasAcceptedFlag);
	appointment.setWhoAcceptedTheAppointment(acceptsOfAppointment);
	appointment = appDao.save(appointment);
	
	
	List<Message> notifications = new ArrayList<Message>();
	User adOwner = adDao.findOne(appointment.getAd()).getCreator();

	try {
	    notifications = adOwner.getNotifications();
	} catch (Exception d) {
	}

	Message answerToInviter = new Message();

	answerToInviter.setMessageText("Hey \n" + currentUser.getFirstName() + " " + currentUser.getLastName()+ " hat deine Einladung abgelehnt \n ");
	answerToInviter.setTitle(currentUser.getFirstName() + " " + currentUser.getLastName()+ " hat die Einladung abgelehnt");

	notifications.add(answerToInviter);
	answerToInviter.setNotifications(adOwner);

	adOwner.setNotifications(notifications);

	messageDao.save(answerToInviter);
	userDao.save(adOwner);

	List<Message> appointmentInvs = currentUser.getAppointmentInvitations();

	for (Message m : appointmentInvs) {
	    if (m.getAppointedAppointment() == appointmentId) {
		m.setRejected(true);
		messageDao.save(m);

	    }
	}

    }

    /**
     * this method is used to remove unwanted interessents.
     */
    public void deleteInteressent(Long applicationId) {

	List<Message> notifications = new ArrayList<Message>();
	try {
	    notifications = adApplicationDao.findOne(applicationId).getApplicant().getNotifications();
	} catch (Exception d) {
	    notifications = new ArrayList<Message>();
	}
	User user = userDao.findOne(adApplicationDao.findOne(applicationId).getApplicant().getId());
	Message notification = new Message();
	notification.setTitle("Zimmer leider vergeben");
	notification.setMessageText("Hey, das Zimmer " + adApplicationDao.findOne(applicationId).getAd().getTitle()+ " ist leider bereits vergeben. Viel glück noch bei deiner Suche!");
	
	notification.setNotifications(user);

	notification = messageDao.save(notification);
	notifications.add(notification);
	user.setNotifications(notifications);
	userDao.save(user);

	adApplicationDao.delete(applicationId);

    }
    
    
    public AdApplication findOneApplication(Long applicationId) {
	return adApplicationDao.findOne(applicationId);
    }

    public Appointment findOneAppointment(Long appointedAppointment) {
	return appDao.findOne(appointedAppointment);
    }

    /**
     * this method is a helper method to create and save a note object for a specific appointment
     */
    public void setNote(Long appointmentId, Long userId, String noteText) {

	Note note = null;

	try {
	    note = noteDao.findOneByApplicantAndAppointment(userDao.findOne(userId), appDao.findOne(appointmentId));
	} catch (Exception d) {
	    note = new Note();
	}

	if (note == null)
	    note = new Note();

	Appointment appointment = appDao.findOne(appointmentId);
	List<Note> userNotes = new ArrayList<Note>();

	try {
	    userNotes = appointment.getUserNotes();
	} catch (Exception d) {
	}

	note.setText(noteText);
	note.setApplicant(userDao.findOne(userId));
	note.setAppointment(appointment);

	note = noteDao.save(note);
	userNotes.add(note);
	appointment.setUserNotes(userNotes);
	appDao.save(appointment);

    }

    public void saveAdApplication(AdApplication application) {
	adApplicationDao.save(application);

    }
}
