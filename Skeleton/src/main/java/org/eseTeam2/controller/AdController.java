package org.eseTeam2.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.controller.pojos.LoginForm;
import org.eseTeam2.controller.pojos.SignupForm;
import org.eseTeam2.controller.service.AdDataService;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.UserDataService;
import org.eseTeam2.exceptions.InvalidUserException;
import org.eseTeam2.model.Picture;
import org.eseTeam2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
	private ServletContext servletContext;

	public final String PICTURE_LOCATION = "/img/adPictures";

	@RequestMapping(value = "/placead", method = RequestMethod.GET)
	public ModelAndView createAd() {
		ModelAndView model = new ModelAndView("placead");
		model.addObject("newAdForm", new AdForm());
		return model;
	}

	@RequestMapping(value = "/enlistad", method = RequestMethod.POST)
	public ModelAndView enlistad(@Valid AdForm adForm, BindingResult result,
			RedirectAttributes redirectAttributes,
			@RequestParam("image") MultipartFile[] files) {

		PictureManager picmgr = new PictureManager();
		String path = servletContext.getRealPath(PICTURE_LOCATION);
		String filename = String.valueOf(adForm.getRoomPrice())+adForm.getAddress()+adForm.getOrt();
		
		ArrayList<String> pictures = (picmgr.uploadMultipleFile(path, filename, files));
				
//<img src="getUserImage/ <c:out value="${pics}"/>" width="400" height="400" >
		try {
			if (pictures.get(0)!= null)
				adForm.setImg_one(pictures.get(0));
		} catch (Exception e) {
		}
		try {
			if (pictures.get(1)!= null)
				adForm.setImg_two(pictures.get(1));
		} catch (Exception e) {
		}
		try {
			if (pictures.get(2) != null)
				adForm.setImg_three(pictures.get(2));
		} catch (Exception e) {
		}
		try {
			if (pictures.get(3) != null)
				adForm.setImg_four(pictures.get(3));
		} catch (Exception e) {
		}

		

		ModelAndView model;
	
		adService.saveFrom(adForm);
		
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
		model.addObject("newAdProfile", adService.getAdvertisement(adId));
		model.addObject("pictureIds", adService.getAdPictureIds(adId));
		model.addObject("mainPic", adService.getAdMainPic(adId));

		return model;
	}

	@RequestMapping(value = "/ads", method = RequestMethod.GET)
	public ModelAndView showAds() {
		ModelAndView model = new ModelAndView("ads");
		model.addObject("filterForm", new FilterForm());
		model.addObject("ads", adService.getAds());
		return model;

	}

	@RequestMapping(value = "/placemate", method = RequestMethod.GET)
	public ModelAndView placeYourself() {
		ModelAndView model = new ModelAndView("placeyourself");
		model.addObject("ads", adService.getAds());
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
	
	

}
