package org.eseTeam2.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.eseTeam2.PictureManager;
import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.AppointmentFinderForm;
import org.eseTeam2.controller.pojos.MessageForm;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IAppointmentService;
import org.eseTeam2.controller.service.IMessageService;
import org.eseTeam2.controller.service.IUserDataService;
import org.eseTeam2.model.AdApplication;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Appointment;
import org.eseTeam2.model.Message;
import org.eseTeam2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * This controller handles all mappings related to appointments.
 * 
 * @author Icewater
 *
 */
@Controller
public class AppointmentController {

    @Autowired
    private IAdDataService adService;

    @Autowired
    private IMessageService messageService;

    @Autowired
    private IUserDataService userService;

    @Autowired
    private IAppointmentService appointmentService;

    /**
     * this mapping method is used to accept sent out appointments and inform
     * the User which created the ad. Mapping is triggered when the user clicks
     * on accept invitation button in the message.
     * 
     * @param appointmentId
     * @param principal
     * @return
     */
    @RequestMapping(value = "/acceptInvitation", method = RequestMethod.GET)
    public String acceptInvitation(
	    @RequestParam(value = "appointmentId", required = true) Long appointmentId,
	    Principal principal) {
	User currentUser = userService.getUserByEmail(principal.getName());
	appointmentService.informAdOwner(currentUser, appointmentId);

	return "redirect:myinbox";
    }

    @RequestMapping(value = "/rejectInvitation, method = RequestMethod.GET")
    public String rejectInvitation(
	    @RequestParam(value = "appointmentId", required = true) Long appointmentId,
	    Principal principal) {

	User currentUser = userService.getUserByEmail(principal.getName());
	appointmentService.informAdOwner(currentUser, appointmentId);

	return "redirect:myinbox";
    }

    /**
     * This mapping method is triggered when clicked on an invitation message in
     * the inbox.jsp displays the details of the received message.
     * 
     * @param messageId
     *            the message id of the invitation messag4e
     * @param principal
     * @return
     */
    @RequestMapping(value = "/showInvitation", method = RequestMethod.GET)
    public ModelAndView invitation(
	    @RequestParam(value = "messageId", required = true) Long messageId,
	    Principal principal) {

	Message invitationMessage = messageService.findOneMessage(messageId);
	User authorOfReceivedMessage = invitationMessage.getSender();
	
	try {
	Advertisement adUserIsInvitedTo = adService.getAdvertisement(invitationMessage.getAppointedAd());
	Appointment appointment = adUserIsInvitedTo.getAppointment();
	ModelAndView model = new ModelAndView("handleInvitation");
	model.addObject("appointment", appointment);
	model.addObject("sender", authorOfReceivedMessage);
	model.addObject("ad", adUserIsInvitedTo);
	model.addObject("message", invitationMessage);

	return model;
	}
	catch (NullPointerException d) {
	    return new ModelAndView("sorryWhatYouSearchIsGone");
	}

	
    }
    
    /**
	 * This mapping method is used to create an appointment for flat visiting.
	 * Redirects the user to the setAppointmentForAd page, where he can set the
	 * visit date.
	 * 
	 * @param adId
	 * @param request
	 * @param response
	 * @param session
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/setzeBesichtigungstermin", method = RequestMethod.GET)
	public ModelAndView besichtigungsterminSetzen(@RequestParam(value = "adId", required = true) Long adId, 
		@ModelAttribute("interessentsToSendApp") ArrayList<Long> interessentsToSendApp, 
		RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response, HttpSession session, Principal principal) {
	   		    
		Advertisement ad = adService.getAdvertisement(adId);
			
		List<AdApplication> applications = new ArrayList<AdApplication>();
				
		if ( interessentsToSendApp.isEmpty())
		   applications = ad.getApplications();
		else {
		    for ( int i = 0; i < interessentsToSendApp.size();i++) {
			applications.add(appointmentService.findOneApplication(interessentsToSendApp.get(i)));
		    	}
		     }
		
		
		List<User> interessents = new ArrayList<User>();

		for (AdApplication a : applications) {
			interessents.add(a.getApplicant());
		}

		ModelAndView model = new ModelAndView("setAppointmentForAd");
		model.addObject("interessents", interessents);
		model.addObject("ad", ad);
		model.addObject("appointmentFinderForm", new AppointmentFinderForm());
		model.addObject("adAppointments", interessentsToSendApp);
		return model;
	}
	
	/**
	 * 
	 * This mapping method is used to create an appointment for the selected interessents. 
	 */
	@RequestMapping(value = "/setzeTeilBesichtigungstermin", method = RequestMethod.POST)
	public String teilBesichtigunsterminSetzen(@RequestParam("interessentsArr") Long[] interessentsArr,RedirectAttributes redirectAttributes, Principal principal) {
	    	
		Advertisement ad = appointmentService.findOneApplication(interessentsArr[0]).getAd();
		
		ArrayList<Long> interessentsList = new ArrayList<Long>();
	    	
		for ( int i = 0; i < interessentsArr.length;i++) {
	    	    interessentsList.add(interessentsArr[i]);
	    	}
		redirectAttributes.addFlashAttribute("interessentsToSendApp", interessentsList);
		
		return "redirect:/setzeBesichtigungstermin?adId="+ad.getId();
	}
	
	
	
	/**
	 * this mapping method is used when the user clicks on the send out
	 * appointments on the setAppointmentForAd.jsp page it sets the appointment,
	 * stores it in the database, updates all corresponding entities and informs
	 * the people who are invited.
	 * 
	 * @param appointmentFinderForm
	 * @param result
	 * @param redirectAttributes
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/setAppointmentAndInform", method = RequestMethod.POST)
	public ModelAndView setAppointmentDateAndInform(@Valid AppointmentFinderForm appointmentFinderForm, 
		@RequestParam("adAppointmentIds") Long[] adAppointmentIds,
		BindingResult result, RedirectAttributes redirectAttributes, Principal principal) {
		ModelAndView model;
		ArrayList<Long> interessentsList = new ArrayList<Long>();
	    	
		for ( int i = 0; i < adAppointmentIds.length;i++) {
	    	    interessentsList.add(adAppointmentIds[i]);
	    	}
		    
		appointmentFinderForm.setAdAppointmentIds(interessentsList);
		Appointment appointment = null;
		
		if (!result.hasErrors()) {
		   
        		appointmentFinderForm.setAdOwner(userService.getUserByEmail(principal.getName()));
        		appointmentService.sendOutAppointment(appointmentFinderForm);
        		model = new ModelAndView("redirect:/success/createdAppointment");
        		return model; //}

		} else {
			model = new ModelAndView("setAppointmentForAd");
		}
		return model;
	}

}