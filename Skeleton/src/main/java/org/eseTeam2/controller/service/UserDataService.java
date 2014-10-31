package org.eseTeam2.controller.service;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.LoginForm;
import org.eseTeam2.controller.pojos.SignupForm;
import org.eseTeam2.exceptions.InvalidUserException;

import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.User;
import org.eseTeam2.model.UserRole;
import org.eseTeam2.model.dao.AdvertisementDao;
import org.eseTeam2.model.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;




@Service
public class UserDataService implements IUserDataService {

    @Autowired    
    UserDao userDao;
 
    

    public SignupForm saveFrom(SignupForm signupForm) throws InvalidUserException{

        String firstName = signupForm.getFirstName();

        if(!StringUtils.isEmpty(firstName) && "ESE".equalsIgnoreCase(firstName)) {
            throw new InvalidUserException("Sorry, ESE is not a valid name");   // throw exception
        }
        
        BCryptPasswordEncoder password = new BCryptPasswordEncoder();

        
       
        
        User user = new User();
        user.setFirstName(signupForm.getFirstName());
        user.setEmail(signupForm.getEmail());
        user.setLastName(signupForm.getLastName());
   
        user.setPassword(password.encode(signupForm.getPassword()));
        
        user.setEnabled(true);
		
		Set<UserRole> userRole = new HashSet<UserRole>();
		UserRole role = new UserRole();
		role.setRole("ROLE_USER");
		role.setUser(user);
		userRole.add(role);
		
		user.setUserRole(userRole);
		
        
        
        user = userDao.save(user);   // save object to DB
        
        
        
        // Iterable<Address> addresses = addDao.findAll();  // find all 
        // Address anAddress = addDao.findOne((long)3); // find by ID
        
        
        signupForm.setId(user.getId());

        return signupForm;

    }


	

	public User getUserById(Long userId) {
		return userDao.findOne(userId);
	}
	
	public User getUserByEmail(String email) {
		return userDao.findByEmail(email);
	}


	
}
