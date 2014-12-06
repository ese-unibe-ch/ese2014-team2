package org.eseTeam2.controller;

import java.lang.reflect.InvocationTargetException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

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
import org.eseTeam2.model.Message;
import org.eseTeam2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * this contoller class handles the mappings to the index.jsp page
 * 
 * @author Icewater
 *
 */
@Controller
public class IndexController {

    @Autowired
    private IUserDataService userService;

    /**
     * redirects the user to the index page. Filter form is added for the small
     * index page filter.
     * 
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request, Principal principal, @ModelAttribute("infoMessage") String message) {
	
	User currentUser = new User();
	List<Message> messages = new ArrayList<Message>();
	
	// sets all the users messages, to show how many messages you have new in your inbox.
	try {
	    currentUser = userService.getUserByEmail(principal.getName());
	    for (Message m : currentUser.getAppointmentInvitations()) {
		if (m.isReadMessage() == false)
		    messages.add(m);
	    }
	    for (Message m : currentUser.getNotifications()) {
		if (m.isReadMessage() == false)
		    messages.add(m);
	    }
	    for (Message m : currentUser.getRecipient()) {
		if (m.isReadMessage() == false)
		    messages.add(m);
	    }
	} catch (Exception d) {
	}
	

	ModelAndView model = new ModelAndView("index");
	model.addObject("isIndexPage", true);
	HttpSession session = request.getSession();
	model.addObject("filterForm", new FilterForm());
	session.setAttribute("messageNmbr", messages.size());
	model.addObject("infoMessage", message);

	return model;
    }

    
    /**
     * this maping method redirects the user to the signup form
     * 
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
	
	ModelAndView model = new ModelAndView("login");
	model.addObject("loginForm", new SignupForm());
	return model;
    }

    /**
     * under construction page
     * 
     * @return
     */
    @RequestMapping(value = "/underConstr", method = RequestMethod.GET)
    public ModelAndView underConstruction() {
	
	ModelAndView model = new ModelAndView("underConstruction");

	return model;
    }
    /**
     * forbidden page
     * @param message
     * @return
     */
    @RequestMapping(value = "/forbidden", method = RequestMethod.GET)
    public ModelAndView forbidden(@ModelAttribute("infoMessage") String message) {
	ModelAndView model = new ModelAndView("forbidden");
	model.addObject("infoMessage", message);

	return model;
    }

    /**
     * 404 page
     * @return
     */
    @RequestMapping(value = "/404", method = RequestMethod.GET)
    public ModelAndView error404() {
	ModelAndView model = new ModelAndView("404");
	return model;
    }

    /**
     * 
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/security-error", method = RequestMethod.GET)
    public String securityError(RedirectAttributes redirectAttributes) {
	redirectAttributes.addFlashAttribute("page_error", "You do not have permission to do that!");
	return "redirect:/";
    }

}
