package org.eseTeam2.controller.service;

import java.util.ArrayList;

import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.controller.pojos.MessageForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Message;

public interface IMessageService {
	public void sendMessage(MessageForm messageForm);
	
	public Message findOneMessage(Long id);
	
}
