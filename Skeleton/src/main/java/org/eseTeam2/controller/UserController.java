package org.eseTeam2.controller;

import java.lang.reflect.InvocationTargetException;
import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.controller.pojos.LoginForm;
import org.eseTeam2.controller.pojos.MessageForm;
import org.eseTeam2.controller.pojos.SignupForm;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IFilterLogicService;
import org.eseTeam2.controller.service.IMessageService;
import org.eseTeam2.controller.service.IUserDataService;
import org.eseTeam2.controller.service.UserDataService;
import org.eseTeam2.exceptions.InvalidUserException;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

    @Autowired
    private IUserDataService userService;
    
    @Autowired
    private IFilterLogicService filterService;



    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register() {
    	ModelAndView model = new ModelAndView("register");
    	model.addObject("signupForm", new SignupForm());  
    	return model;
    }
    
  


    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView showProfileId(
      @RequestParam(value = "userId", required = true) Long userId,
      HttpServletRequest request, HttpServletResponse response, HttpSession session) {
    	ModelAndView model = new ModelAndView("profile");
    	model.addObject("newProfile", userService.getUserById(userId));
    	return model;
    }

    
    @RequestMapping(value = "/myprofile", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView myProfile(Principal principal) {
    	
    	User currentUser = userService.getUserByEmail(principal.getName());
    	
    	ModelAndView model = new ModelAndView("myProfile");
    	model.addObject("user", currentUser);
		return model; }
    
    
    @RequestMapping(value = "/myads", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView myAds(Principal principal) {
    	
    	User currentUser = userService.getUserByEmail(principal.getName());
    	
    	ModelAndView model = new ModelAndView("myAds");
    	model.addObject("user", currentUser);
		return model; }
    
   		
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView create(@Valid SignupForm signupForm, BindingResult result, RedirectAttributes redirectAttributes) {
    	ModelAndView model;    	
    	if (!result.hasErrors()) {
            try {
            	userService.saveFrom(signupForm);
            	model = new ModelAndView("show");
            } catch (InvalidUserException e) {
            	model = new ModelAndView("index");
            	model.addObject("page_error", e.getMessage());
            }
        } else {
        	model = new ModelAndView("index");
        }   	
    	return model;
    }
    
	@RequestMapping(value = "/saveCustomFilter", method = RequestMethod.POST)
	public String saveCustFilter(@Valid FilterForm filterForm, BindingResult result,
			RedirectAttributes redirectAttributes, Principal principal) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		
		
		ArrayList<String> getters = filterService.getGetters();
		ArrayList<String> paramNames = filterService.getParamsOfFilterForm(getters);
		Advertisement adToCompare = filterService.getAdToCompare(getters, paramNames, filterForm);
		
		userService.saveExampleAd(adToCompare, userService.getUserByEmail(principal.getName()));
	
		
		return "redirect:/myprofile";
		
		
	}
	
	@RequestMapping(value = "/setInformFilter", method = RequestMethod.GET)
	public ModelAndView setPersonalFilter(	) {
				
		ModelAndView model = new ModelAndView("createCustomFilter");
		model.addObject("filterForm", new FilterForm());
		return model;
	}
	
    
   

}


