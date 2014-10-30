package org.eseTeam2.controller.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Picture;
import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.AddressDao;
import org.eseTeam2.model.dao.AdvertisementDao;
import org.eseTeam2.model.dao.PictureDao;
import org.eseTeam2.model.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AdDataService implements IAdDataService {

	@Autowired
	AdvertisementDao advertisementDao;
	@Autowired
	PictureDao pictureDao;
	@Autowired
	UserDao userDao;

	public Iterable<Advertisement> getAds() {
		return advertisementDao.findAll();
	}

	public Advertisement getAdvertisement(Long id) {
		return advertisementDao.findOne(id);
	}

	public AdForm saveFrom(AdForm adForm, ArrayList<Picture> picturesToSave) {

		Advertisement ad = new Advertisement();
		Set<Advertisement> adsOfUser = new HashSet<Advertisement>();
		// set the pictures
		User creator = adForm.getCreator();
		if ( !creator.getAdvertisements().isEmpty()) {
			adsOfUser = creator.getAdvertisements();
		}
		
		Set<Picture> pictures = new HashSet<Picture>();
		
		for ( int i = 1; i < picturesToSave.size()-1; i++) {
			pictures.add(picturesToSave.get(i));
		}

		ad.setPictures(pictures);
		ad.setMainPic(picturesToSave.get(0));
		
		for ( int i = 0; i < picturesToSave.size(); i++) {
			try {
				pictureDao.save(picturesToSave.get(i));
			}
			catch (Exception d) {}
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
		ad.setTitle(adForm.getRooms() + " for " + adForm.getRoomPrice() + " in "
				+ adForm.getCity());
		adsOfUser.add(ad);
		creator.setAdvertisements(adsOfUser);
		
		
		ad = advertisementDao.save(ad); // save object to DB
		
		creator  = userDao.save(creator);
		
		adForm.setId(ad.getId());

		return adForm;
	}

	public String getPicture(Long picId) {
		return pictureDao.findOne(picId).getAbsoluteFilePath();
	}

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

	public Picture getAdMainPic (Long adId) {
		return advertisementDao.findOne(adId).getMainPic();
	}


	public Set<Picture> getPicturesOfAd(Long adId) {
		return advertisementDao.findOne(adId).getPictures();
	}

	

	}


