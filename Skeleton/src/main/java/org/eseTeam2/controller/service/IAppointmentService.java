package org.eseTeam2.controller.service;

import java.util.List;

import org.eseTeam2.controller.pojos.ApplicantForm;
import org.eseTeam2.controller.pojos.AppointmentFinderForm;
import org.eseTeam2.controller.pojos.NoteForm;
import org.eseTeam2.model.AdApplication;
import org.eseTeam2.model.Appointment;
import org.eseTeam2.model.User;

public interface IAppointmentService {


	void sendOutAppointment(AppointmentFinderForm appointmentForm);

	void acceptInvitation(User currentUser, Long appointmentId);

	void deleteInteressent(Long applicationId);

	void addInteressent(ApplicantForm applicantForm);

	AdApplication findOneApplication(Long applicationId);

	Appointment findOneAppointment(Long appointedAppointment);

	void rejectInvitation(User currentUser, Long appointmentId);


	void setNote(Long appointmentId, Long userId, String note);

	void saveAdApplication(AdApplication application);

	

}
