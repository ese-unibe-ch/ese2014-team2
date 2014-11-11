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
import org.eseTeam2.controller.pojos.SignupForm;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IUserDataService;
import org.eseTeam2.controller.service.UserDataService;
import org.eseTeam2.exceptions.InvalidUserException;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * this contoller class handles the mappings to the index.jsp page
 * @author Icewater
 *
 */
@Controller
public class SuccessController {

	@Autowired
	private IUserDataService userService;


	/**
	 * redirects the user to the index page. 
	 * Filter form is added for the small index page filter.
	 * @return
	 */
	@RequestMapping(value = "/successPage", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("success");
		return model;
	}
	
	
	@RequestMapping("/success/{action}")
	public String message(Model model, @PathVariable String action) {
		if (action.equals("adPlaceSuccess"))
		    return "redirect:/successPage?adPlaceSuccess=true";
		if (action.equals("createdAppointment"))
		    return "redirect:/successPage?createdAppointment=true";
		if (action.equals("messageSent"))
		    return "redirect:/successPage?messageSent=true";
		if( action.equals("userRegistered"))
		    return "redirect:/successPage?userRegistered=true";
		if( action.equals("alreadyHaveAppointment"))
		    return "redirect:/successPage?alreadyHaveAppointment=true";
		

		return "redirect:/index";

	}



}
