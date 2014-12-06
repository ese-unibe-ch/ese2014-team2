package org.eseTeam2.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.eseTeam2.PictureManager;
import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.AppointmentFinderForm;
import org.eseTeam2.controller.pojos.MessageForm;
import org.eseTeam2.controller.pojos.NoteForm;
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
    public String acceptInvitation(@RequestParam(value = "appointmentId", required = true) Long appointmentId, Principal principal) {
	
	User currentUser = userService.getUserByEmail(principal.getName());
	appointmentService.acceptInvitation(currentUser, appointmentId);

	return "redirect:myinbox";
    }

    /**
     * this mapping method is used to show all appointments scheduled for a
     * specific ad
     * 
     * @param appointmentId
     * @param principal
     * @return
     */
    @RequestMapping(value = "/zeigeBesichtigungstermine", method = RequestMethod.GET)
    public ModelAndView zeigeBesichtigungstermine(@RequestParam(value = "adId", required = true) Long adId, Principal principal, @ModelAttribute("infoMessage") String message) {
	
	User currentUser = userService.getUserByEmail(principal.getName());
	Advertisement ad = adService.getAdvertisement(adId);
	ModelAndView model = new ModelAndView("manageScheduledAppointments");
	
	List<Appointment> appointments = new ArrayList<Appointment>();
	List<Long> appointmentIds = ad.getAppointments();
	for ( int i = 0; i < appointmentIds.size(); i++) {
	    appointments.add(appointmentService.findOneAppointment(appointmentIds.get(0)));
	}
	model.addObject("appointments", appointments);
	model.addObject("ad", ad);
	model.addObject("user", currentUser);
	model.addObject("noteForm", new NoteForm());
	model.addObject("infoMessage", message);

	return model;
    }

    /**
     * this mapping method is responsible for displaying all appointments of all
     * the users ads.
     * 
     * @param adId
     * @param principal
     * @return
     */
    @RequestMapping(value = "/appointments", method = RequestMethod.GET)
    public ModelAndView zeigeAlleBesichtigungstermine(Principal principal,@RequestParam(value = "showTab", required = true) int show) {
	
	ModelAndView model = new ModelAndView("appointmentOverview");
	User currentUser = userService.getUserByEmail(principal.getName());
	Set<Advertisement> usersAds = currentUser.getAdvertisements();
	List<Appointment> usersAppointments = new ArrayList<Appointment>();
	
	
	for (Advertisement a : usersAds) {
	    List<Long> appointmentIds = a.getAppointments();
	    for (Long app : appointmentIds) {
		usersAppointments.add(appointmentService.findOneAppointment(app));
	    }
	}
	
	// use hashset to remove duplicates. SOmehow there are troubles because of the many to many realtion.
	Set<Appointment> userInvitations = new HashSet(currentUser.getUsersInvitations());
	Set<Appointment> userAppointments = new HashSet(usersAppointments);
	
	for ( Appointment app : userAppointments) {
	    
		Set<User> userSet = new HashSet(app.getInvitations());
	    
	}
	
	model.addObject("usersInvitations", userInvitations);

	model.addObject("usersAppointments", userAppointments);
	model.addObject("user", currentUser);
	
	// had some trouble with javascript. Workaround to show different tabs.
	if (show == 1) {
	    model.addObject("showTab", 1);
	} else {
	    model.addObject("showTab", 2);
	}

	return model;
    }

    
    /**
     * this mapping method is used to reject an invitation a user received. 
     * @param appointmentId
     * @param principal
     * @return
     */
    @RequestMapping(value = "/rejectInvitation", method = RequestMethod.GET)
    public String rejectInvitation(@RequestParam(value = "appointmentId", required = true) Long appointmentId, Principal principal) {

	User currentUser = userService.getUserByEmail(principal.getName());
	appointmentService.rejectInvitation(currentUser, appointmentId);

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
    public ModelAndView invitation(@RequestParam(value = "messageId", required = true) Long messageId,
	    Principal principal, HttpServletRequest request) {
	HttpSession session = request.getSession();
	Message invitationMessage = messageService.findOneMessage(messageId);
	User authorOfReceivedMessage = invitationMessage.getSender();

	try {

	    Appointment appointment = appointmentService.findOneAppointment(invitationMessage.getAppointedAppointment());
	    Advertisement adUserIsInvitedTo = adService.getAdvertisement(appointment.getAd());

	    ModelAndView model = new ModelAndView("handleInvitation");
	    model.addObject("appointment", appointment);
	    model.addObject("sender", authorOfReceivedMessage);
	    model.addObject("ad", adUserIsInvitedTo);
	    model.addObject("message", invitationMessage);
	    invitationMessage.setReadMessage(true);
	    messageService.saveMessage(invitationMessage);
	    int messageNmbr = (Integer) session.getAttribute("messageNmbr");
	    session.setAttribute("messageNmbr", messageNmbr - 1);

	    return model;
	} catch (NullPointerException d) {
	    return new ModelAndView("404");
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
	    @ModelAttribute("interessentsToSendApp") Long[] interessentsToSendApp, RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response,
	    HttpSession session, Principal principal) {

	Advertisement ad = adService.getAdvertisement(adId);

	List<AdApplication> applications = new ArrayList<AdApplication>();

	if (interessentsToSendApp.length == 0)
	    applications = ad.getApplications();
	else {
	    for (int i = 0; i < interessentsToSendApp.length; i++) {
		applications.add(appointmentService.findOneApplication(interessentsToSendApp[i]));
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
     * This mapping method is used to create an appointment for the selected
     * interessents.
     */
    @RequestMapping(value = "/setzeTeilBesichtigungstermin", method = RequestMethod.POST)
    public String teilBesichtigunsterminSetzen(@RequestParam("adId") Long adId,
	    @RequestParam(value = "interessentsArr", required = false) Long[] interessentsArr,
	    RedirectAttributes redirectAttributes, Principal principal) {

	if (interessentsArr == null) {
	    redirectAttributes.addFlashAttribute("infoMessage", "Warnung: Du hast keinen Bewerber ausgewählt");
	    return "redirect:/showInteressents?adId=" + adId;
	}

	Advertisement ad = adService.getAdvertisement(adId);

	redirectAttributes.addFlashAttribute("interessentsToSendApp", interessentsArr);

	return "redirect:/setzeBesichtigungstermin?adId=" + ad.getId();
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
    public ModelAndView setAppointmentDateAndInform(@Valid AppointmentFinderForm appointmentFinderForm, BindingResult result, RedirectAttributes redirectAttributes, Principal principal) {

	ModelAndView model;

	if (!result.hasErrors()) {

	    appointmentFinderForm.setAdOwner(userService.getUserByEmail(principal.getName()));
	    appointmentService.sendOutAppointment(appointmentFinderForm);
	    redirectAttributes.addFlashAttribute("infoMessage", "Deine Eeinladung wurde verschickt!");
	    model = new ModelAndView("redirect:/showInteressents?adId=" + appointmentFinderForm.getAdId());
	    return model;
	} else {
	    redirectAttributes.addFlashAttribute("infoMessage", "Warnung: Du hast nicht alle felder ausgefüllt. Bitte beginne neu und fülle alle Felder aus");
	    model = new ModelAndView("redirect:/showInteressents?adId=" + appointmentFinderForm.getAdId());
	}
	return model;
    }

}