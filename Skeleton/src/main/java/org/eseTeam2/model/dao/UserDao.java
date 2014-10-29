package org.eseTeam2.model.dao;

import org.eseTeam2.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserDao extends CrudRepository<User,Long> {
	public User findByEmail(String email);
}
