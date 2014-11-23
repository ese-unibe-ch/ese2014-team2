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

import org.hibernate.annotations.Columns;

@Entity
@Embeddable
public class Message {

	@Id
	@GeneratedValue
	private Long id;
	
	@Column( length=50000)
	private String title;
	
	
	@Column( length=50000)
	private String messageText;

		
	@ManyToOne 
	private User sender;
	
	@ManyToOne 
	private User recipient;
	
	@ManyToOne 
	private User notifications;
	
	@ManyToOne 
	private User appointmentInvitations;
	
	private boolean accepted;
	
	private boolean rejected;
	
	private Long appointedAppointment;
	
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

	public User getNotifications() {
		return notifications;
	}

	public void setNotifications(User notifications) {
		this.notifications = notifications;
	}

	public User getAppointmentInvitations() {
		return appointmentInvitations;
	}

	public void setAppointmentInvitations(User appointmentInvitations) {
		this.appointmentInvitations = appointmentInvitations;
	}

	public Long getAppointedAppointment() {
	    return appointedAppointment;
	}

	public void setAppointedAppointment(Long appointedAppointment) {
	    this.appointedAppointment = appointedAppointment;
	}

	public boolean isAccepted() {
	    return accepted;
	}

	public void setAccepted(boolean accepted) {
	    this.accepted = accepted;
	}

	public boolean isRejected() {
	    return rejected;
	}

	public void setRejected(boolean rejected) {
	    this.rejected = rejected;
	}

	


	
}
