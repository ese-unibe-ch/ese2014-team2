package org.eseTeam2.controller.service;

import java.util.List;

import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Bookmark;
import org.eseTeam2.model.User;
import org.eseTeam2.model.dao.AdvertisementDao;
import org.eseTeam2.model.dao.BookmarkDao;
import org.eseTeam2.model.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookmarkService implements IBookmarkService{

    @Autowired
    AdvertisementDao adDao;
    
   @Autowired
   BookmarkDao bookmarkDao;
    
    @Autowired
    UserDao  userDao;
    
    public void bookmarkAd(Long adId, User currentUser) {
	Advertisement adToBMark = adDao.findOne(adId);
	
	Bookmark bookmark = new Bookmark();
	bookmark.setAd(adToBMark);
	bookmark.setBookmarker(currentUser);
	
	
	
	
	List<Bookmark> bookmarks = currentUser.getBookmarks();
	
	bookmarks.add(bookmark);
	currentUser.setBookmarks(bookmarks);
	
	bookmarkDao.save(bookmark);
	
	userDao.save(currentUser);
	
    }
    
    public void deleteBookmark(Long bookmarkId) {
	
	//List<Bookmark> bookmarks = currentUser.getBookmarks();
	/*
	for ( int i = 0; i < bookmarks.size(); i ++) {
	    if ( bookmarks.get(i).getId() == bookmarkId)
		bookmarks.remove(i);
	} */
	//currentUser.setBookmarks(bookmarks);
	bookmarkDao.delete(bookmarkId);
	//userDao.save(currentUser);
	
	
    }

    public Bookmark findOneByAdAndUser(Advertisement adId, User userId) {
	return bookmarkDao.findOneByBookmarkerAndAd(userId, adId);
    }

    public Bookmark findOne(Long bookmarkId) {
	return bookmarkDao.findOne(bookmarkId);
    }
    


  

}
