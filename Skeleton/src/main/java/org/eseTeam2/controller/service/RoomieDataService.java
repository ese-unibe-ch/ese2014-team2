package org.eseTeam2.controller.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.RoomieForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Picture;
import org.eseTeam2.model.Roomie;
import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.AdvertisementDao;
import org.eseTeam2.model.dao.PictureDao;
import org.eseTeam2.model.dao.RoomieDao;
import org.eseTeam2.model.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 * handles all the logic corresponding to Rommate ads. Similar to AdDataService. Commenting therefore redundant
 * @author Icewater
 *
 */
@Service
public class RoomieDataService implements IRoomieDataService {

	@Autowired
	RoomieDao roomieDao;

	@Autowired
	PictureDao pictureDao;

	@Autowired
	UserDao userDao;

	public Iterable<Roomie> getRoomies() {
		return roomieDao.findAll();
	}

	public Roomie getRoomie(Long id) {
		return roomieDao.findOne(id);
	}

	public RoomieForm saveFrom(RoomieForm roomieForm,
			ArrayList<Picture> picturesToSave) {

		Roomie roomie = new Roomie();
		// set the pictures
		User creator = roomieForm.getCreator();

		Set<Picture> pictures = new HashSet<Picture>();

		for (int i = 1; i < picturesToSave.size(); i++) {
			pictures.add(picturesToSave.get(i));
		}

		roomie.setPictures(pictures);
		if (!(picturesToSave.isEmpty()))
			roomie.setMainPic(picturesToSave.get(0));

		for (int i = 0; i < picturesToSave.size(); i++) {
			try {
				pictureDao.save(picturesToSave.get(i));
			} catch (Exception d) {
			}
		}

		// set basics for roomie
		roomie.setDescription(roomieForm.getDescription());
		roomie.setCreator(roomieForm.getCreator());
		roomie.setCreationDate(new Date());
		roomie.setPersonalityType(roomieForm.getPersonalityType());
		roomie.setSmoker(roomieForm.getSmoker());
		roomie.setHasPets(roomieForm.isHasPets());
		roomie.setGender(roomieForm.getGender());
		roomie.setAge(roomieForm.getAge());
		roomie.setFirstName(roomieForm.getFirstName());
		roomie.setLastName(roomieForm.getLastName());

		// other
		creator.setRoomie(roomie);

		roomie = roomieDao.save(roomie); // save object to DB

		creator = userDao.save(creator);

		roomieForm.setId(roomie.getId());

		return roomieForm;
	}

	public String getPicture(Long picId) {
		return pictureDao.findOne(picId).getAbsoluteFilePath();
	}

	public ArrayList<Long> getRoomiePictureIds(Long roomieId) {

		Set<Picture> pictures = getRoomie(roomieId).getPictures();
		ArrayList<Long> pics = new ArrayList<Long>();

		for (Picture picture : pictures) {
			if (picture.getAbsoluteFilePath() != null) {

				if (picture.getIsMainPic() == false)
					pics.add(picture.getId());

			}

		}
		return pics;

	}

	public ArrayList<Picture> getRoomiePictures(Long roomieId) {

		Set<Picture> pictures = getRoomie(roomieId).getPictures();
		ArrayList<Picture> pics = new ArrayList<Picture>();

		for (Picture picture : pictures) {
			if (picture.getAbsoluteFilePath() != null) {

				if (picture.getIsMainPic() == false)
					pics.add(picture);

			}

		}
		return pics;

	}

	public Picture getRoomieMainPic(Long roomieId) {
		return roomieDao.findOne(roomieId).getMainPic();
	}

	public Set<Picture> getPicturesOfRoomie(Long roomieId) {
		return roomieDao.findOne(roomieId).getPictures();
	}

	public void deleteOne(Long roomieId, User user) {

		user.setRoomie(null);
		userDao.save(user);

		roomieDao.delete(roomieId);
	}
}
