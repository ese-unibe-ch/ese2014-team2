package org.eseTeam2.model;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Embeddable
public class Appointment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@OneToOne 
	private Advertisement ad;
	
	
	
	@ManyToMany 
	private List<User> invitations;
	
	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.REMOVE)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<AppointmentDate> appointmentDate;
	
	private String blockLength;
	
	private String additionalInfosForTheVisitors;

	public String getBlockLength() {
		return blockLength;
	}

	public void setBlockLength(String blockLength) {
		this.blockLength = blockLength;
	}

	public String getAdditionalInfosForTheVisitors() {
		return additionalInfosForTheVisitors;
	}

	public void setAdditionalInfosForTheVisitors(
			String additionalInfosForTheVisitors) {
		this.additionalInfosForTheVisitors = additionalInfosForTheVisitors;
	}

	public List<AppointmentDate> getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(List<AppointmentDate> appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public Advertisement getAd() {
		return ad;
	}

	public void setAd(Advertisement ad) {
		this.ad = ad;
	}

	public List<User> getInvitations() {
		return invitations;
	}

	public void setInvitations(List<User> invitations) {
		this.invitations = invitations;
	}

	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}






	
	

	
}
