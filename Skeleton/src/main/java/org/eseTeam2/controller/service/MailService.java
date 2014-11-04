package org.eseTeam2.controller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService implements IMailService {
	
	
	 @Autowired
	 private JavaMailSender mailSender;

	public void sendEmail(String recipientEmail, String message,String title) {
		
	 
         
         
        // creates a simple e-mail object
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientEmail);
        email.setSubject(title);
        email.setText(message);
         
        // sends the e-mail
        mailSender.send(email);
		
	}

}
