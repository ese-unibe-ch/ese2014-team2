package org.eseTeam2.controller.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Picture;
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

	public Iterable<Advertisement> getAds() {
		return advertisementDao.findAll();
	}

	public Advertisement getAdvertisement(Long id) {
		return advertisementDao.findOne(id);
	}

	public AdForm saveFrom(AdForm adForm) {

		Advertisement ad = new Advertisement();

		Set<Picture> pictures = new HashSet<Picture>();
		Picture pic1 = new Picture();
		Picture pic2 = new Picture();
		Picture pic3 = new Picture();
		Picture pic4 = new Picture();

		pic1.setFilePath(adForm.getImg_one());
		pic1.setIsMainPic(true);
		pictures.add(pic1);
		pic2.setFilePath(adForm.getImg_two());
		pic2.setIsMainPic(false);
		pictures.add(pic2);
		pic3.setFilePath(adForm.getImg_three());
		pic3.setIsMainPic(false);
		pictures.add(pic3);
		pic4.setFilePath(adForm.getImg_four());
		pic4.setIsMainPic(false);
		pictures.add(pic4);

		ad.setPictures(pictures);

		if (pic1 != null)
			pictureDao.save(pic1);
		if (pic2 != null)
			pictureDao.save(pic2);
		if (pic3 != null)
			pictureDao.save(pic3);
		if (pic4 != null)
			pictureDao.save(pic4);

		ad.setDescription(adForm.getDescription());
		ad.setCreator("admin");
		ad.setCreationDate(new Date());
		ad.setIsLimited(adForm.getIsLimited());
		if (adForm.getIsLimited()) {
			ad.setStart(adForm.getStart());
			ad.setUntil(adForm.getUntil());
		}
		ad.setRooms(adForm.getRooms());
		ad.setPrice(adForm.getPrice());
		ad.setSpace(adForm.getSpace());
		ad.setRoomies(adForm.getRoomies());
		ad.setKanton(adForm.getKanton());
		ad.setRegion(adForm.getRegion());

		ad.setDescription_ad(adForm.getDescription_ad());
		ad.setHasLaundry(adForm.getHasLaundry());
		ad.setHasBalcony(adForm.getHasBalcony());
		ad.setDescription_room(adForm.getDescription_room());
		ad.setToBalcony(adForm.getIsToBalcony());
		ad.setHasCables(adForm.getHasCables());
		ad.setDescription_us(adForm.getDescription_us());
		ad.setDescription_you(adForm.getDescription_you());
		ad.setTitle(adForm.getRooms() + " for " + adForm.getPrice() + " in "
				+ adForm.getRegion());

		ad = advertisementDao.save(ad); // save object to DB
		adForm.setId(ad.getId());

		return adForm;
	}

	public String getPicture(Long picId) {
		return pictureDao.findOne(picId).getFilePath();
	}

	public ArrayList<Long> getAdPictureIds(Long adId) {

		Set<Picture> pictures = getAdvertisement(adId).getPictures();
		ArrayList<Long> pics = new ArrayList<Long>();

		for (Picture picture : pictures) {
			if (picture.getFilePath() != null) {

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
			if (picture.getFilePath() != null) {

				if (picture.getIsMainPic() == false)
					pics.add(picture);

			}

		}
		return pics;

	}

	public long getAdMainPic(Long adId) {
		Set<Picture> pictures = getAdvertisement(adId).getPictures();
		long mainPic = 0;

		for (Picture picture : pictures) {
			if (picture != null) {

				if (picture.getIsMainPic() == true)
					mainPic = picture.getId();
			}

		}
		return mainPic;
	}

	

	}


