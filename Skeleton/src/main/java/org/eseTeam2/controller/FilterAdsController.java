package org.eseTeam2.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import javax.validation.Valid;

import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IFilterLogicService;
import org.eseTeam2.model.Advertisement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
     * this mapping method triggers when the filter.jsp parameters are
     * submitted. It takes a valid filterForm which contains all the filter
     * criteria and applies them with various helper methods, and finally gets
     * back the filtered ads in form of an ArrayList<Advertisement> Redirects
     * the user to the ads page containing the list.
     * 
     * @param filterForm
     * @param result
     * @param redirectAttributes
     * @return
     * @throws IllegalAccessException
     * @throws IllegalArgumentException
     * @throws InvocationTargetException
     */
    @RequestMapping(value = "/filterAds", method = RequestMethod.POST)
    public String filterAds(@Valid FilterForm filterForm, BindingResult result, RedirectAttributes redirectAttributes)
	    throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {

	ArrayList<String> getters = filterService.getGettersOfFilterForm();
	ArrayList<String> paramNames = filterService.getParamsOfFilterForm(getters);
	Advertisement adToCompare = filterService.getAdToCompare(getters, paramNames, filterForm);

	ArrayList<Advertisement> filteredAds = filterService.getAdsThatMatchTheFilter(adToCompare, getters);

	// used to redirect the filtered ads arraylist onto the /ads mapping (
	// AdController)
	redirectAttributes.addFlashAttribute("adsParam", filteredAds);

	return "redirect:/ads";

    }

    /**
     * This mapping method is the same as filter ads, but it is triggered with a
     * smaller filter on the index.jsp page The small filter has lesser
     * parameters than the big filter, and is only needed when filtering on the
     * index page.
     * 
     * @param filterForm
     * @param result
     * @param redirectAttributes
     * @return
     * @throws IllegalAccessException
     * @throws IllegalArgumentException
     * @throws InvocationTargetException
     */
    @RequestMapping(value = "/filterAdsIndex", method = RequestMethod.POST)
    public String filterAdsIndex(@Valid FilterForm filterForm, BindingResult result,
	    RedirectAttributes redirectAttributes) throws IllegalAccessException, IllegalArgumentException,InvocationTargetException {

	if (!result.hasErrors()) {
	    ArrayList<Advertisement> filteredAds = filterService.getAdsThatMatchTheSmallFilter(filterForm.getCity(),filterForm.getRoomPrice());
	    redirectAttributes.addFlashAttribute("adsParam", filteredAds);
	    return "redirect:/ads";
	} else {
	    return "redirect:/";
	}

    }

}
