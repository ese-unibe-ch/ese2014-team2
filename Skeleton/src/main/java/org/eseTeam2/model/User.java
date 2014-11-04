package org.eseTeam2.model;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.NaturalId;





@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String firstName;
    private String lastName;
    
    @NaturalId( mutable = false)
    @Column(name = "EMAIL", unique = true, nullable = false, length = 100)
    private String email;
    private String password;
    
  
   
	private boolean enabled;

	@OneToMany(mappedBy = "user", cascade= CascadeType.ALL)
	private Set<UserRole> userRole;
	
	@OneToMany(fetch = FetchType.EAGER)
	private Set<Advertisement> advertisements;
	
	@OneToOne(fetch = FetchType.EAGER)
	private Roomie roomie;

	/*
	@OneToMany(fetch = FetchType.EAGER)
	private Set<Roomie> roomies;
	*/
	
	/*
	@OneToMany(fetch = FetchType.EAGER, mappedBy ="sender", cascade = CascadeType.ALL)
	private Set<Message> sender;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy ="recipient", cascade = CascadeType.ALL)
	private Set<Message> recipient; */
	
	@OneToMany(mappedBy="sender", fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Message> sender;
	
	@OneToMany(mappedBy="recipient", fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Message> recipient;
	
	
	@OneToMany(mappedBy="notifications", fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Message> notifications;
	
	
	@OneToMany(mappedBy="appointmentInvitations", fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Message> appointmentInvitations;
	
	
	@ManyToMany(mappedBy="invitations", fetch=FetchType.EAGER)
	private List<Appointment> usersInvitations;
	
	@OneToMany(mappedBy="adOwner", fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Appointment> adOwnerAppointments;
	
	@ManyToMany (mappedBy="interessents", fetch=FetchType.EAGER)
	private  Set<Advertisement> adsUserIsInterestedIn;
			
	
	@OneToOne 
	private CustomFilterAd exampleAd;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }



	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	public Set<UserRole> getUserRole() {
		return userRole;
	}

	public void setUserRole(Set<UserRole> userRole) {
		this.userRole = userRole;
	}

	public Set<Advertisement> getAdvertisements() {
		return advertisements;
	}

	public void setAdvertisements(Set<Advertisement> advertisements) {
		this.advertisements = advertisements;
	}

	public Roomie getRoomie() {
		return roomie;
	}

	public void setRoomie(Roomie roomie) {
		this.roomie = roomie;
	}

	public List<Message> getRecipient() {
		return recipient;
	}

	public void setRecipient(List<Message> recipient) {
		this.recipient = recipient;
	}

	public List<Message> getSender() {
		return sender;
	}

	public void setSender(List<Message> sender) {
		this.sender = sender;
	}

	public Set<Advertisement> getAdsUserIsInterestedIn() {
		return adsUserIsInterestedIn;
	}

	public void setAdsUserIsInterestedIn(Set<Advertisement> adsUserIsInterestedIn) {
		this.adsUserIsInterestedIn = adsUserIsInterestedIn;
	}

	public List<Message> getNotifications() {
		return notifications;
	}

	public void setNotifications(List<Message> notifications) {
		this.notifications = notifications;
	}

	public List<Message> getAppointmentInvitations() {
		return appointmentInvitations;
	}

	public void setAppointmentInvitations(List<Message> appointmentInvitations) {
		this.appointmentInvitations = appointmentInvitations;
	}

	public List<Appointment> getUsersInvitations() {
		return usersInvitations;
	}

	public void setUsersInvitations(List<Appointment> usersInvitations) {
		this.usersInvitations = usersInvitations;
	}

	public CustomFilterAd getExampleAd() {
		return exampleAd;
	}

	public void setExampleAd(CustomFilterAd exampleAd) {
		this.exampleAd = exampleAd;
	}

	



	
	
}
