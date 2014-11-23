package org.eseTeam2.controller.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;

import org.eseTeam2.ErrorSaver;
import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.model.AdApplication;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Appointment;
import org.eseTeam2.model.Message;
import org.eseTeam2.model.Picture;
import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.AdApplicationDao;
import org.eseTeam2.model.dao.AdvertisementDao;
import org.eseTeam2.model.dao.AppointmentDao;
import org.eseTeam2.model.dao.MessageDao;
import org.eseTeam2.model.dao.PictureDao;
import org.eseTeam2.model.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.mail.MailSendException;
import org.springframework.security.config.authentication.UserServiceBeanDefinitionParser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 * this is the service class for advertisements. It contains all helper methods
 * related to RoomAdvertisements
 * 
 * @author Icewater
 *
 */
@Service
public class AdDataService implements IAdDataService {

    @Autowired
    AdvertisementDao advertisementDao;
    @Autowired
    PictureDao pictureDao;
    @Autowired
    AdApplicationDao applicationDao;
    @Autowired
    UserDao userDao;
    @Autowired
    MessageDao messageDao;
    @Autowired
    IMailService mailer;
    @Autowired
    AppointmentDao appDao;
    @Autowired
    IFilterLogicService filterService;
    @Autowired
    ServletContext servletContext;

    /**
     * uses the AdvertisementDao to get all Advertisements stored in the
     * database.
     */
    public Iterable<Advertisement> getAds() {
	return advertisementDao.findAll();
    }

    /**
     * uses the AdvertisementDao class to get one advertisement by its Id.
     */
    public Advertisement getAdvertisement(Long id) {
	return advertisementDao.findOne(id);
    }

    /**
     * helper method to create an Advertisement object from an ad Form, and
     * create Picture objects from an ArrayList<Picture>
     * 
     * 
     */
    public AdForm saveFrom(AdForm adForm, ArrayList<Picture> picturesToSave) {

	Advertisement ad = new Advertisement();
	Set<Advertisement> adsOfUser = new HashSet<Advertisement>();
	// set the pictures
	User creator = adForm.getCreator();
	if (!creator.getAdvertisements().isEmpty()) {
	    adsOfUser = creator.getAdvertisements();
	}

	Set<Picture> pictures = new HashSet<Picture>();

	for (int i = 1; i < picturesToSave.size(); i++) {
	    pictures.add(picturesToSave.get(i));
	}

	ad.setPictures(pictures);
	try {
	    ad.setMainPic(picturesToSave.get(0));
	} catch (Exception d) {
	}

	for (int i = 0; i < picturesToSave.size(); i++) {
	    try {
		pictureDao.save(picturesToSave.get(i));
	    } catch (Exception d) {
	    }
	}

	// set basics for ad
	ad.setDescription(adForm.getDescription());
	ad.setCreator(adForm.getCreator());
	ad.setCreationDate(new Date());

	ad.setStart(adForm.getStart());
	ad.setUntil(adForm.getUntil());

	ad.setRooms(adForm.getRooms());
	ad.setRoomPrice(adForm.getRoomPrice());
	ad.setRoomSpace(adForm.getRoomSpace());
	ad.setWgType(adForm.getWgType());
	ad.setFurnished(adForm.isFurnished());
	ad.setNmbrOfRoommates(adForm.getNmbrOfRoommates());

	// address stuff

	ad.setKanton(adForm.getKanton());
	ad.setPlz(adForm.getPlz());
	ad.setCity(adForm.getCity());
	ad.setAddress(adForm.getAddress());

	// info about flat
	ad.setDescription_ad(adForm.getDescription_ad());
	ad.setHasLaundry(adForm.getHasLaundry());
	ad.setHasBalcony(adForm.getHasBalcony());
	ad.setHasDishwasher(adForm.getHasDishwasher());
	ad.setSmokingInside(adForm.isSmokingInside());
	ad.setHasPets(adForm.isHasPets());
	ad.setWlan(adForm.isWlan());

	// room info
	ad.setDescription_room(adForm.getDescription_room());
	ad.setToBalcony(adForm.getIsToBalcony());
	ad.setHasCables(adForm.getHasCables());
	ad.setHasBuiltInCloset(adForm.isHasBuiltInCloset());

	// info about us
	ad.setDescription_us(adForm.getDescription_us());
	ad.setWgGender(adForm.getWgGender());

	// info about who we are looking for
	ad.setWhoWeAreLookingFor(adForm.getWhoWeAreLookingFor());
	ad.setSmoker(adForm.getSmoker());
	ad.setAgeRange(adForm.getAgeRange());
	ad.setGenderWeLookFor(adForm.getGenderWeLookFor());

	// other
	ad.setTitle(adForm.getRoomSpace() + "m&sup2 Zimmer in einer "
		+ (adForm.getNmbrOfRoommates() + 1) + "er-WG in "
		+ adForm.getCity() + " für " + adForm.getRoomPrice() + " CHF");
	adsOfUser.add(ad);
	creator.setAdvertisements(adsOfUser);

	ad = advertisementDao.save(ad); // save object to DB

	Iterable<User> usersWithFilters = userDao.findByExampleAdNotNull();

	// Filters each new ad to inform users if something new has been placed.
	// No other way, when we are not putting the website live.
	ArrayList<String> getters = filterService.getGettersOfFilterForm();
	for (User filterUser : usersWithFilters) {
	    if (filterService.isNewAdMatch(filterUser.getExampleAd(), getters,
		    ad) == true){
		String title = "Ein neues Ad das dich interssieren könnte wurde aufgeschaltet";
		String message = "A new ad has been put up "
			    + "http://localhost8080:Skeleton/adprofile?adId="
			    + ad.getId();
		try {
		    mailer.sendEmail(
			    filterUser.getEmail(),message ,
			    title);
		} catch (MailSendException d) {
		}
	    Message notification = new Message();
	    notification.setTitle(title); 
	    notification.setMessageText(message);
	    notification.setRecipient(filterUser);
	    notification.setNotifications(filterUser);
	    List<Message> userNotifications = filterUser.getNotifications();
	    userNotifications.add(notification);
	    filterUser.setNotifications(userNotifications);
	    messageDao.save(notification);
	    userDao.save(filterUser);}
	   
	}

	creator = userDao.save(creator);

	adForm.setId(ad.getId());

	return adForm;
    }

