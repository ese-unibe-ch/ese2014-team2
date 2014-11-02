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

	@RequestMapping(value = "/placead", method = RequestMethod.GET)
	public ModelAndView createAd() {
		ModelAndView model = new ModelAndView("placead");
		model.addObject("newAdForm", new AdForm());
		return model;
	}

	@RequestMapping(value = "/enlistad", method = RequestMethod.POST)
	public ModelAndView enlistad(@Valid AdForm adForm, BindingResult result,
			RedirectAttributes redirectAttributes,Principal principal,
			@RequestParam("image") MultipartFile[] files) {
		
		
		User creator = userService.getUserByEmail(principal.getName());
		adForm.setCreator(creator);
		PictureManager picmgr = new PictureManager();
		//servletContext.get
		String relativePath = PICTURE_LOCATION+"/"+adForm.getCreator().getEmail();
		String absolutePath = servletContext.getRealPath(relativePath);
		
		String filename = String.valueOf(adForm.getRoomPrice())+adForm.getAddress()+adForm.getCity();
		
		ArrayList<String> pictureNames = (picmgr.uploadMultipleFile( absolutePath, filename, files));
		
		ArrayList<Picture> picturesToSave = new ArrayList<Picture>(); 
		
		
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
	
		adService.saveFrom(adForm, picturesToSave);
		
		model = new ModelAndView("show");
		return model;

	}

	@RequestMapping(value = "/adprofile", method = RequestMethod.GET)
	public ModelAndView showAdId(
			@RequestParam(value = "adId", required = true) Long adId,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		
		//ArrayList<Picture> adPictures = adService.getAdPictures(adId);
		

		ModelAndView model = new ModelAndView("adprofile");
		Set<Picture> pictures = adService.getPicturesOfAd(adId);
		Picture mainPic = adService.getAdMainPic(adId);
		model.addObject("newAdProfile", adService.getAdvertisement(adId));
		model.addObject("pictures", pictures);
		model.addObject("mainPic", mainPic);

		return model;
	}

	@RequestMapping(value = "/ads", method = RequestMethod.GET)
	public ModelAndView showAds( @ModelAttribute("adsParam") ArrayList<Advertisement> filteredAds) {
		ModelAndView model = new ModelAndView("ads");
		
		model.addObject("filterForm", new FilterForm());
		if ( filteredAds.isEmpty())
			model.addObject("ads", adService.getAds());
		else 
			model.addObject("ads", filteredAds);
		return model;

	}

	@RequestMapping(value = "/placemate", method = RequestMethod.GET)
	public ModelAndView placeYourself() {
		ModelAndView model = new ModelAndView("placeyourself");
		model.addObject("ads", adService.getAds());
		return model;

	}
	
	@RequestMapping(value = "/deleteAd", method = RequestMethod.GET)
	public String deleteAd(
			@RequestParam(value = "adId", required = true) Long adId,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session,  Principal principal) {
		
		User currentUser = userService.getUserByEmail(principal.getName());
		adService.deleteOne(adId,currentUser);
	

		return "redirect:/myads";
	}
	
	
	@RequestMapping (value ="/userInterested", method = RequestMethod.GET)
	public String interestedInAd (	@RequestParam(value = "adId", required = true) Long adId,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session,  Principal principal) {
		User currentUser = userService.getUserByEmail(principal.getName());
		
		appointmentService.addInteressent(currentUser, adId);
		
		
	
		return "redirect:/adprofile?adId="+adId;
	}
	
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
		model.addObject("AppointmentForm", new AppointmentFinderForm());
		return model;
	}
	
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
	
	@RequestMapping(value="/setAppointmentAndInform", method = RequestMethod.POST)
	public ModelAndView setAppointmentDateAndInform (@Valid AppointmentFinderForm appointmentForm, BindingResult result,
	RedirectAttributes redirectAttributes,Principal principal) {
		return null;
		
	}
	
	

}
