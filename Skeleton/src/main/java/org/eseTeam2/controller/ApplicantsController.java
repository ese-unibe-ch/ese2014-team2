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
import java.util.List;
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
import org.eseTeam2.controller.pojos.ApplicantForm;
import org.eseTeam2.controller.pojos.AppointmentFinderForm;
import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.controller.pojos.LoginForm;
import org.eseTeam2.controller.pojos.NoteForm;
import org.eseTeam2.controller.pojos.SignupForm;
import org.eseTeam2.controller.service.AdDataService;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IAppointmentService;
import org.eseTeam2.controller.service.IUserDataService;
import org.eseTeam2.controller.service.UserDataService;
import org.eseTeam2.exceptions.InvalidUserException;
import org.eseTeam2.model.AdApplication;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Appointment;
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
	 * This mapping method adds the user as an interessent to an advertisement.
	 * 
	 * @param adId
	 *            which the user is interested in.
	 * @param request
	 * @param response
	 * @param session
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/userInterested", method = RequestMethod.GET)
	public ModelAndView interestedInAd(@RequestParam(value = "adId", required = true) Long adId,
			HttpServletRequest request, HttpServletResponse response, HttpSession session, Principal principal) {
		User currentUser = userService.getUserByEmail(principal.getName());

		ModelAndView model = new ModelAndView("interestedInAd");
		model.addObject("applicantForm", new ApplicantForm());
		model.addObject("adId", adId);

		return model;
	}
	
	
	
	
	/**
	 * this mapping method is responsible for removing unwanted interessents from the interessents list of an ad. 
	 * @param adId
	 * @param request
	 * @param response
	 * @param session
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/removeInteressent/applicationId{applicationId}/adId{adId}", method = RequestMethod.GET)
	public String deleteAd(@PathVariable("applicationId") Long applicationId, @PathVariable("adId") Long adId,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session,  Principal principal,
			RedirectAttributes redirectAttributes) {
	
	    	List<Appointment> appointments = adService.getAdvertisement(adId).getAppointments();
	    	Boolean bereitsInvited = false;
	    	for ( Appointment a : appointments ) {
	    	    for ( User u: a.getInvitations()) {
	    		for ( AdApplication ap : u.getApplications()) {
	    		    if (ap.getId() == applicationId) {
	    			redirectAttributes.addFlashAttribute("infoMessage", "Du kannst den Interessenten nicht mehr abweisen wenn du ihn bereits eingeladen hast.");
	    			bereitsInvited = true;
	    			break; }
	    		}
	    	    }
	    	}
		if  (bereitsInvited == false) {
		    appointmentService.deleteInteressent(applicationId);
		    redirectAttributes.addFlashAttribute("infoMessage", "Du hast den Interessenten abgewiesen"); }
		
	

		return "redirect:/showInteressents?adId="+adId;
	}
	
	/**
	 * this mapping method is used to set a note about someone.From the appointment o an ad site.
	 * @param request
	 * @param response
	 * @param session
	 * @param principal
	 * @param redirectAttributes
	 * @param note
	 * @param userId
	 * @param appointmentId
	 * @return
	 */

	@RequestMapping(value = "/setNote", method = RequestMethod.POST)
	public String setNote( /*@Valid NoteForm noteForm,*/ HttpServletRequest request, HttpServletResponse response,
			HttpSession session,  Principal principal,
			RedirectAttributes redirectAttributes, 	@RequestParam("noteText")String note, @RequestParam("userId") Long userId, @RequestParam("appointmentId") Long appointmentId) {
	    
	  
	    Advertisement ad = appointmentService.findOneAppointment(appointmentId).getAd();
	    note = note.replace("\"", "");
	    appointmentService.setNote(appointmentId, userId, note);
	    redirectAttributes.addFlashAttribute("infoMessage", "Notiz hinzugefügt");
	    
	  return "redirect:/zeigeBesichtigungstermine?adId="+ad.getId();

	}
	/**
	 * This mapping method is used to set a note from the appointment Overview site. 
	 * @param request
	 * @param response
	 * @param session
	 * @param principal
	 * @param redirectAttributes
	 * @param note
	 * @param userId
	 * @param appointmentId
	 * @return
	 */
	@RequestMapping(value = "/setNoteOverview", method = RequestMethod.POST)
	public String setNoteOverview( /*@Valid NoteForm noteForm,*/ HttpServletRequest request, HttpServletResponse response,
			HttpSession session,  Principal principal,
			RedirectAttributes redirectAttributes, 	@RequestParam("noteText")String note, @RequestParam("userId") Long userId, @RequestParam("appointmentId") Long appointmentId) {
	    
	  
	Advertisement ad = appointmentService.findOneAppointment(appointmentId).getAd();
	    
	 appointmentService.setNote(appointmentId, userId, note);
	 redirectAttributes.addFlashAttribute("infoMessage", "Notiz hinzugefügt");
	    
	  return "redirect:/appointments";

	}

	
	/** 
	 * This mapping method is triggered when you call /sendResume. 
	 * It takes a valid applicantForm and submits it to the adOwner.
	 * @param applicantForm
	 * @param result
	 * @param redirectAttributes
	 * @param principal
	 * @return
	 */
	@RequestMapping(value="/sendResume", method = RequestMethod.POST)
	public String setAppointmentDateAndInform (@Valid ApplicantForm applicantForm, BindingResult result,
	RedirectAttributes redirectAttributes,Principal principal) {
		
		User currentUser = userService.getUserByEmail(principal.getName());
		List<AdApplication> adApplications =  adService.getAdvertisement(applicantForm.getAdId()).getApplications();
		
		// check if the user already applied. If he did, just redirect him to the adpage. 
		for (AdApplication adApp: adApplications ) {
			if ( adApp.getApplicant().getId() ==  currentUser.getId()) {
			    	redirectAttributes.addFlashAttribute("infoMessage", "Du hast dich dort bereits Beworben.");
				return "redirect:/adprofile?adId="+applicantForm.getAdId();
			}
		}
		applicantForm.setInteressent(currentUser);
		
		appointmentService.addInteressent(applicantForm);
		
		redirectAttributes.addFlashAttribute("infoMessage", "Du hast dich erfolgreich beworben. ");
		return "redirect:/adprofile?adId="+applicantForm.getAdId();
		
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
			HttpSession session,  Principal principal,
			@ModelAttribute("infoMessage") String message) {
		
		Advertisement ad = adService.getAdvertisement(adId);
		List<AdApplication>interessents = ad.getApplications();

	
		
	
		ModelAndView model = new ModelAndView("interessents");
		model.addObject("interessents", interessents);
		model.addObject("ad", ad);
		model.addObject("infoMessage", message);
		return model;
	}
	
	
	/**
	 * This mapper method is used to print out the details of an applicant.
	 * @param applicationId
	 * @return
	 */
	@RequestMapping(value ="/interessentDetails", method = RequestMethod.GET) 
	public ModelAndView showInteressentDetails (  @RequestParam (value ="applicationId", required = true) Long applicationId) {
		
		ModelAndView model = new ModelAndView("interessentDetails");
		AdApplication application  = appointmentService.findOneApplication(applicationId);
		
		if ( application == null) 
		    return new ModelAndView("404");
		
		if(application.getTimeLimitation().equals(""))
			application.setTimeLimitation("nicht limitiert");
		
		model.addObject("application", application);
		
		
		return model;
	}
	
	

}
