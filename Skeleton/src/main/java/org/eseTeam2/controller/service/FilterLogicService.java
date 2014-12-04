package org.eseTeam2.controller.service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;

import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.CustomFilterAd;
import org.eseTeam2.model.dao.AdvertisementDao;
import org.eseTeam2.model.dao.CustomFilterAdDao;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.*;

import org.springframework.beans.PropertyAccessor;
import org.springframework.beans.PropertyAccessorFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * This class is handling the filter logic, used to Filter for specific ads. It
 * is very development, probably going to get changed.
 * 
 * @author Icewater
 *
 */
@Service
public class FilterLogicService implements IFilterLogicService {

    @Autowired
    AdvertisementDao adDao;

    /**
     * the idea is to get all the getters and parameter names from the "filter"
     * form, so you dont have to read everything out manually. This method gets
     * all getter strings from the filter class. In this form: "getWgType"
     */
    public ArrayList<String> getGettersOfFilterForm() {

	ArrayList<String> getMethodNames = new ArrayList<String>();

	Class c = FilterForm.class;
	// get all the getter methods
	Method[] methods = c.getDeclaredMethods();

	for (int i = 0; i < methods.length; i++) {
	    String prettyMaker = methods[i].toString();
	    if ((methods[i].toString().contains("get")) || methods[i].toString().contains("boolean")
		    && (((prettyMaker.substring(prettyMaker.lastIndexOf(".") + 1)).substring(0, 2)).contains("is"))) {

		try {

		    String tmp = methods[i].toString();
		    getMethodNames.add((tmp.substring(tmp.lastIndexOf(".") + 1)).replace("()", "").replace(" ", ""));

		} catch (Exception d) {
		}
	    }

	}
	return getMethodNames;

    }

    /**
     * this gets the names of all parameters of the filterForm, for future use.
     */
    public ArrayList<String> getParamsOfFilterForm(ArrayList<String> getters) {

	ArrayList<String> patameterNames = new ArrayList<String>();

	Class c = FilterForm.class;
	// get all the getter methods
	Method[] methods = c.getDeclaredMethods();

	// furnished, dishwasher
	for (int i = 0; i < getters.size(); i++) {
	    if ((getters.get(i).substring(0, 2)).contains("is"))
		patameterNames.add(getters.get(i).substring(2, getters.get(i).length()));
	    if (getters.get(i).substring(0, 3).contains("get"))
		patameterNames.add(getters.get(i).replace("get", ""));

	}
	return patameterNames;
    }

    /**
     * This method takes a filter from, creates an advertisement object from it,
     * and returns it. the property acessor class can be used with the parameter
     * names, to use all the getter methods, and get the data inside to use for
     * comparison.
     * 
     */
    public Advertisement getAdToCompare(ArrayList<String> getterMethodNames, ArrayList<String> parameterNames,
	    FilterForm filterForm) {
	Advertisement desiredAd = new Advertisement();
	Class c = FilterForm.class;
	PropertyAccessor access = PropertyAccessorFactory.forBeanPropertyAccess(desiredAd);

	for (int i = 0; i < getterMethodNames.size(); i++) {

	    try {

		access.setPropertyValue(parameterNames.get(i),c.getDeclaredMethod(getterMethodNames.get(i)).invoke(filterForm));
	    } catch (Exception d) {
	    }
	}
	return desiredAd;
    }

