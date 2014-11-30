package org.eseTeam2.controller.pojos;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.jsoup.Jsoup;

/**
 * Signup form, used to register. COntains all information to create a new User object.
 * @author Icewater
 *
 */
public class SignupForm {

	
    private Long id;
    @Size(min=1, message = "Please enter your first name.")
    private String firstName;
    @Size(min=1, message = "Please enter your last name.")
    private String lastName;
    @Size(min=6, max=20, message="Please enter a password with a character count between 6 and 20.")
    private String password;

    @NotNull
    @Pattern(regexp = "[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", 
    message = "Please enter a valid email address.")
    private String email;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = Jsoup.parse(firstName).text();
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = Jsoup.parse(lastName).text();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
}
