package org.eseTeam2.controller.pojos;

import java.util.Date;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.eseTeam2.model.Picture;
import org.eseTeam2.model.User;
import org.jsoup.Jsoup;

/**
 * This is the Form class which is user to place a new Room Advertisement.
 * It contains all the parameters needed to create an Advertisement Object.
 *
 * @author Icewater
 *
 */
public class AdForm {
	
	// basic info
	private Long id;
	private String title;
	private String description;
	private User creator;
	private Date creationDate;
	@NotNull
	@Pattern(regexp = "(0?[1-9]|1[012])/(0?[1-9]|[12][0-9]|3[01])/((19|20)\\d\\d)", message="Bitte wähle ein Datum im Format mm/dd/yyyy")
	private String start;
	
	
	private String until;
	
	@NotNull
	@Size(min = 1, max = 50)
	@Pattern(regexp="[0-9]*\\.?[0-9]*", message =" Bitte gib eine gültige Nummer ein")
	private String rooms;
	
	@NotNull
	@Size(min = 1, max = 9000)
	@Pattern(regexp="[0-9]*", message =" Bitte gib eine gültige Nummer ein")
	private String roomPrice;
	
	@NotNull
	@Size(min = 1, max = 50)
	@Pattern(regexp="[0-9]*", message =" Bitte gib eine gültige Nummer ein")
	private String roomSpace;
	
	@NotNull
	@Size(min = 1, max = 9)
	@Pattern(regexp="[0-9]*", message =" Bitte wähle eine Nummer aus der Liste aus")
	private String nmbrOfRoommates;
	
	private String wgType;
	private boolean furnished;
	
	
	// address
	@NotNull
	@Size(min=3, message="Bitte gib den Namen des Kantons ein.")
	private String kanton;
	@NotNull
	@Min(value = 1000, message = "Bitte gib eine gültige Postleizahl ein")
	@Max(value = 9999, message = "Bitte gib eine gültige Postleizahl ein")
	private int plz;
	@NotNull
	@Size(min=3, message="Bitte gib den Namen deiner Stadt ein")
	private String city;
	@NotNull
	@Size(min=3, message="Bitte gib die Addresse an")
	private String address;
	//private String region;
	
	// pictures
	private Picture img_one;
	private Picture img_two;
	private Picture img_three;
	private Picture img_four;
	
	// info about the flat
	private String description_ad;
	private boolean hasLaundry;
	private boolean hasDishwasher;
	private boolean hasBalcony;
	private boolean smokingInside;
	private boolean hasPets;
	private boolean wlan;
	
	// info about the room
	private boolean hasBuiltInCloset;
	private String description_room;
	private boolean isToBalcony;
	private boolean hasCables;
	
	// About us
	private String description_us;
	private String wgGender;
	
	// who we are looking for
	private String whoWeAreLookingFor;
	private String smoker;
	private String ageRange;
	private String genderWeLookFor;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = Jsoup.parse(title).text();
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = Jsoup.parse(description).text();
	}
	
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = Jsoup.parse(address).text();
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
	
	public String getKanton() {
		return kanton;
	}
	public void setKanton(String kanton) {
		this.kanton = Jsoup.parse(kanton).text();
	}
	public int getPlz() {
		return plz;
	}
	public void setPlz(int plz) {
		this.plz = plz;
	}
	

	public String getDescription_ad() {
		return description_ad;
	}
	public void setDescription_ad(String description_ad) {
		this.description_ad = Jsoup.parse(description_ad).text();
	}
	public boolean getHasLaundry() {
		return hasLaundry;
	}
	public void setHasLaundry(boolean hasLaundry) {
		this.hasLaundry = hasLaundry;
	}
	public boolean getHasDishwasher() {
		return hasDishwasher;
	}
	public void setHasDishwasher(boolean hasDishwasher) {
		this.hasDishwasher = hasDishwasher;
	}
	public boolean getHasBalcony() {
		return hasBalcony;
	}
	public void setHasBalcony(boolean hasBalcony) {
		this.hasBalcony = hasBalcony;
	}
	public String getDescription_room() {
		return description_room;
	}
	public void setDescription_room(String description_room) {
		this.description_room = Jsoup.parse(description_room).text();
	}
	public boolean getIsToBalcony() {
		return isToBalcony;
	}
	public void setIsToBalcony(boolean isToBalcony) {
		this.isToBalcony = isToBalcony;
	}
	public boolean getHasCables() {
		return hasCables;
	}
	public void setHasCables(boolean hasCables) {
		this.hasCables = hasCables;
	}
	public String getDescription_us() {
		return description_us;
	}
	public void setDescription_us(String description_us) {
		this.description_us = Jsoup.parse(description_us).text();
	}
	public String getWhoWeAreLookingFor() {
		return whoWeAreLookingFor;
	}
	public void setWhoWeAreLookingFor(String whoWeAreLookingFor) {
		this.whoWeAreLookingFor = Jsoup.parse(whoWeAreLookingFor).text();
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
	public String getWgGender() {
		return wgGender;
	}
	public void setWgGender(String wgGender) {
		this.wgGender = wgGender;
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
	public String getSmoker() {
		return smoker;
	}
	public void setSmoker(String smoker) {
		this.smoker = smoker;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public User getCreator() {
		return creator;
	}
	public void setCreator(User creator) {
		this.creator = creator;
	}
	public Picture getImg_one() {
		return img_one;
	}
	public void setImg_one(Picture img_one) {
		this.img_one = img_one;
	}
	public Picture getImg_two() {
		return img_two;
	}
	public void setImg_two(Picture img_two) {
		this.img_two = img_two;
	}
	public Picture getImg_three() {
		return img_three;
	}
	public void setImg_three(Picture img_three) {
		this.img_three = img_three;
	}
	public Picture getImg_four() {
		return img_four;
	}
	public void setImg_four(Picture img_four) {
		this.img_four = img_four;
	}
	public String getRooms() {
	    return rooms;
	}
	public void setRooms(String rooms) {
	    this.rooms = rooms;
	}
	public String getRoomPrice() {
	    return roomPrice;
	}
	public void setRoomPrice(String roomPrice) {
	    this.roomPrice = roomPrice;
	}
	public String getRoomSpace() {
	    return roomSpace;
	}
	public void setRoomSpace(String roomSpace) {
	    this.roomSpace = roomSpace;
	}
	public String getNmbrOfRoommates() {
	    return nmbrOfRoommates;
	}
	public void setNmbrOfRoommates(String nmbrOfRoommates) {
	    this.nmbrOfRoommates = nmbrOfRoommates;
	}

	
	
}