package org.eseTeam2.controller.service;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.model.Advertisement;

public interface IAdDataService {
	
	public Iterable<Advertisement> getAds();
	public Advertisement getAdvertisement(Long id);
	public AdForm saveFrom(AdForm adForm);
		
}