package org.eseTeam2.model.dao;

import org.eseTeam2.model.Appointment;
import org.springframework.data.repository.CrudRepository;

public interface AppointmentDao extends CrudRepository<Appointment,Long>{

}
