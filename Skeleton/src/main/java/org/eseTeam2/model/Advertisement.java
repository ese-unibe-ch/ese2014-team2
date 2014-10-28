package org.eseTeam2.model;

import java.sql.Blob;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Advertisement {

	@Id
	@GeneratedValue
	private Long id;

	private String title;
	private String description;
	private String creator;
	private Date creationDate;
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
	private String address;
	// private String region;

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

	/*
	 * private String img_one = "../img/default_image.jpg"; private String
	 * img_two = "../img/default_image.jpg"; private String img_three =
	 * "../img/default_image.jpg"; private String img_four =
	 * "../img/default_image.jpg";
	 */

	// @OneToMany(mappedBy="Advertisement",cascade = CascadeType.ALL)
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.REFRESH)
	private Set<Picture> pictures;

	public Set<Picture> getPictures() {
		return pictures;
	}

	public void setPictures(Set<Picture> pictures) {
		this.pictures = pictures;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
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

	public boolean isFurnished() {
		return furnished;
	}

	public void setFurnished(boolean furnished) {
		this.furnished = furnished;
	}

	public String getWgType() {
		return wgType;
	}

	public void setWgType(String wgType) {
		this.wgType = wgType;
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

	

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription_ad() {
		return description_ad;
	}

	public void setDescription_ad(String description_ad) {
		this.description_ad = description_ad;
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

	public String getDescription_room() {
		return description_room;
	}

	public void setDescription_room(String description_room) {
		this.description_room = description_room;
	}

	public boolean isToBalcony() {
		return isToBalcony;
	}

	public void setToBalcony(boolean isToBalcony) {
		this.isToBalcony = isToBalcony;
	}

	public boolean isHasCables() {
		return hasCables;
	}

	public void setHasCables(boolean hasCables) {
		this.hasCables = hasCables;
	}

	public String getDescription_us() {
		return description_us;
	}

	public void setDescription_us(String description_us) {
		this.description_us = description_us;
	}

	public String getWgGender() {
		return wgGender;
	}

	public void setWgGender(String wgGender) {
		this.wgGender = wgGender;
	}

	public String getWhoWeAreLookingFor() {
		return whoWeAreLookingFor;
	}

	public void setWhoWeAreLookingFor(String whoWeAreLookingFor) {
		this.whoWeAreLookingFor = whoWeAreLookingFor;
	}

	public String getSmoker() {
		return smoker;
	}

	public void setSmoker(String string) {
		this.smoker = string;
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

}