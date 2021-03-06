package org.eseTeam2.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.eseTeam2.PictureManager;
import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.AppointmentFinderForm;
import org.eseTeam2.controller.pojos.MessageForm;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IAppointmentService;
import org.eseTeam2.controller.service.IBookmarkService;
import org.eseTeam2.controller.service.IMessageService;
import org.eseTeam2.controller.service.IUserDataService;
import org.eseTeam2.model.AdApplication;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Appointment;
import org.eseTeam2.model.Bookmark;
import org.eseTeam2.model.Message;
import org.eseTeam2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * This controller handles all mappings related to appointments.
 * 
 * @author Icewater
 *
 */
@Controller
public class BookmarkController {

    @Autowired
    private IBookmarkService bookmarkService;

    @Autowired
    private IUserDataService userService;

    @Autowired
    private IAdDataService adService;
    
    /**
     * this mapping method is used to add an Advertisement to favorites. 
     * @param adId
     * @param principal
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/bookmarkAd", method = RequestMethod.GET)
    public String bookmarkAd(@RequestParam(value = "adId", required = true) Long adId, Principal principal, RedirectAttributes redirectAttributes) {
	bookmarkService.bookmarkAd(adId, userService.getUserByEmail(principal.getName()));

	redirectAttributes.addFlashAttribute("infoMessage", "Du hast das Ad erfolgreich zu deinen Favoriten hinzugefügt");

	return "redirect:adprofile?adId=" + adId;
    }

    
    /**
     * this mapping method is used to remove an advertisement from favorites. It is used from the Advertisement overview page.
     * @param adId Beloging to the bookmarked ad.
     * @param principal
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/unBookmarkAd", method = RequestMethod.GET)
    public String unBookmarkAd(@RequestParam(value = "adId", required = true) Long adId, Principal principal, RedirectAttributes redirectAttributes) {

	User currentUser = userService.getUserByEmail(principal.getName());
	Bookmark bookmark = bookmarkService.findOneByAdAndUser(adId, currentUser);

	bookmarkService.deleteBookmark(bookmark.getId());

	redirectAttributes.addFlashAttribute("infoMessage", "Du hast das Ad erfolgreich aus deinen Favoriten entfernt");

	return "redirect:adprofile?adId=" + adId;
    }
    
    /**
     * This mapping method is used to unbookmark an advertisement. It is triggered from the bookmarks overview page.
     * @param adId Advertisement id.
     * @param principal
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/unBookmarkAdFromBookmarks", method = RequestMethod.GET)
    public String unBookmarkAdFromBookmarks(@RequestParam(value = "adId", required = true) Long adId, Principal principal, RedirectAttributes redirectAttributes) {

	User currentUser = userService.getUserByEmail(principal.getName());
	Bookmark bookmark = bookmarkService.findOneByAdAndUser(adId, currentUser);

	bookmarkService.deleteBookmark(bookmark.getId());

	redirectAttributes.addFlashAttribute("infoMessage", "Du hast das Ad erfolgreich aus deinen Favoriten entfernt");

	return "redirect:/bookmarks";
    }

    /**
     * this mapping method creates an overview over all bookmarks of the user.
     * @param principal
     * @param redirectAttributes
     * @param message
     * @return
     */
    @RequestMapping(value = "/bookmarks", method = RequestMethod.GET)
    public ModelAndView bookmarks(Principal principal, RedirectAttributes redirectAttributes,@ModelAttribute("infoMessage") String message) {
	
	ModelAndView model = new ModelAndView("bookmarks");
	User currentUser = userService.getUserByEmail(principal.getName());
	List<Bookmark> userBookmarks = currentUser.getBookmarks();
        List<Advertisement> ads = new ArrayList<Advertisement>();
        
        for ( Bookmark bookm: userBookmarks) {
            ads.add(adService.getAdvertisement(bookm.getAd()));
        }
        
        model.addObject("ads", ads);
	model.addObject("bookmarks", userBookmarks);
	model.addObject("user", currentUser);
	model.addObject("infoMessage", message);

	return model;
    }

}