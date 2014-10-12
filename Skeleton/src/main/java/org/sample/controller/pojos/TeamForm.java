package org.sample.controller.pojos;

import java.util.Date;

public class TeamForm {


    private Long id;
    private String teamName;
    private Date creationDate;

    public void setTeamName(String _teamName) {
    	this.teamName = _teamName;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setCreationDate() {
        this.creationDate = new Date();
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}