    /**
     * helper method which uses pictureDao to get the filepath of one Picture in
     * the database.
     */
    public String getPicture(Long picId) {
	return pictureDao.findOne(picId).getRelativeFilePath();
    }

    /**
     * helper method to get an Arraylist of Longs containing all picture Ids of
     * a given Advertisement.
     */
    public ArrayList<Long> getAdPictureIds(Long adId) {

	Set<Picture> pictures = getAdvertisement(adId).getPictures();
	ArrayList<Long> pics = new ArrayList<Long>();

	for (Picture picture : pictures) {
	    if (picture.getAbsoluteFilePath() != null) {

		if (picture.getIsMainPic() == false)
		    pics.add(picture.getId());

	    }

	}
	return pics;

    }

    /**
     * 
     * @param adId
     *            id of the advertisement to get the pictures from
     * @return Returns an ArrayList<Picture> containing all Picture objects of
     *         an Advertisement.
     */
    public ArrayList<Picture> getAdPictures(Long adId) {

	Set<Picture> pictures = getAdvertisement(adId).getPictures();
	ArrayList<Picture> pics = new ArrayList<Picture>();

	for (Picture picture : pictures) {
	    if (picture.getAbsoluteFilePath() != null) {

		if (picture.getIsMainPic() == false)
		    pics.add(picture);

	    }

	}
	return pics;

    }

    /**
     * helper method using advertisementdao to load the mainpicture of an
     * advertisement.
     */
    public Picture getAdMainPic(Long adId) {
	return advertisementDao.findOne(adId).getMainPic();
    }

    /**
     * depreciated? not sure
     */
    public Set<Picture> getPicturesOfAd(Long adId) {
	return advertisementDao.findOne(adId).getPictures();
    }

    /**
     * helper method used to delete an advertisement from the Database.
     * 
     */
    public void deleteOneAd(Long adId, User user) {

	try {
	    // remove ad from users ads

	    Set<Advertisement> userAds = user.getAdvertisements();
	    // need a tmp variable because you can not remove something during
	    // iteration.
	    Advertisement tmp = new Advertisement();
	    for (Advertisement ad : userAds) {
		if (ad.getId() == adId)
		    tmp = ad;

	    }
	    userAds.remove(tmp);
	    user.setAdvertisements(userAds);
	    userDao.save(user);

	    advertisementDao.delete(adId);

	} catch (Exception e) {
	    ErrorSaver error = new ErrorSaver();
	    String absolutePath = servletContext.getRealPath("/error");

	    error.saveErrorMessage(e, e.getClass().toString(),
		    servletContext.getRealPath("/error"));
	    e.printStackTrace();
	}
    }

}
