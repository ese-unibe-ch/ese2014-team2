package org.eseTeam2.controller.pojos;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.eseTeam2.model.User;

/**
 * Message form, contains all the information used to create a new Message object.
 * @author Icewater
 *
 */
public class ApplicantForm {


    private Long id;
    private String title;
    private String message;

    private User interessent;
	private Long adId;

	private String bisWann;
   // private User recipient;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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



	public User getInteressent() {
		return interessent;
	}

	public void setInteressent(User interessent) {
		this.interessent = interessent;
	}

	public Long getAdId() {
		return adId;
	}

	public void setAdId(Long adId) {
		this.adId = adId;
	}

	

	public String getBisWann() {
		return bisWann;
	}

	public void setBisWann(String bisWann) {
		this.bisWann = bisWann;
	}

	
		
    
}
