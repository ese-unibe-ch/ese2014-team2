package org.eseTeam2.controller.service;

import java.util.ArrayList;
import java.util.Set;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Picture;
import org.eseTeam2.model.User;

public interface IAdDataService {
	
	public Advertisement findByCreatorAndId(User user, Long adId);
	public Iterable<Advertisement> getAds();
	public Advertisement getAdvertisement(Long id);
	public AdForm saveFrom(AdForm adForm, ArrayList<Picture> pictures);
	public String getPicture(Long picId);
	public ArrayList<Long> getAdPictureIds(Long adId);
	
	public Picture getAdMainPic(Long adId);
	public ArrayList<Picture> getAdPictures(Long adId);
	public Set<Picture> getPicturesOfAd(Long adId);
	public void deleteOneAd(Long adId, User user);
	public void editAd(AdForm adForm, Long adId);
	

		
}
