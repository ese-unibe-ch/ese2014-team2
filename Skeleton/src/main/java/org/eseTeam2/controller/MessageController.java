package org.eseTeam2.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.eseTeam2.PictureManager;
import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.MessageForm;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IMessageService;
import org.eseTeam2.controller.service.IUserDataService;
import org.eseTeam2.model.Advertisement;
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
 * this controller handles all the mappings related to sending/receiving
 * messages
 * 
 * @author Icewater
 *
 */
@Controller
public class MessageController {

	@Autowired
	private IAdDataService adService;

	@Autowired
	private IMessageService messageService;

	@Autowired
	private IUserDataService userService;
	
	/**
	 * this mapping method triggers when a user clicks on send message to ad owner button in adProfile.jsp
	 * Redirects to the senderMessage.jsp page and displays various information about the Message, like sender, receiver, 
	 * and offers options to write the ad owner.
	 * @param adId
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/sendMessageFromAd", method = RequestMethod.GET)
	public ModelAndView sendMessageFromAd(@RequestParam(value = "adId", required = true) Long adId, Principal principal) {

		User currentUser = userService.getUserByEmail(principal.getName());

		ModelAndView model = new ModelAndView("sendMessage");
		model.addObject("sender", currentUser);
		model.addObject("reciever", adService.getAdvertisement(adId).getCreator());
		model.addObject("messageForm", new MessageForm());
		return model;
	}
	
	
	@RequestMapping(value = "/sendMessageFromAppointment", method = RequestMethod.GET)
	public ModelAndView sendMessageFromAppointment(@RequestParam(value = "messageId", required = true) Long messageId, Principal principal) {

		User currentUser = userService.getUserByEmail(principal.getName());
		
		User reciever = messageService.findOneMessage(messageId).getAppointmentInvitations();
		ModelAndView model = new ModelAndView("sendMessage");
		model.addObject("sender", currentUser);
		model.addObject("reciever", reciever );
		model.addObject("messageForm", new MessageForm());
		return model;
	}
	
	
	/**
	 * this mapping method is used to show the details of a message. It redirects to the "showMsg.jsp" page.
	 * Triggered when user clicks on a message (inbox.jsp)
	 * It inserts the sender, the recipient, and the message into the jsp, ans offers the user a way to answer the message
	 * 
	 * 
	 * @param messageId Id of the message where the details should be shown for.
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/showMessage", method = RequestMethod.GET)
	public ModelAndView showMessage(@RequestParam(value = "messageId", required = true) Long messageId, Principal principal) {

		User currentUser = userService.getUserByEmail(principal.getName());
		Message messageToReplyTo = messageService.findOneMessage(messageId);
		User authorOfReceivedMessage = messageToReplyTo.getSender();

		ModelAndView model = new ModelAndView("showMsg");
		model.addObject("messageForm", new MessageForm());
		model.addObject("sender", currentUser);
		model.addObject("recipient", authorOfReceivedMessage);
		model.addObject("message", messageToReplyTo);

		return model;
	}
	
	
	/**
	 * this mapping method is used to show the details of a message. It redirects to the "showMsg.jsp" page.
	 * Triggered when user clicks on a message (inbox.jsp)
	 * It inserts the sender, the recipient, and the message into the jsp, ans offers the user a way to answer the message
	 * 
	 * 
	 * @param messageId Id of the message where the details should be shown for.
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/showNotification", method = RequestMethod.GET)
	public ModelAndView showNotification(@RequestParam(value = "messageId", required = true) Long messageId, Principal principal) {

		User currentUser = userService.getUserByEmail(principal.getName());
		Message messageToReplyTo = messageService.findOneMessage(messageId);
		User authorOfReceivedMessage = messageToReplyTo.getSender();

		ModelAndView model = new ModelAndView("showNotification");
		model.addObject("messageForm", new MessageForm());
		model.addObject("sender", currentUser);
		model.addObject("recipient", authorOfReceivedMessage);
		model.addObject("message", messageToReplyTo);

		return model;
	}


	/**
	 * this mapping method is triggered from all the message sending forms. Takes in a message Form and converts it to
	 * a message object, stores it into the database, and updates all corresponding Entities.
	 * @param messageForm
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public ModelAndView send(@Valid MessageForm messageForm, Principal principal) {

		User currentUser = userService.getUserByEmail(principal.getName());
		messageForm.setSender(currentUser);
		messageService.sendMessage(messageForm);

		ModelAndView model = new ModelAndView("redirect:/success/messageSent");

		return model;

	}
	
	

	/**
	 * This mapping method is used to create the users inbox.jsp page. It is triggered by 
	 * a click on inbox on the index.jsp page (logged in user)
	 * It reads out all the users sent/received/notifications/appointment invitations from the database
	 * and ads them to the model
	 * @param principal 
	 * @return
	 */
	@RequestMapping(value = "/myinbox", method = RequestMethod.GET)
	public ModelAndView inbox(Principal principal, @ModelAttribute("infoMessage") String message) {

		User currentUser = userService.getUserByEmail(principal.getName());
		List<Message> recipientMessagesToDisplay = new ArrayList<Message>();
		List<Message> senderMessagesToDisplay = new ArrayList<Message>();
		List<Message> senderMessages = currentUser.getSender();
		List<Message> recipientMessages = currentUser.getRecipient();
		List<Message> getInvitations = currentUser.getAppointmentInvitations();

		// the following 2 for loops check if the user deleted the message locally, and only display if he didnt delete them yet. (Message stays in db till both users deleted it)
		for (int i = 0; i < senderMessages.size(); i++) {
			if (senderMessages.get(i).isSenderDeleted() == false)
				senderMessagesToDisplay.add(senderMessages.get(i));
		}

		for (int i = 0; i < recipientMessages.size(); i++) {
			if (recipientMessages.get(i).isRecipientDeleted() == false)
				recipientMessagesToDisplay.add(recipientMessages.get(i));
		}

		ModelAndView model = new ModelAndView("inbox");
		model.addObject("receivedMessages", recipientMessagesToDisplay);
		model.addObject("sentMessages", senderMessagesToDisplay);
		model.addObject("notifications", currentUser.getNotifications());
		model.addObject("invitations", getInvitations);
		model.addObject("user", currentUser);
		model.addObject("infoMessage", message);
		return model;
	}

