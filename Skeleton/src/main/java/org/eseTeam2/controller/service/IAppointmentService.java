package org.eseTeam2.controller.service;

import org.eseTeam2.controller.pojos.AppointmentFinderForm;
import org.eseTeam2.model.User;

public interface IAppointmentService {

	void addInteressent(User currentUser, Long adId);

	void sendOutAppointment(AppointmentFinderForm appointmentForm);

}
