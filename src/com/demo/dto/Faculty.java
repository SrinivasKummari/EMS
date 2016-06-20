package com.demo.dto;

import java.util.Date;

public class Faculty {
	
	private Integer facultyId;
	private String fname;
	private String lname;
	private Date DOB;
	private String gender;
	private String phone;
	private String email;
    private Date DOJ;
    private Integer barnchId;
    private String qualification;
    private Float experience;
    private Float previousCTC;
    private Float currentCTC;
    private String previous_school;
    private String subject;
    private String imgSrc;
    
    
    public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
    public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public Float getExperience() {
		return experience;
	}
	public void setExperience(Float experience) {
		this.experience = experience;
	}
	public Float getPreviousCTC() {
		return previousCTC;
	}
	public void setPreviousCTC(Float previousCTC) {
		this.previousCTC = previousCTC;
	}
	public Float getCurrentCTC() {
		return currentCTC;
	}
	public void setCurrentCTC(Float currentCTC) {
		this.currentCTC = currentCTC;
	}
	public String getPrevious_school() {
		return previous_school;
	}
	public void setPrevious_school(String previous_school) {
		this.previous_school = previous_school;
	}
	public Integer getFacultyId() {
		return facultyId;
	}
	public void setFacultyId(Integer facultyId) {
		this.facultyId = facultyId;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public Date getDOB() {
		return DOB;
	}
	public void setDOB(Date dOB) {
		this.DOB = dOB;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDOJ() {
		return DOJ;
	}
	public void setDOJ(Date dOJ) {
		DOJ = dOJ;
	}
	public Integer getBarnchId() {
		return barnchId;
	}
	public void setBarnchId(Integer barnchId) {
		this.barnchId = barnchId;
	}
}