	/**
	 * this mapping method is a helper method which is triggered when a sent message is deleted.
	 * it sets the SenderDeleted flag in the message object to true. 
	 * @param principal
	 * @param messageId
	 * @return
	 */
	@RequestMapping(value = "/deleteSentMsg", method = RequestMethod.GET)
	public String deleteSentMessage(Principal principal,
			@RequestParam(value = "messageId", required = true) Long messageId, RedirectAttributes redirectAttributes) {
		User currentUser = userService.getUserByEmail(principal.getName());
		messageService.deleteSenderMessage(messageId, currentUser);
		redirectAttributes.addFlashAttribute("infoMessage", "Nachricht erfolgreich gelöscht");
		return "redirect:/myinbox";
	}
	
	/**
	 * this mapping method is a helper method which is triggered when a received message is deleted.
	 * it sets the RecipientDeleted flag in the message object to true. 
	 * @param principal
	 * @param messageId
	 * @return
	 */
	@RequestMapping(value = "/deleteReceivedMsg", method = RequestMethod.GET)
	public String deleteReceivedMessage(Principal principal,
			@RequestParam(value = "messageId", required = true) Long messageId, RedirectAttributes redirectAttributes) {
		User currentUser = userService.getUserByEmail(principal.getName());
		messageService.deleteRecipientMessage(messageId, currentUser);
		redirectAttributes.addFlashAttribute("infoMessage", "Nachricht erfolgreich gelöscht");
		return "redirect:/myinbox";
	}
	
	/**
	 * This mapping method deletes a notification message from the database completely.
	 * @param principal
	 * @param messageId
	 * @return
	 */
	@RequestMapping(value = "/deleteNotification", method = RequestMethod.GET)
	public String deleteNotification(Principal principal,
			@RequestParam(value = "messageId", required = true) Long messageId, RedirectAttributes redirectAttributes) {
		User currentUser = userService.getUserByEmail(principal.getName());
		messageService.deleteNotification(messageId, currentUser);
		redirectAttributes.addFlashAttribute("infoMessage", "Nachricht erfolgreich gelöscht");
		return "redirect:/myinbox";
	}
	
	/**
	 * This mapping method deletes a invitation message from the database completely.
	 * @param principal
	 * @param messageId
	 * @return
	 */
	@RequestMapping(value = "/deleteInvitation", method = RequestMethod.GET)
	public String deleteInvitation(Principal principal,
			@RequestParam(value = "messageId", required = true) Long messageId, RedirectAttributes redirectAttributes) {
		User currentUser = userService.getUserByEmail(principal.getName());
		messageService.deleteNotification(messageId, currentUser);
		redirectAttributes.addFlashAttribute("infoMessage", "Nachricht erfolgreich gelöscht");
		return "redirect:/myinbox";
	}

}