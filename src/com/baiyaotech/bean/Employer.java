package com.baiyaotech.bean;

public class Employer {

	private String employerId;

	private String company;

	private String password;

	private String description;

	private String position;
	
	private String contact;
	
	public Employer() {

	}

	public Employer(String employerId, String company) {

		this.employerId = employerId;
		this.company = company;
	}

	public String getEmployerId() {
		return employerId;
	}

	public void setEmployerId(String employerId) {
		this.employerId = employerId;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	@Override
	public String toString() {
		return "Employer [employerId=" + employerId + ", company=" + company
				+ ", password=" + password + ", description=" + description
				+ ", position=" + position + ", contact=" + contact + "]";
	}
}
