package org.eseTeam2.controller.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Date;

import javax.imageio.ImageIO;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.dao.AddressDao;
import org.eseTeam2.model.dao.AdvertisementDao;
import org.eseTeam2.model.dao.UserDao;
import org.hibernate.Hibernate;
import org.hibernate.Session;
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
	
	public Iterable<Advertisement> getAds() {
		return advertisementDao.findAll();
	}
	

	public Advertisement getAdvertisement(Long id) {
		return advertisementDao.findOne(id);
	}

	public AdForm saveFrom(AdForm adForm, MultipartFile picture1, MultipartFile picture2, MultipartFile picture3, MultipartFile picture4 ) {
		
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
     
        
        
        try {
			ad.setImg_one(picture1.getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      
        
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

	public BufferedImage convertToBufferedImage(byte[] picture) {
		// convert byte array back to BufferedImage
					InputStream in = new ByteArrayInputStream(picture);
					BufferedImage bImageFromConvert;
					try {
						bImageFromConvert = ImageIO.read(in);
						//ImageIO.write(bImageFromConvert, "jpg", new File(
						//		"c:/new-darksouls.jpg"));
						return bImageFromConvert;
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						return null;
					}
		 
					
	}
   
	public Blob getBlob(MultipartFile image ) {
		
		Session session = null;
		try {
	            MultipartFile file;
	            byte[] test = new byte[2];
				Blob blob = Hibernate.getLobCreator((session.getSessionFactory().getCurrentSession())).createBlob(image.getBytes());
				return blob;
	         
	        } catch (IOException e) {
	            e.printStackTrace();
	            return null;
	        }
		
	
	         
	         
		
	}
	
 


}
