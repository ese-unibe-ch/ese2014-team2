package org.sample.controller.service;

import java.util.Date;

import org.sample.controller.pojos.AdForm;
import org.sample.controller.pojos.LoginForm;
import org.sample.controller.pojos.SignupForm;
import org.sample.exceptions.InvalidUserException;
import org.sample.model.Address;
import org.sample.model.Advertisement;
import org.sample.model.User;
import org.sample.model.dao.AddressDao;
import org.sample.model.dao.AdvertisementDao;
import org.sample.model.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;


@Service
public class SampleServiceImpl implements SampleService {

    @Autowired    UserDao userDao;
    @Autowired    AddressDao addDao;
    @Autowired	  AdvertisementDao advertisementDao;
    
    @Transactional
    public SignupForm saveFrom(SignupForm signupForm) throws InvalidUserException{

        String firstName = signupForm.getFirstName();

        if(!StringUtils.isEmpty(firstName) && "ESE".equalsIgnoreCase(firstName)) {
            throw new InvalidUserException("Sorry, ESE is not a valid name");   // throw exception
        }


        Address address = new Address();
        address.setStreet("TestStreet");
        
        User user = new User();
        user.setFirstName(signupForm.getFirstName());
        user.setEmail(signupForm.getEmail());
        user.setLastName(signupForm.getLastName());
        user.setAddress(address);
        user.setPassword(signupForm.getPassword());
        
        
        address = addDao.save(address);  
        user = userDao.save(user);   // save object to DB
        
        
        
        // Iterable<Address> addresses = addDao.findAll();  // find all 
        // Address anAddress = addDao.findOne((long)3); // find by ID
        
        
        signupForm.setId(user.getId());

        return signupForm;

    }

	public User getUser(LoginForm login) {
		
		Iterable<User> users = userDao.findAll();
		for( User u : users ) {
			if ( u.getEmail().toLowerCase().equals(login.getEmail().toLowerCase()) && u.getPassword().equals(login.getPassword()))
				return u;
			
		}
		throw new InvalidUserException("E-Mail or password incorrect");
    	
    	
		
	}
	
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

	public String findUserPassword(Long id) {
		return userDao.findOne(id).getPassword();
	}

	public boolean passwordMatch(Long id, String password) {
		if ( userDao.findOne(id).getPassword() == password ) {
			return true; 
		} else {
			return false;
		}
	}

	public User getUserById(Long userId) {
		return userDao.findOne(userId);
	}


	
}
