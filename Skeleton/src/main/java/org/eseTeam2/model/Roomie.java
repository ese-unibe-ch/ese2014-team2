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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Roomie {

	@Id
	@GeneratedValue
	private Long id;

	private String firstName;
	private String lastName;
	private String description;
	private String gender;
	private int age;

	@ManyToOne
	private User creator;

	private Date creationDate;
	private String personalityType;

	// info about the flat
	private int smoker;
	private boolean hasPets;

	// About us

	/*
	 * private String img_one = "../img/default_image.jpg"; private String
	 * img_two = "../img/default_image.jpg"; private String img_three =
	 * "../img/default_image.jpg"; private String img_four =
	 * "../img/default_image.jpg";
	 */

	// @OneToMany(mappedBy="Advertisement",cascade = CascadeType.ALL)
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.REFRESH)
	private Set<Picture> pictures;

	@OneToOne
	private Picture mainPic;

	public Set<Picture> getPictures() {
		return pictures;
	}

	public void setPictures(Set<Picture> pictures) {
		this.pictures = pictures;
	}

	public int getSmoker() {
		return smoker;
	}

	public void setSmoker(String smoker) {
		if ( smoker.equals ( "smoker" ) ) this.smoker = 1;
		else this.smoker = 0;
	}

	public String getPersonalityType() {
		return personalityType;
	}

	public void setPersonalityType(String personalityType) {
		this.personalityType = personalityType;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
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

	public boolean isHasPets() {
		return hasPets;
	}

	public void setHasPets(boolean hasPets) {
		this.hasPets = hasPets;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	public Picture getMainPic() {
		return mainPic;
	}

	public void setMainPic(Picture mainPic) {
		this.mainPic = mainPic;
	}
}