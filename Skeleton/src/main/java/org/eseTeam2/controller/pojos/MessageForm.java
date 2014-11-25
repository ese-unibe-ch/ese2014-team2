package org.eseTeam2.controller.pojos;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.eseTeam2.model.User;

/**
 * Message form, contains all the information used to create a new Message object.
 * @author Icewater
 *
 */
public class MessageForm {


    private Long id;
    private String title;
    private String message;

    private User sender;
    private Long recipientId;
    
    private Long adId;
   // private User recipient;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    
    


	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getRecipientId() {
		return recipientId;
	}

	public void setRecipientId(Long recipientId) {
		this.recipientId = recipientId;
	}

	public Long getAdId() {
	    return adId;
	}

	public void setAdId(Long adId) {
	    this.adId = adId;
	}

	
		
    
}
