package org.eseTeam2.controller.service;

import org.eseTeam2.controller.pojos.ApplicantForm;
import org.eseTeam2.controller.pojos.AppointmentFinderForm;
import org.eseTeam2.model.AdApplication;
import org.eseTeam2.model.User;

public interface IAppointmentService {


	void sendOutAppointment(AppointmentFinderForm appointmentForm);

	void informAdOwner(User currentUser, Long appointmentId);

	void deleteInteressent(Long applicationId);

	void addInteressent(ApplicantForm applicantForm);

	AdApplication findOneApplication(Long applicationId);

}
