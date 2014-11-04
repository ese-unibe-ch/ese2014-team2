package org.eseTeam2.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.ArrayList;
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
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Picture;
import org.eseTeam2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
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
 * This controller class is responsible for handling all the Mappings which concern Advertisements
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
	 * This Mapping method executes when a User wants to place an ad. it redirects him to the place a new ad page.
	 * @return
	 */
	@RequestMapping(value = "/placead", method = RequestMethod.GET)
	public ModelAndView createAd() {
		ModelAndView model = new ModelAndView("placead");
		model.addObject("newAdForm", new AdForm());
		return model;
	}

	/**
	 * This mapping method executes after the user submitted the ad he wants to place.
	 * Firstly it saves the pictures to the server using the PictureManager class.
	 * It takes the multipart array and creates Pictures from it and puts them into an ArrayList which will be used to save the pictures into the database.
	 * 
	 * @param adForm  returns the adForm which contains all the Data the user wants to have in his ad
	 * @param result 
	 * @param redirectAttributes
	 * @param principal Principal used to get the currentUser
	 * @param files  THis multipart array contains the pictures
	 * @return
	 */
	@RequestMapping(value = "/enlistad", method = RequestMethod.POST)
	public ModelAndView enlistad(@Valid AdForm adForm, BindingResult result,
			RedirectAttributes redirectAttributes,Principal principal,
			@RequestParam("image") MultipartFile[] files) {
		
		
		User creator = userService.getUserByEmail(principal.getName());
		adForm.setCreator(creator);
		PictureManager picmgr = new PictureManager();
		String relativePath = PICTURE_LOCATION+"/"+adForm.getCreator().getEmail();
		String absolutePath = servletContext.getRealPath(relativePath);
		
		// creates a filename for the uploaded file, containing the room price, the address of the ad and the city, just a random name, more will be added inside the
		// picture manager.
		String filename = String.valueOf(adForm.getRoomPrice())+adForm.getAddress()+adForm.getCity();
		// store pictures to the server and get picture names to store the paths in the DB afterwards.
		ArrayList<String> pictureNames = (picmgr.uploadMultipleFile( absolutePath, filename, files));
		
		ArrayList<Picture> picturesToSave = new ArrayList<Picture>(); 
		
		// create ArrayList containing 4 pictures, one of which has the flag " main picture"
		if ( !pictureNames.isEmpty()) {
			for ( int i = 0; i < pictureNames.size(); i ++) {
				Picture picTmp = new Picture();
		try {
			if (pictureNames.get(i)!= null) {
				picTmp.setRelativeFilePath(relativePath+(pictureNames.get(i).replace("\\","/")));
				picTmp.setAbsoluteFilePath(absolutePath+pictureNames.get(i));
				if ( i == 0)
					picTmp.setIsMainPic(true);
				else
					picTmp.setIsMainPic(false);
				
				picturesToSave.add(picTmp);
			}	
				

		}
		catch (Exception d) {}
	}
		}

		ModelAndView model;
	   // save ad and pictures to database.
		adService.saveFrom(adForm, picturesToSave);
		
		model = new ModelAndView("show");
		return model;

	}
	/**
	 * This mapping  method is prompting an User to a details page of an ad. 
	 * The page shows all the criterias needd.
	 * @param adId  Requests the Ad id of the desired ad.
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/adprofile", method = RequestMethod.GET)
	public ModelAndView showAdId(
			@RequestParam(value = "adId", required = true) Long adId,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		
		// the model for this is the adprofile.jsp page
		ModelAndView model = new ModelAndView("adprofile");
		Set<Picture> pictures = adService.getPicturesOfAd(adId);
		Picture mainPic = adService.getAdMainPic(adId);
		model.addObject("newAdProfile", adService.getAdvertisement(adId));
		model.addObject("pictures", pictures);
		model.addObject("mainPic", mainPic);

		return model;
	}

	/**
	 * This mapping method is used to redirects the user to an overview over all ads.
	 * Takes in the filteredAds (All Ads filtered by Filter.jsp or Smallfilter.jsp) and prints them out on the ads overview page
	 * 
	 * @param filteredAds The ads which are filtered to the users desires.
	 * @return
	 */
	@RequestMapping(value = "/ads", method = RequestMethod.GET)
	public ModelAndView showAds( @ModelAttribute("adsParam") ArrayList<Advertisement> filteredAds) {
		ModelAndView model = new ModelAndView("ads");
		// gives in the filter, so the user can filter on the ads page.
		model.addObject("filterForm", new FilterForm());
		// looks if the ads were already filtered on the index page
		if ( filteredAds.isEmpty())
			model.addObject("ads", adService.getAds());
		else 
			model.addObject("ads", filteredAds);
		return model;

	}
	/**
	 * This mapping method redirects to the place yourself page. In development
	 * @return
	 */
	@RequestMapping(value = "/placemate", method = RequestMethod.GET)
	public ModelAndView placeYourself() {
		ModelAndView model = new ModelAndView("placeyourself");
		model.addObject("ads", adService.getAds());
		return model;

	}
	
	/**
	 * This mapping method is used to delete an Ad. It takes the ad id, and deletes the ad by Id from the database.
	 * Therefore it will delete the ad from the list of the users ads and from the ads table.
	 * @param adId the ad to delete
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
			HttpSession session,  Principal principal) {
		
		User currentUser = userService.getUserByEmail(principal.getName());
		adService.deleteOneAd(adId,currentUser);
	

		return "redirect:/myads";
	}
	
	/**
	 * This mapping method adds the user as an interessent to an advertisement.
	 * 
	 * @param adId which the user is interested in.
	 * @param request
	 * @param response
	 * @param session
	 * @param principal
	 * @return
	 */
	@RequestMapping (value ="/userInterested", method = RequestMethod.GET)
	public String interestedInAd (	@RequestParam(value = "adId", required = true) Long adId,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session,  Principal principal) {
		User currentUser = userService.getUserByEmail(principal.getName());
		
		appointmentService.addInteressent(currentUser, adId);
		
		
	
		return "redirect:/adprofile?adId="+adId;
	}
	
	/**
	 * This mapping method is used to print out all the interessents of an ad
	 * @param adId to get the interessents from
	 * @param request
	 * @param response
	 * @param session
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/showInteressents", method = RequestMethod.GET)
	public ModelAndView showInteressentsOfAd(
			@RequestParam(value = "adId", required = true) Long adId,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session,  Principal principal) {
		
		Advertisement ad = adService.getAdvertisement(adId);
		Set<User>interessents = ad.getInteressents();

	
		
	
		ModelAndView model = new ModelAndView("interessents");
		model.addObject("interessents", interessents);
		model.addObject("ad", ad);
		return model;
	}
	
	/**
	 * This mapping method is used to create an appointment for flat visiting. Redirects the user
	 * to the setAppointmentForAd page, where he can set the visit date.
	 * @param adId
	 * @param request
	 * @param response
	 * @param session
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/setzeBesichtigungstermin", method = RequestMethod.GET)
	public ModelAndView besichtigungsterminSetzen(
			@RequestParam(value = "adId", required = true) Long adId,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session,  Principal principal) {
		
		Advertisement ad = adService.getAdvertisement(adId);
		Set<User> interessents = ad.getInteressents();
			
	
		ModelAndView model = new ModelAndView("setAppointmentForAd");
		model.addObject("interessents", interessents);
		model.addObject("ad", ad);
		model.addObject("appointmentForm", new AppointmentFinderForm());
		return model;
	}
	
	/**
	 * this mapping method is a helper method to print out the images on the ad profile. It is a workaround, because somehow the printing by the
	 * filepath is not working. 
	 * therefore it creates a bytearray outputstream and streams it to the jsp page.
	 * @param response
	 * @param picId
	 * @throws IOException
	 */
	@RequestMapping(value = "/getUserImage/{id}")
	public void getUserImage(HttpServletResponse response,
			@PathVariable("id") long picId) throws IOException {
		PictureManager picmgr = new PictureManager();
		byte[] picture = picmgr.getByteArrayFromPath(adService.getPicture(picId));
		
		response.setContentType("image/jpeg");
		String path =   adService.getPicture(picId); 
		InputStream in1 = new  ByteArrayInputStream(picture); 
		IOUtils.copy(in1, response.getOutputStream());
		 
	}
	/**
	 * this mapping method is used when the user clicks on the send out appointments on the setAppointmentForAd.jsp page
	 * it sets the appointment, stores it in the database, updates all corresbonding entities and informs the people who are invited.
	 * @param appointmentForm
	 * @param result
	 * @param redirectAttributes
	 * @param principal
	 * @return
	 */
	@RequestMapping(value="/setAppointmentAndInform", method = RequestMethod.POST)
	public String setAppointmentDateAndInform (@Valid AppointmentFinderForm appointmentForm, BindingResult result,
	RedirectAttributes redirectAttributes,Principal principal) {
		
		appointmentForm.setAdOwner(userService.getUserByEmail(principal.getName()));
		appointmentService.sendOutAppointment(appointmentForm);
		return "redirect:/myads";
		
	}
	
	

}
