package org.eseTeam2.controller;

import java.security.Principal;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.eseTeam2.PictureManager;
import org.eseTeam2.controller.pojos.RoomieForm;
import org.eseTeam2.controller.service.IRoomieDataService;
import org.eseTeam2.controller.service.IUserDataService;
import org.eseTeam2.model.Picture;
import org.eseTeam2.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * This controller class maps all the Actions related to creating ads for roommates. 
 * @author Icewater
 *
 */
@Controller
public class RoomieController {

	@Autowired 
	private IUserDataService userService;

	@Autowired
	private IRoomieDataService roomieService;
	
	@Autowired
	private ServletContext servletContext;

	public final String PICTURE_LOCATION = "/img/roomiePictures";

	/**
	 * this mapping method triggers when someone wants to place a new person on the index.jsp page
	 * redirects the user to the placeyourself.jsp with a newRoomieForm to fill out.
	 * @return
	 */
	@RequestMapping(value = "/placeyourself", method = RequestMethod.GET)
	public ModelAndView createRoomie() {
		ModelAndView model = new ModelAndView("placeyourself");
		model.addObject("newRoomieForm", new RoomieForm());
		return model;
	}

	/**
	 * triggered when the newRoomieForm is submitted. 
	 * Creates a new "roomie" database object and stores the images.
	 * In decelopment
	 * @param roomieForm
	 * @param result
	 * @param redirectAttributes
	 * @param principal
	 * @param files
	 * @return
	 */
	@RequestMapping(value = "/enlistroomie", method = RequestMethod.POST)
	public ModelAndView enlistroomie(@Valid RoomieForm roomieForm, BindingResult result,
			RedirectAttributes redirectAttributes,Principal principal,
			@RequestParam("image") MultipartFile[] files) {
		
		
		User creator = userService.getUserByEmail(principal.getName());
		roomieForm.setCreator(creator);
		roomieForm.setFirstName(creator.getFirstName());
		roomieForm.setLastName(creator.getLastName());
		PictureManager picmgr = new PictureManager();
		//servletContext.get
		String relativePath = PICTURE_LOCATION+"/"+roomieForm.getCreator().getEmail();
		String absolutePath = servletContext.getRealPath(relativePath);
		
		String filename = roomieForm.getFirstName()+roomieForm.getLastName()+roomieForm.getCreator().getEmail();
		
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
	
		roomieService.saveFrom(roomieForm, picturesToSave);
		
		model = new ModelAndView("show");
		return model;

	}

	/*
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
	
	@RequestMapping(value = "/deleteAd", method = RequestMethod.GET)
	public String deleteAd(
			@RequestParam(value = "adId", required = true) Long adId,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session,  Principal principal) {
		
		User currentUser = userService.getUserByEmail(principal.getName());
		adService.deleteOne(adId,currentUser);
	

		return "redirect:/myads";
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
	*/
	
	

}
