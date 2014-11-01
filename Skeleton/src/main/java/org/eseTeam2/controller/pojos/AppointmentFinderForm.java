package org.eseTeam2.controller.pojos;

import java.util.ArrayList;

import org.eseTeam2.model.User;

public class AppointmentFinderForm {
	
	private ArrayList<String> appointmentDate;
	
	private Long adId;
	
	private User adOwner;
	
	private ArrayList<String> startTimes;
	
	private ArrayList<String> endTimes;
	
	private String blockLength;
	
	private String additionalInfosForTheVisitors;

	public ArrayList<String> getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(ArrayList<String> appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

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
}
