package org.eseTeam2.controller.service;

import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Bookmark;
import org.eseTeam2.model.User;

public interface IBookmarkService {
    
    public void bookmarkAd(Long adId, User currentUser);
    public void deleteBookmark(Long bookmarkId);
    public Bookmark findOneByAdAndUser(Advertisement advertisement, User user);
    public Bookmark findOne(Long bookmarkId);
   

}
