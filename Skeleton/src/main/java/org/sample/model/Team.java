package org.sample.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;


@Entity
public class Team {

    @Id
    @GeneratedValue
    private Long id;

    private String teamName;
    private Date creationDate;
    
    @OneToOne
    private Address address; 
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate() {
    	this.creationDate = new Date();
    }
	
	
}
