package org.eseTeam2.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
@Embeddable
public class Message {

	@Id
	@GeneratedValue
	private Long id;

	private String title;
	
	private String messageText;

		
	@ManyToOne 
	private User sender;
	
	@ManyToOne 
	private User recipient;
	
	private boolean senderDeleted;
	private boolean recipientDeleted;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	
	

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public User getRecipient() {
		return recipient;
	}

	public void setRecipient(User recipient) {
		this.recipient = recipient;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public String getMessageText() {
		return messageText;
	}

	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}

	public boolean isSenderDeleted() {
		return senderDeleted;
	}

	public void setSenderDeleted(boolean senderDeleted) {
		this.senderDeleted = senderDeleted;
	}

	public boolean isRecipientDeleted() {
		return recipientDeleted;
	}

	public void setRecipientDeleted(boolean recipientDeleted) {
		this.recipientDeleted = recipientDeleted;
	}

	
}
