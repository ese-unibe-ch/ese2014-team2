package org.eseTeam2.controller.pojos;

import java.util.Date;

/**
 * This is the form used to create a Filter to filter ads. It contains all necessary information to create an example Advertisement from it
 * 
 * @author Icewater
 *
 */
public class FilterForm {
	
	// basic info
		private String title;
		private String start;
		private String until;
		private int rooms;
		private int roomPrice;
		private int roomSpace;
		private int nmbrOfRoommates;
		private String wgType;
		private boolean furnished;
		
		
		// address
		private String kanton;
		private int plz;
		private String city;
	//private String region;
		

		
		// info about the flat

		private boolean hasLaundry;
		private boolean hasDishwasher;
		private boolean hasBalcony;
		private boolean smokingInside;
		private boolean hasPets;
		private boolean wlan;
		
		// info about the room
		private boolean hasBuiltInCloset;
		private boolean ToBalcony;
		private boolean hasCables;
		

		private String wgGender;
		
		// who we are looking for
		private String smoker;
		private String ageRange;
		private String genderWeLookFor;
		
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getStart() {
			return start;
		}
		public void setStart(String start) {
			this.start = start;
		}
		public String getUntil() {
			return until;
		}
		public void setUntil(String until) {
			this.until = until;
		}
		public int getRooms() {
			return rooms;
		}
		public void setRooms(int rooms) {
			this.rooms = rooms;
		}
		public int getRoomPrice() {
			return roomPrice;
		}
		public void setRoomPrice(int roomPrice) {
			this.roomPrice = roomPrice;
		}
		public int getRoomSpace() {
			return roomSpace;
		}
		public void setRoomSpace(int roomSpace) {
			this.roomSpace = roomSpace;
		}
		public int getNmbrOfRoommates() {
			return nmbrOfRoommates;
		}
		public void setNmbrOfRoommates(int nmbrOfRoommates) {
			this.nmbrOfRoommates = nmbrOfRoommates;
		}
		public String getWgType() {
			return wgType;
		}
		public void setWgType(String wgType) {
			this.wgType = wgType;
		}
		public boolean isFurnished() {
			return furnished;
		}
		public void setFurnished(boolean furnished) {
			this.furnished = furnished;
		}
		public String getKanton() {
			return kanton;
		}
		public void setKanton(String kanton) {
			this.kanton = kanton;
		}
		public int getPlz() {
			return plz;
		}
		public void setPlz(int plz) {
			this.plz = plz;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		public boolean isHasLaundry() {
			return hasLaundry;
		}
		public void setHasLaundry(boolean hasLaundry) {
			this.hasLaundry = hasLaundry;
		}
		public boolean isHasDishwasher() {
			return hasDishwasher;
		}
		public void setHasDishwasher(boolean hasDishwasher) {
			this.hasDishwasher = hasDishwasher;
		}
		public boolean isHasBalcony() {
			return hasBalcony;
		}
		public void setHasBalcony(boolean hasBalcony) {
			this.hasBalcony = hasBalcony;
		}
		public boolean isSmokingInside() {
			return smokingInside;
		}
		public void setSmokingInside(boolean smokingInside) {
			this.smokingInside = smokingInside;
		}
		public boolean isHasPets() {
			return hasPets;
		}
		public void setHasPets(boolean hasPets) {
			this.hasPets = hasPets;
		}
		public boolean isWlan() {
			return wlan;
		}
		public void setWlan(boolean wlan) {
			this.wlan = wlan;
		}
		public boolean isHasBuiltInCloset() {
			return hasBuiltInCloset;
		}
		public void setHasBuiltInCloset(boolean hasBuiltInCloset) {
			this.hasBuiltInCloset = hasBuiltInCloset;
		}
		public boolean isToBalcony() {
			return ToBalcony;
		}
		public void setToBalcony(boolean isToBalcony) {
			this.ToBalcony = isToBalcony;
		}
		public boolean isHasCables() {
			return hasCables;
		}
		public void setHasCables(boolean hasCables) {
			this.hasCables = hasCables;
		}
		public String getWgGender() {
			return wgGender;
		}
		public void setWgGender(String wgGender) {
			this.wgGender = wgGender;
		}
		public String getSmoker() {
			return smoker;
		}
		public void setSmoker(String smoker) {
			this.smoker = smoker;
		}
		public String getAgeRange() {
			return ageRange;
		}
		public void setAgeRange(String ageRange) {
			this.ageRange = ageRange;
		}
		public String getGenderWeLookFor() {
			return genderWeLookFor;
		}
		public void setGenderWeLookFor(String genderWeLookFor) {
			this.genderWeLookFor = genderWeLookFor;
		}

}
