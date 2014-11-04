package org.eseTeam2.controller.service;

import org.eseTeam2.controller.pojos.LoginForm;
import org.eseTeam2.controller.pojos.SignupForm;
import org.eseTeam2.exceptions.InvalidUserException;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.User;

public interface IUserDataService {
	public SignupForm saveFrom(SignupForm signupForm) throws InvalidUserException;
	

	public User getUserById(Long userId);
	public User getUserByEmail(String email);


	public void saveExampleAd(Advertisement adToCompare, User currentUser);

}