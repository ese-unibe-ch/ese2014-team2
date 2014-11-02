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
	
}
