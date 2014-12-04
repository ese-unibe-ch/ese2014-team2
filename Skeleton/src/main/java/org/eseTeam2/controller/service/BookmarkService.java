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

/**
 * this service class is used to handle all the logic concerning bookmarks.
 * 
 * @author Ice
 *
 */
@Service
public class BookmarkService implements IBookmarkService {

    @Autowired
    AdvertisementDao adDao;

    @Autowired
    BookmarkDao bookmarkDao;

    @Autowired
    UserDao userDao;

    /**
     * This method creates a bookmark object and adds it to the users bookmarks.
     * 
     */
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

	bookmarkDao.delete(bookmarkId);


    }

    public Bookmark findOneByAdAndUser(Advertisement adId, User userId) {
	return bookmarkDao.findOneByBookmarkerAndAd(userId, adId);
    }

    public Bookmark findOne(Long bookmarkId) {
	return bookmarkDao.findOne(bookmarkId);
    }

    public Iterable<Bookmark> findByAd(Advertisement ad) {
	return bookmarkDao.findByAd(ad);
    }

}
