package org.eseTeam2.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.eseTeam2.PictureManager;
import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.MessageForm;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IAppointmentService;
import org.eseTeam2.controller.service.IMessageService;
import org.eseTeam2.controller.service.IUserDataService;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Appointment;
import org.eseTeam2.model.Message;
import org.eseTeam2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	    return new ModelAndView("sorryInteressentGone");
	}

	
    }

}