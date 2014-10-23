package org.eseTeam2.controller.pojos;

import java.util.Date;

import org.eseTeam2.model.Address;
import org.eseTeam2.model.User;


public class AdForm {
	
	private Long id;
	private String title;
	private String description;
	private String creator;
	private Date creationDate;
	private boolean isLimited;
	private Date start;
	private Date until;
	private int rooms;
	private int price;
	private int space;
	private int roomies;
	private String kanton;
	private int plz;
	private String ort;
	private String address;
	private String region;
	
	
	private String img_one;
	private String img_two;
	private String img_three;
	private String img_four;
	
	
	private String description_ad;
	private boolean hasLaundry;
	private boolean hasTumbler;
	private boolean hasBalcony;
	private String description_room;
	private boolean isToBalcony;
	private boolean hasCables;
	private String description_us;
	private String description_you;
	
	
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
	public boolean getIsLimited() {
		return isLimited;
	}
	public void setIsLimited(boolean isLimited) {
		this.isLimited = isLimited;
	}
	public int getRooms() {
		return rooms;
	}
	public void setRooms(int rooms) {
		this.rooms = rooms;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSpace() {
		return space;
	}
	public void setSpace(int space) {
		this.space = space;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getStart() {
		return start;
	}
	public void setFrom(Date from) {
		this.start = from;
	}
	public Date getUntil() {
		return until;
	}
	public void setUntil(Date until) {
		this.until = until;
	}
	public int getRoomies() {
		return roomies;
	}
	public void setRoomies(int roomies) {
		this.roomies = roomies;
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
	public String getOrt() {
		return ort;
	}
	public void setOrt(String ort) {
		this.ort = ort;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}

	public String getDescription_ad() {
		return description_ad;
	}
	public void setDescription_ad(String description_ad) {
		this.description_ad = description_ad;
	}
	public boolean getHasLaundry() {
		return hasLaundry;
	}
	public void setHasLaundry(boolean hasLaundry) {
		this.hasLaundry = hasLaundry;
	}
	public boolean getHasTumbler() {
		return hasTumbler;
	}
	public void setHasTumbler(boolean hasTumbler) {
		this.hasTumbler = hasTumbler;
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
		this.description_room = description_room;
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
		this.description_us = description_us;
	}
	public String getDescription_you() {
		return description_you;
	}
	public void setDescription_you(String description_you) {
		this.description_you = description_you;
	}
	public String getImg_one() {
		return img_one;
	}
	public void setImg_one(String img_one) {
		this.img_one = img_one;
	}
	public String getImg_two() {
		return img_two;
	}
	public void setImg_two(String img_two) {
		this.img_two = img_two;
	}
	public String getImg_three() {
		return img_three;
	}
	public void setImg_three(String img_three) {
		this.img_three = img_three;
	}
	public String getImg_four() {
		return img_four;
	}
	public void setImg_four(String img_four) {
		this.img_four = img_four;
	}

	
	
}