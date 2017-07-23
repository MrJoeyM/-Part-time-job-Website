package com.baiyaotech.bean;

import java.util.ArrayList;

public class Employee {

	private String employeeId;

	private String university;

	private String position;

	private String password;

	private String contact;
	
	public Employee() {

	}

	public Employee(String employeeId,String university,
			String position, String password, String contact) {
		super();
		this.employeeId = employeeId;
		this.university = university;
		this.position = position;
		this.password = password;
		this.contact = contact;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
}
