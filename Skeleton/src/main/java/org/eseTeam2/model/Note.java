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
public class Note {

    @Id
    @GeneratedValue
    private Long id;

    @Column(length = 50000)
    private String text;

    @ManyToOne
    private User applicant;

    @ManyToOne
    private Appointment appointment;

    public String getText() {
	return text;
    }

    public void setText(String text) {
	this.text = text;
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public User getApplicant() {
	return applicant;
    }

    public void setApplicant(User applicant) {
	this.applicant = applicant;
    }

    public Appointment getAppointment() {
	return appointment;
    }

    public void setAppointment(Appointment appointment) {
	this.appointment = appointment;
    }

}
