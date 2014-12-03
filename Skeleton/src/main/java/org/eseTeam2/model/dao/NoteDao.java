package org.eseTeam2.model.dao;


import org.eseTeam2.model.Appointment;
import org.eseTeam2.model.Note;
import org.eseTeam2.model.User;
import org.springframework.data.repository.CrudRepository;

public interface NoteDao extends CrudRepository<Note, Long>{
    public Note findOneByApplicantAndAppointment(User applicant, Appointment appointment);
    

}
