package org.eseTeam2.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.eseTeam2.PictureManager;
import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.ApplicantForm;
import org.eseTeam2.controller.pojos.AppointmentFinderForm;
import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.controller.pojos.LoginForm;
import org.eseTeam2.controller.pojos.SignupForm;
import org.eseTeam2.controller.service.AdDataService;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IAppointmentService;
import org.eseTeam2.controller.service.IUserDataService;
import org.eseTeam2.controller.service.UserDataService;
import org.eseTeam2.exceptions.InvalidUserException;
import org.eseTeam2.model.AdApplication;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Bookmark;
import org.eseTeam2.model.Picture;
import org.eseTeam2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * This controller class is responsible for handling all the Mappings which
 * concern Advertisements
 * 
 * @author Icewater
 *
 */

@Controller
public class AdController {

    @Autowired
    private IAdDataService adService;
    @Autowired
    private IUserDataService userService;

    @Autowired
    private ServletContext servletContext;

    @Autowired
    private IAppointmentService appointmentService;

    public final String PICTURE_LOCATION = "/img/adPictures";

    /**
     * This mapping method is used to redirects the user to an overview over all
     * ads. Takes in the filteredAds (All Ads filtered by Filter.jsp or
     * Smallfilter.jsp) and prints them out on the ads overview page
     * 
     * @param filteredAds
     *            The ads which are filtered to the users desires.
     * @return
     */
    @RequestMapping(value = "/ads", method = RequestMethod.GET)
    public ModelAndView showAds(
	    @ModelAttribute("adsParam") ArrayList<Advertisement> filteredAds) {
	ModelAndView model = new ModelAndView("ads");
	// gives in the filter, so the user can filter on the ads page.
	model.addObject("filterForm", new FilterForm());
	// looks if the ads were already filtered on the index page
	model.addObject("ads", filteredAds);

	return model;

    }

    /**
     * If the user doesnt filter ads on the mainpage, this mapping method
     * redirects him to all ads.
     * 
     */
    @RequestMapping("/unfilteredAds")
    public ModelAndView showUnfilteredAds() {

	ModelAndView model = new ModelAndView("ads");
	// gives in the filter, so the user can filter on the ads page.
	model.addObject("filterForm", new FilterForm());
	// looks if the ads were already filtered on the index page

	model.addObject("ads", adService.getAds());

	return model;

    }

    /**
     * This Mapping method executes when a User wants to place an ad. it
     * redirects him to the place a new ad page.
     * 
     * @return
     */
    @RequestMapping(value = "/placead", method = RequestMethod.GET)
    public ModelAndView createAd() {
	ModelAndView model = new ModelAndView("placead");
	model.addObject("adForm", new AdForm());
	return model;
    }
    
    
    /**
     * This Mapping method executes when a User wants to place an ad. it
     * redirects him to the place a new ad page.
     * 
     * @return
     */
    @RequestMapping(value = "/editAd", method = RequestMethod.GET)
    public ModelAndView editAd(@RequestParam(value = "adId", required = true) Long adId, @ModelAttribute("infoMessage") String message, Principal principal, RedirectAttributes redirectAttributes) {
	ModelAndView model = new ModelAndView("editAd");
	User currentUser = userService.getUserByEmail(principal.getName());
	
	if (adService.findByCreatorAndId(currentUser, adId) != null ) {
        	AdForm adForm = new AdForm();
        	Advertisement ad = adService.getAdvertisement(adId);
        	//preset textarea values
        	adForm.setDescription_ad(ad.getDescription_ad());
        	adForm.setDescription_room(ad.getDescription_room());
        	adForm.setDescription_us(ad.getDescription_us());
        	adForm.setWhoWeAreLookingFor(ad.getWhoWeAreLookingFor());
        	model.addObject("ad", ad);
        	model.addObject("infoMessage", message);
        	
        	model.addObject("adForm", adForm);
        	return model; }
	else {
	    redirectAttributes.addFlashAttribute("infoMessage", "Du versuchst das Ad von jemand anderem zu bearbeiten!!!!");
	    return new ModelAndView("redirect:/forbidden");
	    
	}
	    
    }

