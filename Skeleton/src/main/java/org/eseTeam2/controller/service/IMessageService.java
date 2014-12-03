package org.eseTeam2.controller.service;

import java.util.ArrayList;

import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.controller.pojos.MessageForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Message;
import org.eseTeam2.model.User;

public interface IMessageService {
	public void sendMessage(MessageForm messageForm);
	
	public Message findOneMessage(Long id);

	public void deleteRecipientMessage(Long messageId, User currentUser);

	public void deleteSenderMessage(Long messageId, User currentUser);

	public void deleteNotification(Long messageId, User currentUser);
	
	public void saveMessage(Message message);
	
	public boolean findTheMessageOnTheUser(User user, Long messageId);
	
	public Message findBySenderAndId(User sender, Long id);
	
	public Message findByRecipientAndId(User recipient, Long id);

	public Message findByNotificationsAndId(User currentUser, Long messageId);

	public Message findByAppointmentInvitationsAndId(User currentUser,
		Long messageId);
	
}
