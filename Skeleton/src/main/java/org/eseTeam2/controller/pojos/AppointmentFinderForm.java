package org.eseTeam2.controller.pojos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.eseTeam2.model.User;
import org.jsoup.Jsoup;


/**
 * This class is used to create Appointments, It contains all the necessary parameters to create an Appointment Entity from it
 * 
 * @author Icewater
 *
 */
public class AppointmentFinderForm {
	
    @Size(min=1, message="Datum Feld darf nicht leer sein")
	private String appointmentDate;
	
	private Long adId;
	
	private User adOwner;
	
	@Size(min=1, message=" Beginn Feld darf nicht leer sein. ")
	private String startTime;
	
	@Size(min=1, message=" Ende Feld darf nicht leer sein.")
	private String endTime;
	
	private String blockLength;
	//@Size(min=1, message=" Weitere infos sollte nicht ganz leer sein. Gib doch den Bewerbern ein paar infos über den Ablauf :)")
	private String additionalInfosForTheVisitors;
	
	private List<Long> adAppointmentIds;

	
	

	public String getBlockLength() {
		return blockLength;
	}

	public void setBlockLength(String blockLength) {
		this.blockLength = blockLength;
	}

	public String getAdditionalInfosForTheVisitors() {
		return additionalInfosForTheVisitors;
	}

	public void setAdditionalInfosForTheVisitors( String additionalInfosForTheVisitors) {
		this.additionalInfosForTheVisitors = Jsoup.parse(additionalInfosForTheVisitors).text();
	}

	public Long getAdId() {
		return adId;
	}

	public void setAdId(Long adId) {
		this.adId = adId;
	}

	public User getAdOwner() {
		return adOwner;
	}

	public void setAdOwner(User adOwner) {
		this.adOwner = adOwner;
	}

	

	public List<Long> getAdAppointmentIds() {
	    return adAppointmentIds;
	}

	public void setAdAppointmentIds(List<Long> adAppointmentIds) {
	    this.adAppointmentIds = adAppointmentIds;
	}

	public String getEndTime() {
	    return endTime;
	}

	public void setEndTime(String endTime) {
	    this.endTime = endTime;
	}

	public String getStartTime() {
	    return startTime;
	}

	public void setStartTime(String startTime) {
	    this.startTime = startTime;
	}

	public String getAppointmentDate() {
	    return appointmentDate;
	}

	public void setAppointmentDate(String appointmentDate) {
	    this.appointmentDate = appointmentDate;
	}

	
}
