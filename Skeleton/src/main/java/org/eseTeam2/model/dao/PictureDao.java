package org.eseTeam2.model.dao;

import org.eseTeam2.model.Picture;
import org.eseTeam2.model.User;
import org.springframework.data.repository.CrudRepository;

public interface PictureDao extends CrudRepository<Picture,Long> {
}
