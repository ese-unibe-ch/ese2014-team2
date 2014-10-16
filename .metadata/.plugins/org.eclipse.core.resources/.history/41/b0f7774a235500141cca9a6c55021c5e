package org.sample.controller.service;

import java.util.Date;

import org.sample.controller.pojos.AdForm;
import org.sample.controller.pojos.SignupForm;
import org.sample.controller.pojos.TeamForm;
import org.sample.exceptions.InvalidUserException;
import org.sample.model.Address;
import org.sample.model.Advertisement;
import org.sample.model.Team;
import org.sample.model.User;
import org.sample.model.dao.AddressDao;
import org.sample.model.dao.AdvertisementDao;
import org.sample.model.dao.TeamDao;
import org.sample.model.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;


@Service
public class SampleServiceImpl implements SampleService {

    @Autowired    UserDao userDao;
    @Autowired    AddressDao addDao;
    @Autowired    TeamDao teamDao;
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

	public TeamForm saveFrom(TeamForm teamForm) {
		
		String teamName = teamForm.getTeamName();
		
		if(!StringUtils.isEmpty(teamName) && "ESE".equalsIgnoreCase(teamName)) {
            throw new InvalidUserException("Sorry, ESE is not a valid name");   // throw exception
        }
		
		 	Team team = new Team();
	        team.setTeamName(teamForm.getTeamName());
	        team.setCreationDate();
	        
	        team = teamDao.save(team);   // save object to DB
	        
	        
	        teamForm.setId(team.getId());

	        return teamForm;
	}
	
	public Iterable<Team> getTeams() {
		return teamDao.findAll();
	}
	
	public User getUser(Long _id) {
		return userDao.findOne(_id);
	}

	public Advertisement getAdvertisement(Long id) {
		return advertisementDao.findOne(id);
	}

	public AdForm saveFrom(AdForm adForm) {
		
		Address address = new Address();
	    address.setStreet("TestStreet");
		
        Advertisement ad = new Advertisement();
        
        ad.setTitle(adForm.getTitle());
        ad.setDescription(adForm.getDescription());     
        ad.setCreator("admin");
        ad.setCreationDate(new Date());
        ad.setIsLimited(adForm.getIsLimited());
        ad.setRooms(adForm.getRooms());
        ad.setPrice(adForm.getPrice());
        ad.setSpace(adForm.getSpace());
        // ad.setAddress(address);
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

	
}
