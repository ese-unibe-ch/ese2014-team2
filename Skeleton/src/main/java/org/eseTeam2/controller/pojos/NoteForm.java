package org.eseTeam2.controller.pojos;

public class NoteForm {
    
    private String note;
    
    private Long appointmentId;
    
    private Long userId;

    public Long getAppointmentId() {
	return appointmentId;
    }

    public void setAppointmentId(Long appointmentId) {
	this.appointmentId = appointmentId;
    }

    public Long getUserId() {
	return userId;
    }

    public void setUserId(Long userId) {
	this.userId = userId;
    }

    public String getNote() {
	return note;
    }

    public void setNote(String note) {
	this.note = note;
    }

}
