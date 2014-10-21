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

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.eseTeam2.controller.pojos.AdForm;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdController {

	@Autowired
	private IAdDataService adService;

	@RequestMapping(value = "/placead", method = RequestMethod.GET)
	public ModelAndView createAd() {
		ModelAndView model = new ModelAndView("placead");
		model.addObject("newAdForm", new AdForm());
		return model;
	}

	
	 @RequestMapping(value = "/enlistad", method = RequestMethod.POST)
	    public ModelAndView enlistad(@Valid AdForm adForm, BindingResult result,
				RedirectAttributes redirectAttributes, @RequestParam("image") MultipartFile[] files ) {
		
		 
		 
		 
		try {
			if(!files[0].isEmpty())
				adForm.setImg_one(files[0].getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(!files[1].isEmpty())
			adForm.setImg_two(files[1].getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(!files[2].isEmpty())
			adForm.setImg_three(files[2].getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(!files[3].isEmpty())
			adForm.setImg_four(files[3].getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		
		Set<Picture> pic = adService.getAdvertisement(adId).getPictures();
		ArrayList<Long> pics= new ArrayList();
	
	
		for ( Picture pict : pic) {
			if (pict.getContent() != null)
				pics.add(pict.getId());			
		}
		Long mainPic = pics.remove(0);
		
		ModelAndView model = new ModelAndView("adprofile");
		model.addObject("newAdProfile", adService.getAdvertisement(adId));
		model.addObject("pictureIds", pics);
		model.addObject("mainPic", mainPic);
		 
		return model;
	}

	@RequestMapping(value = "/ads", method = RequestMethod.GET)
	public ModelAndView showAds() {
		ModelAndView model = new ModelAndView("ads");
		model.addObject("ads", adService.getAds());
		return model;

	}

	@RequestMapping(value = "/placemate", method = RequestMethod.GET)
	public ModelAndView placeYourself() {
		ModelAndView model = new ModelAndView("placeyourself");
		model.addObject("ads", adService.getAds());
		return model;

	}
	
	@RequestMapping(value="/getUserImage/{id}")
	public void getUserImage(HttpServletResponse response , @PathVariable("id") long picId) throws IOException{

	 response.setContentType("image/jpeg");
	  byte[] buffer = adService.getPicture(picId);
	  InputStream in1 = new ByteArrayInputStream(buffer);
	  IOUtils.copy(in1, response.getOutputStream());        
	}
}
    
 




