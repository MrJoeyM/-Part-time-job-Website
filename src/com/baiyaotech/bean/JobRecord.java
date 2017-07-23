package com.baiyaotech.bean;

public class JobRecord {

	private String id;

	private String employeeId;

	private String jobId;

	private Employee employee;
	
	private JobInfo jobInfo;
	
	public JobRecord() {

	}

	public JobRecord(String id, String employeeId, String jobId) {
		super();
		this.id = id;
		this.employeeId = employeeId;
		this.jobId = jobId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public JobInfo getJobInfo() {
		return jobInfo;
	}

	public void setJobInfo(JobInfo jobInfo) {
		this.jobInfo = jobInfo;
	}

}
