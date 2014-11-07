package org.eseTeam2.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.eseTeam2.PictureManager;
import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.AppointmentFinderForm;
import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.controller.pojos.LoginForm;
import org.eseTeam2.controller.pojos.SignupForm;
import org.eseTeam2.controller.service.AdDataService;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IAppointmentService;
import org.eseTeam2.controller.service.IUserDataService;
import org.eseTeam2.controller.service.UserDataService;
import org.eseTeam2.exceptions.InvalidUserException;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Picture;
import org.eseTeam2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
 * This controller class is responsible for handling all the Mappings which concern Applicants for an ad
 * @author Icewater
 *
 */

@Controller
public class ApplicantsController {

	@Autowired
	private IAdDataService adService;
	@Autowired 
	private IUserDataService userService;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private IAppointmentService appointmentService;

	
	
	/**
	 * this mapping method is responsible for removing unwanted interessents from the interessents list of an ad. 
	 * @param adId
	 * @param request
	 * @param response
	 * @param session
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/removeInteressent", method = RequestMethod.POST)
	public String deleteAd( @RequestParam("adId") Long adId, @RequestParam("interessentId") Long interessentId,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session,  Principal principal) {
		
		appointmentService.deleteInteressent(adId, interessentId);
	

		return "redirect:/myads";
	}
	
	
	
	/**
	 * This mapping method is used to print out all the interessents of an ad
	 * @param adId to get the interessents from
	 * @param request
	 * @param response
	 * @param session
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/showInteressents", method = RequestMethod.GET)
	public ModelAndView showInteressentsOfAd(
			@RequestParam(value = "adId", required = true) Long adId,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session,  Principal principal) {
		
		Advertisement ad = adService.getAdvertisement(adId);
		Set<User>interessents = ad.getInteressents();

	
		
	
		ModelAndView model = new ModelAndView("interessents");
		model.addObject("interessents", interessents);
		model.addObject("ad", ad);
		return model;
	}
	
	
	@RequestMapping(value ="/interessentDetails", method = RequestMethod.GET) 
	public ModelAndView showInteressentDetails (  @RequestParam (value ="messageId", required = true) Long messageId) {
		return null;
	}
	
	

}
