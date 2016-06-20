package com.demo.dto;

import java.util.Date;

public class Student {

	
private int studentId;	
private String fname;
private String lname;
private Date DOB;
private String phone;
private String email;
private Date DOJ;
private String status;
private String gender;
private String Religion;
private String caste;
private Integer branchId;
private Parent parent;
private Fee fee;
private String medium;
private String secondLang;
private Integer rating;
private String ratingDescription;
private String imgSrc;
private String rollNo;


public String getRollNo() {
	return rollNo;
}
public void setRollNo(String rollNo) {
	this.rollNo = rollNo;
}
public String getImgSrc() {
	return imgSrc;
}
public void setImgSrc(String imgSrc) {
	this.imgSrc = imgSrc;
}
public Integer getRating() {
	return rating;
}
public void setRating(Integer rating) {
	this.rating = rating;
}
public String getRatingDescription() {
	return ratingDescription;
}
public void setRatingDescription(String ratingDescription) {
	this.ratingDescription = ratingDescription;
}
public String getSecondLang() {
	return secondLang;
}
public void setSecondLang(String secondLang) {
	this.secondLang = secondLang;
}
public String getMedium() {
	return medium;
}
public void setMedium(String medium) {
	this.medium = medium;
}
public Fee getFee() {
	return fee;
}
public void setFee(Fee fee) {
	this.fee = fee;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}



public Date getDOJ() {
	return DOJ;
}
public void setDOJ(Date dOJ) {
	DOJ = dOJ;
}


public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}

public Parent getParent() {
	return parent;
}
public void setParent(Parent parent) {
	this.parent = parent;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public int getStudentId() {
	return studentId;
}
public void setStudentId(int studentId) {
	this.studentId = studentId;
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
	DOB = dOB;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getReligion() {
	return Religion;
}
public void setReligion(String religion) {
	Religion = religion;
}
public String getCaste() {
	return caste;
}
public void setCaste(String caste) {
	this.caste = caste;
}
public Integer getBranchId() {
	return branchId;
}
public void setBranchId(Integer branchId) {
	this.branchId = branchId;
}

/*public static void main(String[] args) {
	StudentDto dto = new StudentDto();
	dto.setDOB(null);
	System.out.println(dto.getDOB());
}*/







}
