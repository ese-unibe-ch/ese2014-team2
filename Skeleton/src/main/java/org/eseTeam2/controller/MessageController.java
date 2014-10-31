package org.eseTeam2.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.eseTeam2.PictureManager;
import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.MessageForm;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IMessageService;
import org.eseTeam2.controller.service.IUserDataService;
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

@Controller
public class MessageController {

	
    @Autowired
    private IAdDataService adService;

    @Autowired 
    private IMessageService messageService;
    
    @Autowired 
    private IUserDataService userService;
    
	
	  @RequestMapping(value = "/sendMessageFromAd", method = RequestMethod.GET)
	    public ModelAndView sendMessageFromAd(@RequestParam(value = "adId", required = true) Long adId, Principal principal ) {
	    	
	    	User currentUser = userService.getUserByEmail(principal.getName());
	    	
	    	    	
	    	ModelAndView model = new ModelAndView("sendMessage");
	    	model.addObject("sender", currentUser);
	    	model.addObject("reciever", adService.getAdvertisement(adId).getCreator());
	    	model.addObject("messageForm", new MessageForm());  
	    	return model;
	    }
	  
	  @RequestMapping(value = "/sendNewMessage", method = RequestMethod.GET)
	    public ModelAndView sendNewMessage( Principal principal ) {
	    	
	    	User currentUser = userService.getUserByEmail(principal.getName());
	    	
	    	    	
	    	ModelAndView model = new ModelAndView("sendNewMessageToUser");
	    	model.addObject("sender", currentUser);
	    	
	    	return model;
	    }
	  
	  @RequestMapping(value = "/replyToMessage", method = RequestMethod.GET)
	    public ModelAndView reply( @RequestParam(value = "messageId", required = true) Long messageId, Principal principal ) {
	    	
	    	User currentUser = userService.getUserByEmail(principal.getName());
	    	Message messageToReplyTo = messageService.findOneMessage(messageId);
	    	User authorOfReceivedMessage = messageToReplyTo.getSender();
	    	
	    	    	
	    	ModelAndView model = new ModelAndView("reply");
	    	model.addObject("messageForm", new MessageForm());
	    	model.addObject("sender", currentUser);
	    	model.addObject("recipient", authorOfReceivedMessage);
	    	model.addObject("message", messageToReplyTo);
	    	
	    	return model;
	    }
	  
	  
	  @RequestMapping(value = "/send", method = RequestMethod.POST)
		public ModelAndView send(@Valid MessageForm messageForm, Principal principal) {
		  
		  User currentUser = userService.getUserByEmail(principal.getName());
		  messageForm.setSender(currentUser);
		  messageService.sendMessage(messageForm);
		  	
		  	ModelAndView model = new ModelAndView("show");
		  	
			return model;
			
		
	  }
	  
	  @RequestMapping("/inboxShow/{action}")
	  public String message(Model model, @PathVariable String action ) {
		  if ( action.equals("showSent"))
			  return "redirect:/myinbox?showSent=true";
		  if ( action.equals("showReceived"))
		  	return "redirect:/myinbox?showReceived=true";
		  	
		  if(action.equals("publicQuestion"))
			  return "redirect:/myinbox?showQuestion=true";
		  
		  return "redirect:/inbox";
	    	
	    	
	    }
	  
	  @RequestMapping(value = "/myinbox", method = RequestMethod.GET)
	    public ModelAndView inbox(Principal principal) {
	    	
	    	User currentUser = userService.getUserByEmail(principal.getName());
	    	
	    	ModelAndView model = new ModelAndView("inbox");
	    	model.addObject("receivedMessages", currentUser.getRecipient());
	    	model.addObject("sentMessages", currentUser.getSender());
	    	model.addObject("user", currentUser);
	    	return model;
	    }
	    
	  
	  
}