    /**
     * This mapping method executes after the user submitted the ad he wants to
     * place. Firstly it saves the pictures to the server using the
     * PictureManager class. It takes the multipart array and creates Pictures
     * from it and puts them into an ArrayList which will be used to save the
     * pictures into the database.
     * 
     * @param adForm
     *            returns the adForm which contains all the Data the user wants
     *            to have in his ad
     * @param result
     * @param redirectAttributes
     * @param principal
     *            Principal used to get the currentUser
     * @param files
     *            THis multipart array contains the pictures
     * @return
     */
    @RequestMapping(value = "/enlistad", method = RequestMethod.POST)
    public ModelAndView enlistad(@Valid AdForm adForm, BindingResult result,
	    RedirectAttributes redirectAttributes, Principal principal,
	    @RequestParam("image") MultipartFile[] files) {
	ModelAndView model;

	if (!result.hasErrors()) {
	    User creator = userService.getUserByEmail(principal.getName());
	    adForm.setCreator(creator);
	    PictureManager picmgr = new PictureManager();
	    String relativePath = PICTURE_LOCATION + "/"
		    + adForm.getCreator().getEmail();
	    String absolutePath = servletContext.getRealPath(relativePath);

	    // creates a filename for the uploaded file, containing the room
	    // price, the address of the ad and the city, just a random name,
	    // more will be added inside the
	    // picture manager.
	    String filename = String.valueOf(adForm.getRoomPrice())
		    + adForm.getAddress() + adForm.getCity();
	    // store pictures to the server and get picture names to store the
	    // paths in the DB afterwards.
	    ArrayList<String> pictureNames = (picmgr.uploadMultipleFile(
		    absolutePath, filename, files));

	    ArrayList<Picture> picturesToSave = new ArrayList<Picture>();

	    // create ArrayList containing 4 pictures, one of which has the flag
	    // " main picture"
	    if (!pictureNames.isEmpty()) {
		for (int i = 0; i < pictureNames.size(); i++) {
		    Picture picTmp = new Picture();
		    try {
			if (pictureNames.get(i) != null) {
			    picTmp.setRelativeFilePath(relativePath
				    + (pictureNames.get(i).replace("\\", "/")));
			    picTmp.setAbsoluteFilePath(absolutePath
				    + pictureNames.get(i));
			    if (i == 0)
				picTmp.setIsMainPic(true);
			    else
				picTmp.setIsMainPic(false);

			    picturesToSave.add(picTmp);
			}

		    } catch (Exception d) {
		    }
		}
	    }

	    // save ad and pictures to database.
	    adService.saveFrom(adForm, picturesToSave);
	    
	    redirectAttributes.addFlashAttribute("infoMessage", "dein ad wurde erfolgreich erstellt.");
	    model = new ModelAndView("redirect:/myads");
	} else {
	    model = new ModelAndView("placead");
	    // model.addObject("newAdForm", new AdForm());
	}
	return model;
    }
    
    /**
     * This mapping method is used to edit an ad. Takes a valid adForm and updates the existing ad with the given parameters.
     */
    @RequestMapping(value = "/submitEditAd", method = RequestMethod.POST)
    public ModelAndView submitEditAd(@Valid AdForm adForm, BindingResult result,
	    RedirectAttributes redirectAttributes, Principal principal, @RequestParam(value = "adId", required = true) Long adId) {
	ModelAndView model;
	User currentUser = userService.getUserByEmail(principal.getName());
	
	if (adService.findByCreatorAndId(currentUser, adId) != null ) {
        	if (!result.hasErrors()) {
        	  
        	    adService.editAd(adForm, adId);
        
        	    
        
        	    model= new ModelAndView("redirect:/myads");
        	    redirectAttributes.addFlashAttribute("infoMessage", "Dein ad wurde erfolgreich bearbeitet");
        	} else {
        	    model = new ModelAndView("redirect:/editAd?adId="+adId);
        	    redirectAttributes.addFlashAttribute("infoMessage", "Bitte  fülle alle Felder korrekt aus");
        	    // model.addObject("newAdForm", new AdForm());
        	}
        	return model; }
	else {
	    redirectAttributes.addFlashAttribute("infoMessage", "Du versuchst gerade das Ad von jemand anderem zu editieren!!");
	    return new ModelAndView("redirect:/forbidden");
	}
    }

