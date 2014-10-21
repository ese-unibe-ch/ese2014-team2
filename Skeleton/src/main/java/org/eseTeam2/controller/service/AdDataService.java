package org.eseTeam2.controller.service;

import java.util.Date;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.dao.AddressDao;
import org.eseTeam2.model.dao.AdvertisementDao;
import org.eseTeam2.model.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdDataService implements IAdDataService {
	
  
    @Autowired
    AdvertisementDao advertisementDao;
	
	public Iterable<Advertisement> getAds() {
		return advertisementDao.findAll();
	}
	

	public Advertisement getAdvertisement(Long id) {
		return advertisementDao.findOne(id);
	}

	public AdForm saveFrom(AdForm adForm) {
		
        Advertisement ad = new Advertisement();
       
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
        ad.setImg_one(adForm.getImg_one());
        ad.setImg_two(adForm.getImg_two());
        ad.setImg_three(adForm.getImg_three());
        ad.setImg_four(adForm.getImg_four());
        ad.setDescription_ad(adForm.getDescription_ad());
        ad.setHasLaundry(adForm.getHasLaundry());
        ad.setHasBalcony(adForm.getHasBalcony());
        ad.setDescription_room(adForm.getDescription_room());
        ad.setToBalcony(adForm.getIsToBalcony());
        ad.setHasCables(adForm.getHasCables());
        ad.setDescription_us(adForm.getDescription_us());
        ad.setDescription_you(adForm.getDescription_you());        
        ad.setTitle(adForm.getRooms() + " for " + adForm.getPrice() + " in " + adForm.getRegion());
        ad = advertisementDao.save(ad);   // save object to DB
        adForm.setId(ad.getId());

        return adForm;
	}


}
