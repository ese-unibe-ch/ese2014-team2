package org.eseTeam2.model.dao;

import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Bookmark;
import org.eseTeam2.model.User;
import org.springframework.data.repository.CrudRepository;

public interface BookmarkDao extends CrudRepository<Bookmark, Long>{
    public Bookmark findOneByBookmarkerAndAd(User bookmarker, Advertisement ad);

}