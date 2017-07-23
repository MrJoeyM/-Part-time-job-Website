package com.baiyaotech.bean;

public class JobInfo {

	private String jobId;

	private String employerId;

	private String jobTitle;

	private String description;

	private int surplus;

	private String position;

	private String price;

	private String time;

	private int total;

	private String duration;

	private String category;

	private String location;

	private String contact;

	private String checked;
	
	private String company;
	
	private String bond;

	public JobInfo() {

	}

	public JobInfo(String jobId, String employerId, String jobTitle,
			String description, int surplus, String position, String price,
			String time, int total, String duration, String category,
			String location, String contact,String checked,String company,String bond) {
		super();
		this.jobId = jobId;
		this.employerId = employerId;
		this.jobTitle = jobTitle;
		this.description = description;
		this.surplus = surplus;
		this.position = position;
		this.price = price;
		this.time = time;
		this.total = total;
		this.duration = duration;
		this.category = category;
		this.location = location;
		this.contact = contact;
		this.checked = checked;
		this.company = company;
		this.bond = bond;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getEmployerId() {
		return employerId;
	}

	public void setEmployerId(String employerId) {
		this.employerId = employerId;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getSurplus() {
		return surplus;
	}

	public void setSurplus(int surplus) {
		this.surplus = surplus;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}
	
	public void setBond(String bond){
		this.bond = bond;
	}
	
	public String getBond(){
		return bond;
	}
}
