package org.eseTeam2.model.dao;


import org.eseTeam2.model.Note;
import org.springframework.data.repository.CrudRepository;

public interface NoteDao extends CrudRepository<Note, Long>{

}