    /**
     * this method compares a given ad to all ads of an user, and returns all
     * ads that match the given ad. Used to Filter ads, by given parameters.
     * 
     * @param Advertisement
     *            adToCompare
     * @param ArrayList
     *            <String> getters
     * @return ArrayList<Advertisement> containing all ads that match in
     *         parameters the given adToCompare
     */
    public ArrayList<Advertisement> getAdsThatMatchTheFilter(Advertisement adToCompare, ArrayList<String> getters) {
	ArrayList<Advertisement> desiredAds = new ArrayList<Advertisement>();

	Iterable<Advertisement> allAdsInDb = null;

	if (adToCompare.getWgType().contains("undef")) {
	    if (!adToCompare.getCity().equals("") && adToCompare.getRoomPrice() > 0) {
		allAdsInDb = adDao.findByCityAndRoomPriceLessThan(adToCompare.getCity(), adToCompare.getRoomPrice());

	    }
	    if (adToCompare.getCity().equals("") && adToCompare.getRoomPrice() > 0) {
		allAdsInDb = adDao.findByRoomPriceLessThan(adToCompare.getRoomPrice());

	    }
	    if (adToCompare.getCity().equals("") && adToCompare.getRoomPrice() <= 0) {
		allAdsInDb = adDao.findAll();

	    }
	    if (!adToCompare.getCity().equals("") && adToCompare.getRoomPrice() <= 0) {
		allAdsInDb = adDao.findByCity(adToCompare.getCity());

	    }
	} else if (!adToCompare.getWgType().contains("undef")) {
	    if (!adToCompare.getCity().equals("") && adToCompare.getRoomPrice() > 0) {
		allAdsInDb = adDao.findByCityAndRoomPriceLessThanAndWgType(adToCompare.getCity(),
			adToCompare.getRoomPrice(), adToCompare.getWgType());

	    }
	    if (adToCompare.getCity().equals("") && adToCompare.getRoomPrice() > 0) {
		allAdsInDb = adDao
			.findByRoomPriceLessThanAndWgType(adToCompare.getRoomPrice(), adToCompare.getWgType());

	    }
	    if (adToCompare.getCity().equals("") && adToCompare.getRoomPrice() <= 0) {
		allAdsInDb = adDao.findByWgType(adToCompare.getWgType());

	    }
	    if (!adToCompare.getCity().equals("") && adToCompare.getRoomPrice() <= 0) {
		allAdsInDb = adDao.findByCityAndWgType(adToCompare.getCity(), adToCompare.getWgType());

	    }
	} else {
	    allAdsInDb = adDao.findAll();

	}

	ArrayList<Advertisement> allAdsInDbList = new ArrayList<Advertisement>();
	// split in bool and non bool getters
	ArrayList<String> booleanGetterNames = new ArrayList<String>();
	ArrayList<String> nonBooleanGetterNames = new ArrayList<String>();

	PropertyAccessor access;
	PropertyAccessor accessDesiredAd = PropertyAccessorFactory.forBeanPropertyAccess(adToCompare);

	for (int i = 0; i < getters.size(); i++) {
	    if (getters.get(i).substring(0, 2).contains("is"))
		booleanGetterNames.add(getters.get(i));
	    else
		nonBooleanGetterNames.add(getters.get(i));
	}
	for (Advertisement adInDb : allAdsInDb) {
	    allAdsInDbList.add(adInDb);
	}

	// compare bools
	boolean stillAMatch = true;
	for (int i = 0; i < allAdsInDbList.size(); i++) {
	    stillAMatch = true;
	    access = PropertyAccessorFactory.forBeanPropertyAccess(allAdsInDbList.get(i));
	    // check all bools
	    for (int j = 0; j < booleanGetterNames.size(); j++) {

		try {
		    boolean tmpAllAd = (Boolean) access.getPropertyValue(booleanGetterNames.get(j).substring(2));
		    boolean tmpDesAd = (Boolean) accessDesiredAd.getPropertyValue(booleanGetterNames.get(j).substring(2));

		    if (tmpDesAd == true) {
			if (tmpDesAd != tmpAllAd) {

			    stillAMatch = false;

			}

		    }

		} catch (Exception d) {
		}
	    }

	    if (!adToCompare.getWgGender().equals("dontcare")&& (!allAdsInDbList.get(i).getWgGender().contains(adToCompare.getWgGender())))
		stillAMatch = false;

	    if (stillAMatch == true)
		desiredAds.add(allAdsInDbList.get(i));

	}
	return desiredAds;
    }

