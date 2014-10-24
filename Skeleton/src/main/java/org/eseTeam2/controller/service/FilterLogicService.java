package org.eseTeam2.controller.service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;

import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.model.Advertisement;
import org.eseTeam2.model.dao.AdvertisementDao;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.*;

import org.springframework.beans.PropertyAccessor;
import org.springframework.beans.PropertyAccessorFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FilterLogicService implements IFilterLogicService {
	
/*
    private SessionFactory sessionFactory;
	
	public ArrayList<Advertisement> findSuitableAds(Advertisement ad) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from Stock where stockCode = :code ");
		query.setParameter("code", "7277");
		List list = query.list();
		return null;
	}*/
	@Autowired
	AdvertisementDao adDao;
	
	/**
	 * the idea is to get all the getters and parameter names from the "filter" form, so you dont have to read everything out manually.
	 * This method gets all getter strings from the filter class. In this form: "getWgType"
	 */
	public ArrayList<String> getGetters() {
		
		ArrayList<String> getMethodNames = new ArrayList<String>();
			
	
		Class c = FilterForm.class;
		// get all the getter methods
		Method[] methods = c.getDeclaredMethods();
		for ( int i = 0; i < methods.length; i++) {
			String prettyMaker = methods[i].toString();
			if( (methods[i].toString().contains("get"))
					|| methods[i].toString().contains("boolean") && (((prettyMaker.substring(prettyMaker.lastIndexOf(".")+1)).substring(0,2)).contains("is"))){
				
				try {
					
				String tmp = methods[i].toString();
				getMethodNames.add((tmp.substring(tmp.lastIndexOf(".")+1)).replace("()","").replace(" ", ""));
				
				}
				catch (Exception d) {}
			}
	
								
				
		}
		return getMethodNames;
		
		}
		
	/**
	 * this gets the names of all parameters of the filterForm, for future use.
	 */
		public ArrayList<String> getParamsOfFilterForm(ArrayList<String> getters) {
			
			ArrayList<String> setMethodNames = new ArrayList<String>();
						
			
		
			Class c = FilterForm.class;
			// get all the getter methods
			Method[] methods = c.getDeclaredMethods();
		
			
			// furnished, dishwasher
			for ( int i = 0; i < getters.size(); i++) {
				if( (getters.get(i).substring(0,2)).contains("is"))
					setMethodNames.add(getters.get(i).substring(2,getters.get(i).length()));
				if (getters.get(i).substring(0,3).contains("get"))
					setMethodNames.add(getters.get(i).replace("get", ""));
					
		
			
			}
			return setMethodNames;
		}
		
		/**
		 * the property acessor class can be used with the parameter names, to use all the getter methods, and get the data inside to use for comparison.
		 */
		public Advertisement getAdToCompare ( ArrayList<String> getterMethodNames, ArrayList<String> setterMethodNames, FilterForm filterForm   ){
			Advertisement desiredAd = new Advertisement();
			Class c = FilterForm.class;
			PropertyAccessor access = PropertyAccessorFactory.forBeanPropertyAccess(desiredAd);
			
			for ( int i = 0; i < getterMethodNames.size(); i++) {
				
				try {
					
					// method call chain of doom !
					//desAd.getDeclaredMethod((getMethodNames.get(i).replace("is","set").replace("get", "set"))).invoke(desiredAd, (c.getDeclaredMethod(getMethodNames.get(i)).invoke(filterForm)));
					access.setPropertyValue(setterMethodNames.get(i), c.getDeclaredMethod(getterMethodNames.get(i)).invoke(filterForm));
				}
				catch (Exception d) {}
			}
			return desiredAd;
		}

		public ArrayList<Advertisement> getAdsThatMachTheFilter(
				Advertisement adToCompare, ArrayList<String> getters) {
			ArrayList<Advertisement> desiredAds = new ArrayList<Advertisement>();
			
			// this is what takes the most time :(
			Iterable<Advertisement> allAdsInDb = adDao.findAll();
			ArrayList<Advertisement> allAdsInDbList = new ArrayList<Advertisement>();
			// split in bool and non bool getters
			ArrayList<String> booleanGetterNames =  new ArrayList<String>();
			ArrayList<String> nonBooleanGetterNames =  new ArrayList<String>();
			
			PropertyAccessor access;
			PropertyAccessor accessDesiredAd =  PropertyAccessorFactory.forBeanPropertyAccess(adToCompare);
			
			for ( int i = 0; i < getters.size(); i++){
				if( getters.get(i).substring(0,2).contains("is"))
					booleanGetterNames.add(getters.get(i));
				else 
					nonBooleanGetterNames.add(getters.get(i));
			}
			for(Advertisement adInDb : allAdsInDb ) {
				allAdsInDbList.add(adInDb);
			}
			
			// compare bools
			boolean stillAMatch = true;
			for ( int i = 0; i < allAdsInDbList.size();i++) {
				stillAMatch = true;
				access = PropertyAccessorFactory.forBeanPropertyAccess(allAdsInDbList.get(i));
				// check all bools
				for ( int j = 0; j < booleanGetterNames.size(); j++){
		
					try {
						boolean tmpAllAd = (Boolean) access.getPropertyValue(booleanGetterNames.get(j).substring(2));
						boolean tmpDesAd = (Boolean) accessDesiredAd.getPropertyValue(booleanGetterNames.get(j).substring(2));
						
						if (tmpDesAd == true) {
							if ( tmpDesAd != tmpAllAd) {
								stillAMatch = false;
								
							}
				
						}
							
					
					}
					catch (Exception d){}
				}
				// individual check other fields
				if( allAdsInDbList.get(i).getRoomPrice() >= adToCompare.getRoomPrice() )
					stillAMatch = false;
				
				if( adToCompare.getWgType() != null && allAdsInDbList.get(i).getWgType() != null) {
					if(!adToCompare.getWgType().equals("undef") && (!allAdsInDbList.get(i).getWgType().contains(adToCompare.getWgType())) )
						stillAMatch = false;
				}
				if( adToCompare.getWgGender()!=null && allAdsInDbList.get(i).getWgGender()!=null) {
					if( !adToCompare.getWgGender().equals("dontcare") && (!allAdsInDbList.get(i).getWgGender().contains(adToCompare.getWgGender())))
						stillAMatch = false;
				}
				
				if( !allAdsInDbList.get(i).getOrt().toLowerCase().replace(" ", "").contains(adToCompare.getOrt().toLowerCase().replace(" ","")))
					stillAMatch = false;
				if ( stillAMatch == true)
					desiredAds.add(allAdsInDbList.get(i));
				
						
			}
			return desiredAds;
		}
		
		
}
		

		