    /**
     * This mapping method is prompting an User to a details page of an ad. The
     * page prints out all the parameters of an Advertisement object.
     * 
     * @param adId
     *            Requests the Ad id of the desired ad.
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping(value = "/adprofile", method = RequestMethod.GET)
    public ModelAndView showAdId(
	    @RequestParam(value = "adId", required = true) Long adId,
	    HttpServletRequest request, HttpServletResponse response,
	    HttpSession session, @ModelAttribute("infoMessage") String message,
	    Principal principal) {
	
	Boolean isBookmarked = null;
	List<Bookmark> bookmarks = null;
	
	try {
	    User currentUser = userService.getUserByEmail(principal.getName());
	    bookmarks = currentUser.getBookmarks();
	    isBookmarked = false;
	   

	} catch (NullPointerException d) {
	    bookmarks = new ArrayList<Bookmark>();

	}
	
	 if (!bookmarks.isEmpty()) {
		for (Bookmark bookmark : bookmarks) {
		    if (bookmark.getAd().getId() == adId)
			isBookmarked = true;
		    else
			isBookmarked = false;
		}
	    }
	 
	ModelAndView model = new ModelAndView("adprofile");
	Set<Picture> pictures = null;
	Picture mainPic = null;
	

	if (adService.getPicturesOfAd(adId) != null)
	    pictures = adService.getPicturesOfAd(adId);
	if (adService.getAdMainPic(adId) != null)
	    mainPic = adService.getAdMainPic(adId);

	model.addObject("newAdProfile", adService.getAdvertisement(adId));
	model.addObject("pictures", pictures);
	model.addObject("bookmarked", isBookmarked);
	model.addObject("mainPic", mainPic);
	
	model.addObject("infoMessage", message);

	return model;
    }

    /**
     * This mapping method is used to delete an Ad. It takes the ad id, and
     * deletes the ad by Id from the database. Therefore it will delete the ad
     * from the list of the users ads and from the ads table.
     * 
     * @param adId
     *            the ad to delete
     * @param request
     * @param response
     * @param session
     * @param principal
     * @return
     */
    @RequestMapping(value = "/deleteAd", method = RequestMethod.GET)
    public String deleteAd(
	    @RequestParam(value = "adId", required = true) Long adId,
	    HttpServletRequest request, HttpServletResponse response,
	    HttpSession session, Principal principal, RedirectAttributes redirectAttributes) {

	User currentUser = userService.getUserByEmail(principal.getName());
	
	if (adService.findByCreatorAndId(currentUser, adId) != null ) {
	    adService.deleteOneAd(adId, currentUser);
	    redirectAttributes.addFlashAttribute("infoMessage", "Dein ad wurde erfolgreich gelöscht"); 

	    return "redirect:/myads";}
	else {
	    redirectAttributes.addFlashAttribute("infoMessage", "Du versuchst das Ad von jemand anderem zu löschen!!");
	    return "redirect:/forbidden";
	}
    }

    /**
     * this mapping method is a helper method to print out the images on the ad
     * profile. It is a workaround, because somehow the printing by the filepath
     * is not working. therefore it creates a bytearray outputstream and streams
     * it to the jsp page.
     * 
     * @param response
     * @param picId
     * @throws IOException
     */
    @RequestMapping(value = "/getUserImage/{id}")
    public void getUserImage(HttpServletResponse response,
	    @PathVariable("id") long picId) throws IOException {
	PictureManager picmgr = new PictureManager();
	String relativeFilepath = adService.getPicture(picId);
	String absoluteFilepath = servletContext.getRealPath(relativeFilepath);
	byte[] picture = picmgr.getByteArrayFromPath(absoluteFilepath);

	response.setContentType("image/jpeg");
	String path = adService.getPicture(picId);
	InputStream in1 = new ByteArrayInputStream(picture);
	IOUtils.copy(in1, response.getOutputStream());

    }

}
