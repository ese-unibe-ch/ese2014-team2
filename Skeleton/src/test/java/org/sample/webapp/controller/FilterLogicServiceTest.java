package org.sample.webapp.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;

import org.eseTeam2.controller.pojos.FilterForm;
import org.eseTeam2.controller.service.FilterLogicService;
import org.eseTeam2.model.Advertisement;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class FilterLogicServiceTest {
	
	public FilterLogicService filterLogicService;
	public Advertisement expectedAd;
	public ArrayList<String> getterMethodNames;
	public ArrayList<String> parameterNames;
	public FilterForm filterForm;
	
	@Before
	public void setUp () {
		this.filterLogicService = new FilterLogicService();
		this.initializeExpectedAd();
		this.initializeGetterMethodNames();
		this.initializeParameterNames();
		this.initializeFilterForm();
		
		assert ( null != this.filterLogicService );
		assert ( null != this.expectedAd);
		assert ( null != this.getterMethodNames);
		assert ( null != this.parameterNames);
		assert ( null != this.filterForm);
	}
	
	@After
	public void tearDown () {
		this.filterLogicService = null;
		this.expectedAd = null; 
		this.getterMethodNames = null;
		this.parameterNames = null;
		this.filterForm = null;

		assert ( null == this.filterLogicService );
		assert ( null == this.expectedAd);
		assert ( null == this.getterMethodNames);
		assert ( null == this.parameterNames);
		assert ( null == this.filterForm);
	}
	
	@Test
	public void getGettersOfFilterFormTest () {
		ArrayList<String> getters = this.filterLogicService.getGettersOfFilterForm();

		for ( int indx = 0; indx < getters.size(); indx++ ) {
			assertTrue ( getters.get(indx).substring ( 0, 3 ).equals ( "get" )
					|| getters.get(indx).substring ( 0, 2 ).equals ( "is" ) );
		}
	}
	
	/* ============== Enable after initialization of filterForm =============
	@Test
	public void getAdToCompareTest () {
		Advertisement receivedAd = this.filterLogicService.getAdToCompare ( this.getterMethodNames, this.parameterNames, this.filterForm);
		
		assert ( expectedAd.getId() == receivedAd.getId() );
		assertEquals ( expectedAd.getTitle(), receivedAd.getTitle() );
		assertEquals ( expectedAd.getDescription(), receivedAd.getDescription() );
		assertEquals ( expectedAd.getCreator().getEmail(), receivedAd.getCreator().getEmail() );
		assert ( expectedAd.getCreationDate().equals(receivedAd.getCreationDate()) );
		assertEquals ( expectedAd.getStart(), receivedAd.getStart() );
		assertEquals ( expectedAd.getUntil(), receivedAd.getUntil() );
		assert ( expectedAd.getRooms() == receivedAd.getRooms() );
		assert ( expectedAd.getRoomPrice() == receivedAd.getRoomPrice() );
		assert ( expectedAd.getRoomSpace() == receivedAd.getRoomSpace() );
		assert ( expectedAd.getNmbrOfRoommates() == receivedAd.getNmbrOfRoommates() );
		assertEquals ( expectedAd.getWgType(), receivedAd.getWgType() );
		assert ( expectedAd.isFurnished() == receivedAd.isFurnished() );
		assertEquals ( expectedAd.getKanton(), receivedAd.getKanton() );
		assert ( expectedAd.getPlz() == receivedAd.getPlz() );
		assertEquals ( expectedAd.getCity(), receivedAd.getCity() );
		assertEquals ( expectedAd.getAddress(), receivedAd.getAddress() );
		assertEquals ( expectedAd.getDescription_ad(), receivedAd.getDescription_ad() );
		assert ( expectedAd.isHasLaundry() == receivedAd.isHasLaundry() );
		assert ( expectedAd.isHasDishwasher() == receivedAd.isHasDishwasher() );
		assert ( expectedAd.isHasBalcony() == receivedAd.isHasBalcony() );
		assert ( expectedAd.isSmokingInside() == receivedAd.isSmokingInside() );
		assert ( expectedAd.isHasPets() == receivedAd.isHasPets() );
		assert ( expectedAd.isWlan() == receivedAd.isWlan() );
		assert ( expectedAd.isHasBuiltInCloset() == receivedAd.isHasBuiltInCloset() );
		assertEquals ( expectedAd.getDescription_room(), receivedAd.getDescription_room() );
		assert ( expectedAd.isToBalcony() == receivedAd.isToBalcony() );
		assert ( expectedAd.isHasCables() == receivedAd.isHasCables() );
		assertEquals ( expectedAd.getDescription_us(), receivedAd.getDescription_us() );
		assertEquals ( expectedAd.getWgGender(), receivedAd.getWgGender() );
		assertEquals ( expectedAd.getWhoWeAreLookingFor(), receivedAd.getWhoWeAreLookingFor() );
		assertEquals ( expectedAd.getSmoker(), receivedAd.getSmoker() );
		assertEquals ( expectedAd.getAgeRange(), receivedAd.getAgeRange() );
		assertEquals ( expectedAd.getGenderWeLookFor(), receivedAd.getGenderWeLookFor() );
	}
	*/
	
	private void initializeGetterMethodNames () {
		int i = 0;
		this.getterMethodNames = new ArrayList<String>(33);

		this.getterMethodNames.add ( i++, "getId" );
		this.getterMethodNames.add ( i++, "getTitle" );
		this.getterMethodNames.add ( i++, "getDescription" );
		this.getterMethodNames.add ( i++, "getCreator" );
		this.getterMethodNames.add ( i++, "getCreationDate" );
		this.getterMethodNames.add ( i++, "getStart" );
		this.getterMethodNames.add ( i++, "getUntil" );
		this.getterMethodNames.add ( i++, "getRooms" );
		this.getterMethodNames.add ( i++, "getRoomPrice" );
		this.getterMethodNames.add ( i++, "getRoomSpace" );
		this.getterMethodNames.add ( i++, "getNmbrOfRoommates" );
		this.getterMethodNames.add ( i++, "getWgType" );
		this.getterMethodNames.add ( i++, "isFurnished" );
		this.getterMethodNames.add ( i++, "getKanton" );
		this.getterMethodNames.add ( i++, "getPlz" );
		this.getterMethodNames.add ( i++, "getCity" );
		this.getterMethodNames.add ( i++, "getAddress" );
		this.getterMethodNames.add ( i++, "getDescription_ad" );
		this.getterMethodNames.add ( i++, "isHasLaundry" );
		this.getterMethodNames.add ( i++, "isHasDishwasher" );
		this.getterMethodNames.add ( i++, "isHasBalcony" );
		this.getterMethodNames.add ( i++, "isSmokingInside" );
		this.getterMethodNames.add ( i++, "isHasPets" );
		this.getterMethodNames.add ( i++, "isWlan" );
		this.getterMethodNames.add ( i++, "isHasBuiltInCloset" );
		this.getterMethodNames.add ( i++, "getDescription_room" );
		this.getterMethodNames.add ( i++, "isToBalcony" );
		this.getterMethodNames.add ( i++, "isHasCables" );
		this.getterMethodNames.add ( i++, "getDescription_us" );
		this.getterMethodNames.add ( i++, "getWgGender" );
	}
	
	private void initializeParameterNames () {
		this.parameterNames = new ArrayList<String>(this.getterMethodNames.size());

		String param;
		for ( int indx = 0; indx < this.getterMethodNames.size(); indx++ ) {
			param = this.getterMethodNames.get(indx);
			if ( param.substring(0,2).equals("is"))
				this.parameterNames.add ( indx, param.substring(2,param.length()));
			else this.parameterNames.add ( indx, param.substring(3,param.length()));
		}
	}
	
	private void initializeFilterForm () {
		this.filterForm = new FilterForm();
		/*
 		================ ToDo: initialize filterForm ==================
		*/
	}
	
	private void initializeExpectedAd () {
		/*
 		================ ToDo: initialize filterForm ==================
		*/
	}
}