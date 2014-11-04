package org.eseTeam2.controller;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.controller.service.FilterLogicService;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IFilterLogicService;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.Picture;
import org.springframework.beans.PropertyAccessor;
import org.springframework.beans.PropertyAccessorFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ReflectionUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

/**
 * this controller class is responsible for all mappings related to filtering
 * advertisements.
 * 
 * @author Icewater
 *
 */
@Controller
public class FilterAdsController {

	@Autowired
	private IAdDataService adService;

	@Autowired
	private IFilterLogicService filterService;
	
	/**
	 * this mapping method triggers when the filter.jsp parameters are submitted. It takes a valid filterForm which contains all the 
	 * filter criteria and applies them with various helper methods, and finally gets back the filtered ads in form of an ArrayList<Advertisement>
	 * Redirects the user to the ads page containing the list. 
	 * @param filterForm 
	 * @param result
	 * @param redirectAttributes
	 * @return
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	@RequestMapping(value = "/filterAds", method = RequestMethod.POST)
	public String filterAds(@Valid FilterForm filterForm, BindingResult result,	RedirectAttributes redirectAttributes)throws IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {

		ArrayList<String> getters = filterService.getGetters();
		ArrayList<String> paramNames = filterService.getParamsOfFilterForm(getters);
		Advertisement adToCompare = filterService.getAdToCompare(getters,paramNames, filterForm);

		ArrayList<Advertisement> filteredAds = filterService.getAdsThatMatchTheFilter(adToCompare, getters);
		
		// used to redirect the filtered ads arraylist onto the /ads mapping ( AdController)
		redirectAttributes.addFlashAttribute("adsParam", filteredAds);

		return "redirect:/ads?showFilter=false";

	}

	/**
	 * This mapping method is the same as filter ads, but it is triggered with a smaller filter on the index.jsp page
	 * @param filterForm
	 * @param result
	 * @param redirectAttributes
	 * @return
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	@RequestMapping(value = "/filterAdsIndex", method = RequestMethod.POST)
	public String filterAdsIndex(@Valid FilterForm filterForm,
			BindingResult result, RedirectAttributes redirectAttributes)
			throws IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {

		ArrayList<Advertisement> filteredAds = filterService.getAdsThatMatchTheSmallFilter(filterForm.getCity(),
						filterForm.getRoomPrice());

		redirectAttributes.addFlashAttribute("adsParam", filteredAds);

		return "redirect:/ads?showFilter=false";

	}

	/**
	 * This helper mapping method is used to show/ hide the filter on the ads overview (ads.jsp) page.
	 * Therefore it uses a pathvariable
	 * @param model
	 * @param action
	 * @return
	 */
	@RequestMapping("/ads/{action}")
	public String message(Model model, @PathVariable String action) {
		if (action.equals("showFilter"))
			return "redirect:/ads?showFilter=true";
		if (action.equals("closeFilter"))
			return "redirect:/ads?showFilter=false";
		return "redirect:/ads?showFilter=false";

	}

}
