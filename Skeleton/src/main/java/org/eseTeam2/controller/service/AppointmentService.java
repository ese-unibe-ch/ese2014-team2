package org.eseTeam2.controller.service;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;

import org.eseTeam2.controller.pojos.AppointmentFinderForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Appointment;
import org.eseTeam2.model.AppointmentDate;
import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.AdvertisementDao;
import org.eseTeam2.model.dao.AppointmentDao;
import org.eseTeam2.model.dao.AppointmentDateDao;
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
	AppointmentDateDao dateDao;
	
	
	public void saveAppointment(AppointmentFinderForm appForm) {
		
		Appointment appointment = new Appointment();
		User adOwner = appForm.getAdOwner();
		User interessent = new User();
		AppointmentDate date = new AppointmentDate();
		Advertisement ad = adDao.findOne(appForm.getAdId());
		
		
		
		appointment.setBlockLength(appForm.getBlockLength());
		appointment.setAdditionalInfosForTheVisitors(appForm.getAdditionalInfosForTheVisitors());
		
		for ( int i = 0; i < appForm.getAppointmentDate().size(); i++) {
			date.setAppointment(appointment);
			date.setDay(appForm.getAppointmentDate().get(i));
			date.setStartHour(appForm.getStartTimes().get(i));
			date.setEndHour(appForm.getEndTimes().get(i));
			
			dateDao.save(date);
			
		}
	
		
		
		
		
	}


	public void addInteressent(User currentUser, Long adId) {
		
		Advertisement ad = adDao.findOne(adId);
		User adCreator = ad.getCreator();
		Set<Advertisement> ads = new LinkedHashSet<Advertisement>();
		Set<User> interessents = new LinkedHashSet<User>();
		
		Set<Advertisement> creatorAds = adCreator.getAdvertisements();
		
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
		
		adCreator.setAdvertisements(creatorAds);
		
		/*userDao.save(adCreator);*/
		
		userDao.save(currentUser);
		
		adDao.save(ad);
		
		
		
		
		
	}
}
