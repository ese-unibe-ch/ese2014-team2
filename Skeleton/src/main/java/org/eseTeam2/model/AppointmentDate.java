package org.eseTeam2.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class AppointmentDate {

    @Id
    @GeneratedValue
    private Long id;

    private String day;

    private String startHour;

    private String endHour;

    public String getStartHour() {
	return startHour;
    }

    public void setStartHour(String startHour) {
	this.startHour = startHour;
    }

    public String getEndHour() {
	return endHour;
    }

    public void setEndHour(String endHour) {
	this.endHour = endHour;
    }

    public String getDay() {
	return day;
    }

    public void setDay(String day) {
	this.day = day;
    }

}
