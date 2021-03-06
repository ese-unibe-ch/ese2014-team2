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
import org.eseTeam2.model.CustomFilterAd;
import org.eseTeam2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * This controller maps all the actions related to User objects
 * 
 * @author Icewater
 *
 */
@Controller
public class UserController {

    @Autowired
    private IUserDataService userService;

    @Autowired
    private IFilterLogicService filterService;

    /**
     * this mapping method is triggered when someone wants to register on the
     * index.jsp page adds a new signupForm to the register.jsp page.
     * 
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register(@ModelAttribute("infoMessage") String message) {
	ModelAndView model = new ModelAndView("register");
	model.addObject("signupForm", new SignupForm());
	model.addObject("message", message);
	return model;
    }

    /**
     * This mapping method triggers when a user clicks on myprofile on index.jsp
     * it adds the current user object to the myProfile page.
     * 
     * @param principal
     * @return
     */
    @RequestMapping(value = "/myprofile", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView myProfile(Principal principal, @ModelAttribute("infoMessage") String message) {

	User currentUser = userService.getUserByEmail(principal.getName());

	ModelAndView model = new ModelAndView("myProfile");
	model.addObject("user", currentUser);
	model.addObject("infoMessage", message);
	return model;
    }

    /**
     * This mapping method triggers when a user clicks on the myads on index.jsp
     * it adds the user to the myAds page, to display all his ads.
     * 
     * @param principal
     * @return
     */
    @RequestMapping(value = "/myads", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView myAds(Principal principal, @ModelAttribute("infoMessage") String message) {

	User currentUser = userService.getUserByEmail(principal.getName());

	ModelAndView model = new ModelAndView("myAds");
	model.addObject("user", currentUser);
	model.addObject("infoMessage", message);
	return model;
    }

    /**
     * This mapping method is triggered when the signupForm is submitted. It
     * creates a new User object and saves it into the database.
     * 
     * @param signupForm
     * @param result
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView create(@Valid SignupForm signupForm, BindingResult result, RedirectAttributes redirectAttributes) {
	
	ModelAndView model;
	
	try {
	    if (userService.validatePassword(signupForm.getPassword(), signupForm.getPasswordVerify()) == false) {
		    redirectAttributes.addFlashAttribute("infoMessage", "Deine Passwörter stimmen nicht überein");
		    return new ModelAndView("redirect:/register");
		}
	    
	    
	} catch (Exception d) {}
		
	if (!result.hasErrors()) {
	    try {
		    
		if ( userService.getUserByEmail(signupForm.getEmail()) != null) {
		    redirectAttributes.addFlashAttribute("infoMessage", "Ein user mit diesem Account existiert schon!");
		    return new ModelAndView("redirect:/register");
		}
		userService.saveFrom(signupForm);
		redirectAttributes.addFlashAttribute("infoMessage", "Du hast dich erfolgreich registriert. Du kannst dich nun einloggen.");

		model = new ModelAndView("redirect:/");
	    } catch (InvalidUserException e) {
		model = new ModelAndView("register");
		model.addObject("page_error", e.getMessage());
	    }
	} else {
	    model = new ModelAndView("register");
	}
	return model;
    }

    /**
     * this mapping method triggers when the user choses to place a custom
     * filter on his myprofile.jsp it ads a filterForm to the displayed
     * createCustomFilter.jsp page and displays it.
     * 
     * @return
     */
    @RequestMapping(value = "/setInformFilter", method = RequestMethod.GET)
    public ModelAndView setPersonalFilter() {

	ModelAndView model = new ModelAndView("createCustomFilter");
	model.addObject("filterForm", new FilterForm());
	
	
	return model;
    }

    /**
     * This mapping method triggers when a user creates a custom filter on his
     * the createCustomFilter.jsp page It creates an CustomFilterAd which is
     * exactly the ad the user is looking for, and stores it to the user object.
     * 
     * @param filterForm
     * @param result
     * @param redirectAttributes
     * @param principal
     * @return
     * @throws IllegalAccessException
     * @throws IllegalArgumentException
     * @throws InvocationTargetException
     */
    @RequestMapping(value = "/saveCustomFilter", method = RequestMethod.POST)
    public String saveCustFilter(@Valid FilterForm filterForm, BindingResult result,
	    RedirectAttributes redirectAttributes, Principal principal) throws IllegalAccessException,
	    IllegalArgumentException, InvocationTargetException {

	ArrayList<String> getters = filterService.getGettersOfFilterForm();
	ArrayList<String> paramNames = filterService.getParamsOfFilterForm(getters);
	CustomFilterAd adToCompare = filterService.getFilterAdToCompare(getters, paramNames, filterForm);

	userService.saveExampleAd(adToCompare, userService.getUserByEmail(principal.getName()));
	
	redirectAttributes.addFlashAttribute("infoMessage", "Du hast den Benachrichtigungsfilter erfolgreich erstellt");

	return "redirect:/myprofile";

    }

}
