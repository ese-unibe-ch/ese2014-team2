package org.eseTeam2.controller.service;

import java.util.HashSet;
import java.util.Set;

import org.eseTeam2.controller.pojos.MessageForm;
import org.eseTeam2.model.Message;
import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.MessageDao;
import org.eseTeam2.model.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService implements IMessageService {
	
	@Autowired
	MessageDao messageDao;
	
	@Autowired
	UserDao userDao;

	public void sendMessage(MessageForm messageForm) {
		
		
		Message message = new Message();
		User recipient = userDao.findOne(messageForm.getRecipientId());
		User sender = messageForm.getSender();
		
		
		Set<Message> recipientMessages = new HashSet<Message>();
		try {
			recipientMessages = recipient.getRecipient();
		}
		catch (NullPointerException d){}
		
		
		Set<Message> senderMessages = new HashSet<Message>();
		try {
			senderMessages = sender.getSender();
		}
		catch (NullPointerException d) {}
		
		
		
		message.setMessageText(messageForm.getMessage());
		message.setTitle(messageForm.getTitle());
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
	
	public Message findOneMessage (Long id) {
		return messageDao.findOne(id);
	}

}
