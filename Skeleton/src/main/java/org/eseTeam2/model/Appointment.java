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
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Embeddable
public class Appointment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

   
    private Long ad;

    @OneToMany(mappedBy = "appointment", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    @Fetch(value = FetchMode.SUBSELECT)
    private List<Note> userNotes;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<User> invitations;
    
    @OneToMany(mappedBy ="appointment", fetch =FetchType.EAGER, cascade = CascadeType.REMOVE)
    @Fetch(value = FetchMode.SUBSELECT)
    private List<AppointmentAccepted> whoAcceptedTheAppointment;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    private AppointmentDate appointmentDate;

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

    public void setAdditionalInfosForTheVisitors(String additionalInfosForTheVisitors) {
	this.additionalInfosForTheVisitors = additionalInfosForTheVisitors;
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

    public List<Note> getUserNotes() {
	return userNotes;
    }

    public void setUserNotes(List<Note> userNotes) {
	this.userNotes = userNotes;
    }

    public AppointmentDate getAppointmentDate() {
	return appointmentDate;
    }

    public void setAppointmentDate(AppointmentDate appointmentDate) {
	this.appointmentDate = appointmentDate;
    }

    public List<AppointmentAccepted> getWhoAcceptedTheAppointment() {
	return whoAcceptedTheAppointment;
    }

    public void setWhoAcceptedTheAppointment(List<AppointmentAccepted> whoAcceptedTheAppointment) {
	this.whoAcceptedTheAppointment = whoAcceptedTheAppointment;
    }

    public Long getAd() {
	return ad;
    }

    public void setAd(Long ad) {
	this.ad = ad;
    }

}
