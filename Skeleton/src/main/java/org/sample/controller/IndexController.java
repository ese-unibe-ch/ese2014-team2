package org.sample.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.sample.controller.pojos.AdForm;
import org.sample.controller.pojos.LoginForm;
import org.sample.controller.pojos.SignupForm;
import org.sample.controller.service.SampleService;
import org.sample.exceptions.InvalidUserException;
import org.sample.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class IndexController {

    @Autowired
    SampleService sampleService;

    /*
     * 
     * INDEX PAGE
     * 
     * */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index() {
    	ModelAndView model = new ModelAndView("index");
        return model;
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
    	ModelAndView model = new ModelAndView("login");
    	model.addObject("loginForm", new SignupForm());  
    	return model;
    }
    
    /*
     * 
     * 	USER PAGES
     * 		-register
     * 		-profile
     * 		-create
     * 
     * */
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
    	model.addObject("newProfile", sampleService.getUserById(userId));
    	return model;
    }
   		
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView create(@Valid SignupForm signupForm, BindingResult result, RedirectAttributes redirectAttributes) {
    	ModelAndView model;    	
    	if (!result.hasErrors()) {
            try {
            	sampleService.saveFrom(signupForm);
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
    
    /*
     * 
     * 	AD-PAGES
     * 		-placead
     * 		-enlistad
     * 		-adprofile
     * 
     * */
    @RequestMapping(value = "/placead", method = RequestMethod.GET)
    public ModelAndView createAd() {
    	ModelAndView model = new ModelAndView("placead");
    	model.addObject("newAdForm", new AdForm());
    	return model;
    }
    
    @RequestMapping(value = "/enlistad", method = RequestMethod.POST)
    public ModelAndView enlistad(@Valid AdForm adForm, BindingResult result, RedirectAttributes redirectAttributes) {
    	ModelAndView model;
    	sampleService.saveFrom(adForm);
    	model = new ModelAndView("show");
    	return model;
    }
    
    @RequestMapping(value = "/adprofile", method = RequestMethod.GET)
    public ModelAndView showAdId(
    		@RequestParam(value = "adId", required = true) Long adId,
    		HttpServletRequest request, HttpServletResponse response, HttpSession session) {
    			ModelAndView model = new ModelAndView("adprofile");
    			model.addObject("newAdProfile", sampleService.getAdvertisement(adId));
    			return model;
    }
    
    @RequestMapping(value = "/ads", method = RequestMethod.GET)
    public ModelAndView showAds() {
    	ModelAndView model = new ModelAndView("ads");
    	model.addObject("ads",sampleService.getAds());
    	return model;

    }
    
 
    
    @RequestMapping(value = "/security-error", method = RequestMethod.GET)
    public String securityError(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("page_error", "You do have have permission to do that!");
        return "redirect:/";
    }

}


