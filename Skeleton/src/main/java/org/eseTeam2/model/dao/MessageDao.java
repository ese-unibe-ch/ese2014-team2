package org.eseTeam2.model.dao;

import org.eseTeam2.model.Message;
import org.springframework.data.repository.CrudRepository;

public interface MessageDao extends CrudRepository<Message, Long>{

}
