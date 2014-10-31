package org.eseTeam2.controller;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Set;

import javax.validation.Valid;

import org.eseTeam2.controller.pojos.AdForm;
import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.controller.service.FilterLogicService;
import org.eseTeam2.controller.service.IAdDataService;
import org.eseTeam2.controller.service.IFilterLogicService;
import org.eseTeam2.model.Advertisement;
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

@Controller
public class FilterAdsController {

	@Autowired
	private IAdDataService adService;
	
	@Autowired
	private IFilterLogicService filterService;
	



	@RequestMapping(value = "/filterAds", method = RequestMethod.POST)
	public ModelAndView filterAds(@Valid FilterForm filterForm, BindingResult result,
			RedirectAttributes redirectAttributes) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		
		ArrayList<String> getters = filterService.getGetters();
		ArrayList<String> paramNames = filterService.getParamsOfFilterForm(getters);
		Advertisement adToCompare = filterService.getAdToCompare(getters, paramNames, filterForm);
		
		ArrayList<Advertisement> filteredAds = filterService.getAdsThatMachTheFilter(adToCompare, getters);
	
		ModelAndView model = new ModelAndView("ads");
		model.addObject("ads", filteredAds);
		return model;
		
		
	}
	
	  @RequestMapping("/ads/{action}")
	  public String message(Model model, @PathVariable String action ) {
		  if ( action.equals("showFilter"))
			  return "redirect:/ads?showFilter=true";
		  if ( action.equals("closeFilter"))
			  return "redirect:/ads?showFilter=false";
		  return "redirect:/inbox";
	    	
	    	
	    }
		


	}
	
	

