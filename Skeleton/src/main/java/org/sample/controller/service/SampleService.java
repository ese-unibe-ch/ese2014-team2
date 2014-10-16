package org.sample.controller.service;

import org.sample.controller.pojos.AdForm;
import org.sample.controller.pojos.SignupForm;
import org.sample.controller.pojos.TeamForm;
import org.sample.exceptions.InvalidUserException;
import org.sample.model.Advertisement;
import org.sample.model.Team;
import org.sample.model.User;

public interface SampleService {

    public SignupForm saveFrom(SignupForm signupForm) throws InvalidUserException;
    public TeamForm saveFrom(TeamForm teamForm);
    public Iterable<Team> getTeams();
    public User getUser(Long _id);
    public Advertisement getAdvertisement(Long id);
    public AdForm saveFrom(AdForm adForm);
    public String findUserPassword(Long id);
    public boolean passwordMatch(Long id, String password);
    public Iterable<Advertisement> getAds();
}
