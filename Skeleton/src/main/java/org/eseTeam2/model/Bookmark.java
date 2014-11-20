package org.eseTeam2.model;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
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
public class Bookmark {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	private Advertisement ad;

	@ManyToOne
	private User bookmarker;

	public Long getId() {
	    return id;
	}

	public void setId(Long id) {
	    this.id = id;
	}

	public Advertisement getAd() {
	    return ad;
	}

	public void setAd(Advertisement ad) {
	    this.ad = ad;
	}

	public User getBookmarker() {
	    return bookmarker;
	}

	public void setBookmarker(User bookmarker) {
	    this.bookmarker = bookmarker;
	}
	
	
	
	

	
	

	
}