package org.eseTeam2.controller.pojos;

import java.util.ArrayList;
import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.eseTeam2.model.User;


/**
 * This class is used to create Appointments, It contains all the necessary parameters to create an Appointment Entity from it
 * 
 * @author Icewater
 *
 */
public class AppointmentFinderForm {
	
	@Size(min=1)
	private ArrayList<String> appointmentDate;
	
	private Long adId;
	
	private User adOwner;
	
	@Size(min=1, message="fuchs is homo")
	private ArrayList<String> startTimes;
	
	@Size(min=1)
	private ArrayList<String> endTimes;
	
	private String blockLength;
	@Size(min=3, message="gugushjgjhghkjgljg jhjhglg özgluhguz")
	private String additionalInfosForTheVisitors;

	
	public ArrayList<String> getStartTimes() {
		return startTimes;
	}

	public void setStartTimes(ArrayList<String> startTimes) {
		this.startTimes = startTimes;
	}

	public ArrayList<String> getEndTimes() {
		return endTimes;
	}

	public void setEndTimes(ArrayList<String> endTimes) {
		this.endTimes = endTimes;
	}

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

	public ArrayList<String> getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(ArrayList<String> appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	
}
