package org.eseTeam2.controller.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.eseTeam2.controller.pojos.MessageForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Message;
import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.MessageDao;
import org.eseTeam2.model.dao.UserDao;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * This service is handling all the logic to send Messages.
 * 
 * @author Icewater
 *
 */
@Service
public class MessageService implements IMessageService {

    @Autowired
    MessageDao messageDao;

    @Autowired
    IAdDataService adService;

    @Autowired
    UserDao userDao;

    /**
     * Creates a message Object from a given messageForm. Adds the message to
     * the User and updates all the corresponding database objects.
     */
    public void sendMessage(MessageForm messageForm) {
	Advertisement ad = new Advertisement();
	
	if (messageForm.getAdId() != null)
	    ad = adService.getAdvertisement(messageForm.getAdId());
	
	Message message = new Message();
	User recipient = userDao.findOne(messageForm.getRecipientId());
	User sender = messageForm.getSender();

	List<Message> recipientMessages = new ArrayList<Message>();
	try {
	    recipientMessages = recipient.getRecipient();
	} catch (NullPointerException d) {
	}

	List<Message> senderMessages = new ArrayList<Message>();
	try {
	    senderMessages = sender.getSender();
	} catch (NullPointerException d) {
	}

	if (messageForm.getAdId() != null) {
	    message.setMessageText("Ich habe eine Frage bezüglich des Ads <a href=\"adprofile?adId="+ messageForm.getAdId() + "\">" + ad.getTitle() + "</a> :  " + "<br>"
		    + Jsoup.parse(messageForm.getMessage()).text());
	} else {
	    message.setMessageText(Jsoup.parse(messageForm.getMessage()).text());
	}
	
	if( !messageForm.getTitle().equals(""))
	    message.setTitle(Jsoup.parse(messageForm.getTitle()).text());
	else 
	    message.setTitle("Kein Titel");
	    
	message.setSender(messageForm.getSender());
	message.setRecipient(recipient);

	recipientMessages.add(message);
	senderMessages.add(message);

	recipient.setRecipient(recipientMessages);
	sender.setSender(senderMessages);

	message = messageDao.save(message);

	recipient = userDao.save(recipient);
	sender = userDao.save(sender);

    }

 
    public Message findOneMessage(Long id) {
	return messageDao.findOne(id);
    }

    /**
     * deletes a message locally for an user. therefore it sets the recipient
     * deleted flag to true Doesnt delete the message in the database. Deletes
     * the message in the database, if all corresponding users have deleted the
     * message locally.
     */
    public void deleteRecipientMessage(Long messageId, User currentUser) {
	Message message = messageDao.findOne(messageId);
	message.setRecipientDeleted(true);

	if (message.isSenderDeleted() == true && message.isRecipientDeleted() == true)
	    messageDao.delete(message);
	else
	    messageDao.save(message);

    }

    /**
     * deletes a message locally for an user. therefore it sets the sender
     * deleted flag to true Doesnt delete the message in the database. Deletes
     * the message in the database, if all corresponding users have deleted the
     * message locally.
     */
    public void deleteSenderMessage(Long messageId, User currentUser) {
	Message message = messageDao.findOne(messageId);
	message.setSenderDeleted(true);
	if (message.isSenderDeleted() == true && message.isRecipientDeleted() == true)
	    messageDao.delete(message);
	else
	    messageDao.save(message);

    }

    public void deleteNotification(Long messageId, User currentUser) {
	messageDao.delete(messageId);

    }

    public void saveMessage(Message message) {
	messageDao.save(message);

    }

    /**
     * returns true if a message with that id is on the user.
     */
    public boolean findTheMessageOnTheUser(User user, Long messageId) {
	if (messageDao.findByAppointmentInvitationsAndId(user, messageId) != null
		|| messageDao.findByNotificationsAndId(user, messageId) != null
		|| messageDao.findByRecipientAndId(user, messageId) != null
		|| messageDao.findBySenderAndId(user, messageId) != null)
	    return true;
	return false;

    }

    public Message findBySenderAndId(User sender, Long id) {
	return messageDao.findBySenderAndId(sender, id);
    }

    public Message findByRecipientAndId(User recipient, Long id) {
	return messageDao.findByRecipientAndId(recipient, id);
    }

    public Message findByNotificationsAndId(User currentUser, Long messageId) {
	return messageDao.findByNotificationsAndId(currentUser, messageId);
    }

    public Message findByAppointmentInvitationsAndId(User currentUser, Long messageId) {
	return messageDao.findByAppointmentInvitationsAndId(currentUser, messageId);
    }

}
