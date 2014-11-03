package org.eseTeam2.controller.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.eseTeam2.controller.pojos.AppointmentFinderForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Appointment;
import org.eseTeam2.model.AppointmentDate;
import org.eseTeam2.model.Message;
import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.AdvertisementDao;
import org.eseTeam2.model.dao.AppointmentDao;
import org.eseTeam2.model.dao.AppointmentDateDao;
import org.eseTeam2.model.dao.MessageDao;
import org.eseTeam2.model.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AppointmentService implements IAppointmentService{

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
	
	
	
		
	


	public void addInteressent(User currentUser, Long adId) {
		
		Advertisement ad = adDao.findOne(adId);
		User adCreator = ad.getCreator();
		Set<Advertisement> ads = new LinkedHashSet<Advertisement>();
		Set<User> interessents = new LinkedHashSet<User>();
		
		Message notification = new Message();
		
		
		List<Message> creatorNotifications = new ArrayList<Message>();
		
		if( adCreator.getNotifications().isEmpty() == false)
			creatorNotifications = adCreator.getNotifications();
		
		if ( !currentUser.getAdsUserIsInterestedIn().isEmpty())
			ads = currentUser.getAdsUserIsInterestedIn();
		
		if ( ad.getInteressents() != null && !ad.getInteressents().isEmpty())
			interessents = ad.getInteressents();
		
		interessents.add(currentUser);
		
		ad.setInteressents(interessents);
			
		ads.add(ad);
		
		currentUser.setAdsUserIsInterestedIn(ads);
		
		/*
		for ( Advertisement adv : creatorAds)  {
			if( adv.getId() == adId)
				creatorAds.remove(adv);
		}
		creatorAds.add(ad); */
		
		//adCreator.setAdvertisements(creatorAds);
		
		/*userDao.save(adCreator);*/
		
		notification.setMessageText("Hey, "+adCreator.getFirstName()+", du hast einen neuen Interessenten für dein Ad mit dem Titel "+ad.getTitle());
		notification.setTitle("Neuen Interessenten für, "+ ad.getTitle());
		notification.setNotifications(adCreator);
				
		creatorNotifications.add(notification);
		adCreator.setNotifications(creatorNotifications);
		
		messageDao.save(notification);
		
		userDao.save(adCreator);
		userDao.save(currentUser);
		
		adDao.save(ad);
		
		
		
		
		
	}


	
	public void sendOutAppointment(AppointmentFinderForm appForm) {
		
		Appointment appointment = new Appointment();
		AppointmentDate date = new AppointmentDate();
		
		List<AppointmentDate>  appointmentDates = new ArrayList<AppointmentDate>();
		
		
		User adOwner = appForm.getAdOwner();
		
		
		Advertisement ad = adDao.findOne(appForm.getAdId());
		Set<User> interessentsOfAd = ad.getInteressents();
		
		
		
		
		appointment.setBlockLength(appForm.getBlockLength());
		appointment.setAdditionalInfosForTheVisitors(appForm.getAdditionalInfosForTheVisitors());
		
		for ( int i = 0; i < appForm.getAppointmentDate().size(); i++) {
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
		
		
		for ( User interessent: interessentsOfAd) {
			
			List<Message> appointmentInvitationMessages = new ArrayList<Message>();
			
			try {
				appointmentInvitationMessages = interessent.getAppointmentInvitations();
			}
			catch (Exception d){}
			
			Message inform = new Message ();
			inform.setTitle("Einladung zu einer Wohnungbesichtigung");
			inform.setMessageText("Hallo, du wurdest von " + adOwner.getFirstName() + " " + adOwner.getLastName() +" zur besichtigung eingeladen\n"
					+" der Termin wäre am"+appointmentDates.get(0).getDay()+" um" +appointmentDates.get(0).getStartHour()
					+ "clicke auf den Knopf am ende dieser Nachricht um auszuwählen ob es dir passt oder nicht");
			appointmentInvitationMessages.add(inform);
			
			interessent.setAppointmentInvitations(appointmentInvitationMessages);
					
			adInvitations.add(interessent);
			
			inform.setAppointmentInvitations(interessent);
			
			inform.setSender(adOwner);
			
			inform.setAppointedAd(ad.getId());
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



	public void informAdOwner(User currentUser, Long appointmentId) {
		Appointment appointment = appDao.findOne(appointmentId);
		
		List<Message> notifications = new ArrayList<Message>();
		User adOwner = appointment.getAdOwner();
		
		try {
			adOwner.getNotifications();
		}
		catch (Exception d) {}
		
		Message answerToInviter = new Message();
		
		answerToInviter.setMessageText("Hey \n" + currentUser.getFirstName() + " " + currentUser.getLastName() + " hat deine Einladung angenommen\n"
				+"er wird zum gegebenen Termin am" +appointment.getAppointmentDate().get(0).getDay() +" zwischen "
				+appointment.getAppointmentDate().get(0).getStartHour() +" und" +appointment.getAppointmentDate().get(0).getEndHour() +"erscheinen");
		answerToInviter.setTitle(currentUser.getFirstName() +" "+ currentUser.getLastName() +" hat die Einladung angenommen");
		
		notifications.add(answerToInviter);
		answerToInviter.setNotifications(adOwner);
		
		adOwner.setNotifications(notifications);
		
		messageDao.save(answerToInviter);
		userDao.save(adOwner);
		
		
		
		
		
	}
}
