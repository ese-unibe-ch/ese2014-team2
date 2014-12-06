package org.eseTeam2.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class AppointmentAccepted {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    private Appointment appointment;
    
    @ManyToOne
    private User user;
    
    private boolean accepted;
    
    private boolean rejected;

    public Appointment getAppointment() {
	return appointment;
    }

    public void setAppointment(Appointment appointment) {
	this.appointment = appointment;
    }

    public User getUser() {
	return user;
    }

    public void setUser(User user) {
	this.user = user;
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
