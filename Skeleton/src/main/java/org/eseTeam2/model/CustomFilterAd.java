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
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
public class CustomFilterAd {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String title;
	private String description;
	
	@ManyToOne 
	private User creator;
	
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
	
	@OneToOne (mappedBy="exampleAd", fetch=FetchType.EAGER)
	private User exampleAdUser;



	

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



	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}



	public User getExampleAdUser() {
		return exampleAdUser;
	}

	public void setExampleAdUser(User exampleAdUser) {
		this.exampleAdUser = exampleAdUser;
	}




}