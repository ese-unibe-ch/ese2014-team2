package org.eseTeam2.model.dao;

import org.eseTeam2.model.Appointment;
import org.eseTeam2.model.AppointmentAccepted;
import org.eseTeam2.model.User;
import org.springframework.data.repository.CrudRepository;

public interface AppointmentAcceptedDao extends CrudRepository<AppointmentAccepted,Long>{

    AppointmentAccepted findByUserAndAppointment(User currentUser, Appointment appointment);

}