    /**
     * This method is a smaller filter Version of the getAdsThatMatchTheFilter
     * method. Same functionality returns a list of all Ads which match the
     * filter.
     */
    public ArrayList<Advertisement> getAdsThatMatchTheSmallFilter(String city, int roomPrice) {
	Iterable<Advertisement> filteredAds = new ArrayList<Advertisement>();

	if (!city.equals("") && roomPrice > 0) {
	    filteredAds = adDao.findByCityAndRoomPriceLessThan(city, roomPrice);

	}

	if (city.equals("") && roomPrice <= 0) {
	    filteredAds = adDao.findAll();

	}

	if (city.equals("") && roomPrice > 0) {
	    filteredAds = adDao.findByRoomPriceLessThan(roomPrice);

	}

	if (!city.equals("") && roomPrice <= 0) {
	    filteredAds = adDao.findByCity(city);

	}

	ArrayList<Advertisement> filteredAdsList = new ArrayList<Advertisement>();
	for (Advertisement ad : filteredAds)
	    filteredAdsList.add(ad);

	return filteredAdsList;

    }

    /**
     * this method is used to create an advertisement from a Filter which the
     * user has chosen.
     * 
     */
    public CustomFilterAd getFilterAdToCompare(ArrayList<String> getterMethodNames, ArrayList<String> paramNames,
	    FilterForm filterForm) {

	CustomFilterAd desiredAd = new CustomFilterAd();
	Class c = FilterForm.class;
	PropertyAccessor access = PropertyAccessorFactory.forBeanPropertyAccess(desiredAd);

	for (int i = 0; i < getterMethodNames.size(); i++) {

	    try {

		access.setPropertyValue(paramNames.get(i),c.getDeclaredMethod(getterMethodNames.get(i)).invoke(filterForm));
	    } catch (Exception d) {
	    }
	}
	return desiredAd;
    }

    /**
     * this method compares 2 advertisements and returns true if the given
     * parameters in the adToCompare match with the placedAd
     * 
     * @param CustomFilterAd
     *            adToCompare the ad which is compared to another ad. The
     *            placeAd has to match this ad.
     * @param Advertisement
     *            placeAd this ad gets compared to the adToCompare.
     * @param ArrayList
     *            <String> getters
     */
    public boolean isNewAdMatch(CustomFilterAd adToCompare, ArrayList<String> getters, Advertisement placedAd) {

	if (!adToCompare.getWgType().contains("undef") && (adToCompare.getWgType().contains(placedAd.getWgType())) == false) {

	    return false;
	}

	if (!adToCompare.getWgGender().contains("dontcare")&& (adToCompare.getWgGender().contains(placedAd.getWgGender())) == false) {

	    return false;
	}

	if (!adToCompare.getCity().equals("") && (adToCompare.getCity().contains(placedAd.getCity())) == false) {

	    return false;
	}

	if (adToCompare.getRoomPrice() > 0 && (adToCompare.getRoomPrice() >= placedAd.getRoomPrice()) == false) {

	    return false;
	}

	// split in bool and non bool getters
	ArrayList<String> booleanGetterNames = new ArrayList<String>();
	ArrayList<String> nonBooleanGetterNames = new ArrayList<String>();

	PropertyAccessor access;
	PropertyAccessor accessDesiredAd = PropertyAccessorFactory.forBeanPropertyAccess(adToCompare);

	for (int i = 0; i < getters.size(); i++) {
	    if (getters.get(i).substring(0, 2).contains("is"))
		booleanGetterNames.add(getters.get(i));
	    else
		nonBooleanGetterNames.add(getters.get(i));
	}

	// compare bools

	access = PropertyAccessorFactory.forBeanPropertyAccess(placedAd);
	// check all bools
	for (int j = 0; j < booleanGetterNames.size(); j++) {

	    try {
		boolean tmpAllAd = (Boolean) access.getPropertyValue(booleanGetterNames.get(j).substring(2));
		boolean tmpDesAd = (Boolean) accessDesiredAd.getPropertyValue(booleanGetterNames.get(j).substring(2));

		if (tmpDesAd == true) {
		    if (tmpDesAd != tmpAllAd) {

			return false;

		    }

		}

	    } catch (Exception d) {
	    }
	}

	return true;
    }

}
