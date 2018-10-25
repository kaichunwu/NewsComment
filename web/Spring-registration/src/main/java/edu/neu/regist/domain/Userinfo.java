package edu.neu.regist.domain;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.*;


@Entity(name="userinfo")
@Table(name="userinfo")
@NamedQueries({
	@NamedQuery(name="Userinfo.findByUsername", 
			    query="select distinct u from userinfo u left join fetch u.comments c where u.username = :username"),
})
public class Userinfo implements Serializable {

	private long id;
	private String username;
//	private String password;

	private String firstName;
	private String lastName;
	private String birthDate;
	private String email;
	private String address;
	private String phone;
	
	private Set<Comments> comments;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID")
	public Long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}
	@NotNull
	@Column(name = "username")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	@Column(name = "FIRST_NAME")
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	@Column(name = "LAST_NAME")
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	@Column(name = "BIRTH_DATE")
	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	/*	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@Column(name = "birthDate")*/
	@Email(message="Please provide a valid email address")
	@Pattern(regexp=".+@.+\\..+", message="Please provide a valid email address")
	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	@Pattern(regexp=".+,+.+", message="Please provide a valid address")
	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Pattern(regexp="(^$|[0-9]{10})", message="Please provide a valid phone number")
	@Column(name = "phone")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	

	@OneToMany(mappedBy = "userinfo", cascade=CascadeType.ALL, orphanRemoval=true)
	public Set<Comments> getComments() {
		return comments;
	}

	public void setComments(Set<Comments> comments) {
		this.comments = comments;
	}
	
	public void addComment(Comments comment) {
		comment.setUserinfo(this);
		getComments().add(comment);
	}

	@Override
	public String toString() {
		return "Userinfo [id=" + id + ", username=" + username + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", birthDate=" + birthDate + ", email=" + email + ", address=" + address + ", phone=" + phone + "]";
	}
	
}
