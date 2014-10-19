package org.eseTeam2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.LoginForm;
import org.eseTeam2.controller.pojos.SignupForm;
import org.eseTeam2.controller.service.AdDataService;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.UserDataService;
import org.eseTeam2.exceptions.InvalidUserException;
import org.eseTeam2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdController {

  
	@Autowired
    private IAdDataService adService;

   
 
    @RequestMapping(value = "/placead", method = RequestMethod.GET)
    public ModelAndView createAd() {
    	ModelAndView model = new ModelAndView("placead");
    	model.addObject("newAdForm", new AdForm());
    	return model;
    }
    
    @RequestMapping(value = "/enlistad", method = RequestMethod.POST)
    public ModelAndView enlistad(@Valid AdForm adForm, BindingResult result, RedirectAttributes redirectAttributes) {
    	ModelAndView model;
    	adService.saveFrom(adForm);
    	model = new ModelAndView("show");
    	return model;
    }
    
    @RequestMapping(value = "/adprofile", method = RequestMethod.GET)
    public ModelAndView showAdId(
    		@RequestParam(value = "adId", required = true) Long adId,
    		HttpServletRequest request, HttpServletResponse response, HttpSession session) {
    			ModelAndView model = new ModelAndView("adprofile");
    			model.addObject("newAdProfile", adService.getAdvertisement(adId));
    			return model;
    }
    
    @RequestMapping(value = "/ads", method = RequestMethod.GET)
    public ModelAndView showAds() {
    	ModelAndView model = new ModelAndView("ads");
    	model.addObject("ads",adService.getAds());
    	return model;

    }
    
 

}


