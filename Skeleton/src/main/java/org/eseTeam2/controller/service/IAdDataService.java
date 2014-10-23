package org.eseTeam2.controller.service;

import java.util.ArrayList;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Picture;
import org.springframework.web.multipart.MultipartFile;

public interface IAdDataService {
	
	public Iterable<Advertisement> getAds();
	public Advertisement getAdvertisement(Long id);
	public AdForm saveFrom(AdForm adForm);
	public String getPicture(Long picId);
	public ArrayList<Long> getAdPictureIds(Long adId);
	public long getAdMainPic(Long adId);
	public ArrayList<Picture> getAdPictures(Long adId);
	

		
}