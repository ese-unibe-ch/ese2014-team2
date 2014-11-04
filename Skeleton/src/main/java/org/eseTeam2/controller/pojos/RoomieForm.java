package org.eseTeam2.controller.pojos;

import java.util.Date;

import org.eseTeam2.model.Picture;
import org.eseTeam2.model.User;
/**
 * Roomie form, used to create a new Person ad, contains all the information needed to create a new Roomie object
 * 
 * @author Icewater
 *
 */
public class RoomieForm {

	// basic info
	private Long id;
	private String lastName;
	private String firstName;
	private User creator;
	private Date creationDate;

	// pictures
	private Picture img_one;

	// info about the person
	private String smoker;
	private boolean hasPets;
	private String gender;
	private String description;
	private String personalityType;
	private int age;

	public int getAge() {
		return this.age;
	}

	public void setAge(int _age) {
		this.age = _age;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String _gender) {
		this.gender = _gender;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String _firstName) {
		this.firstName = _firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String _lastName) {
		this.lastName = _lastName;
	}

	public String getPersonalityType() {
		return personalityType;
	}

	public void setPersonalityType(String _personalityType) {
		this.personalityType = _personalityType;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public String getSmoker() {
		return smoker;
	}

	public void setSmoker(String smoker) {
		this.smoker = smoker;
	}

	public boolean isHasPets() {
		return hasPets;
	}

	public void setHasPets(boolean hasPets) {
		this.hasPets = hasPets;
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
}