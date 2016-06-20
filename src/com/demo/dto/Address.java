package com.demo.dto;

public class Address {

 private Integer addressId;
 private String houseNo;
 private String street;
 private String locality;
 private String city;
 private String state;
 private String zipCode;
 private String country;
public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}
public Integer getAddressId() {
	return addressId;
}
public void setAddressId(Integer addressId) {
	this.addressId = addressId;
}
public String getHouseNo() {
	return houseNo;
}
public void setHouseNo(String houseNo) {
	this.houseNo = houseNo;
}
public String getStreet() {
	return street;
}
public void setStreet(String street) {
	this.street = street;
}
public String getLocality() {
	return locality;
}
public void setLocality(String locality) {
	this.locality = locality;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getZipCode() {
	return zipCode;
}
public void setZipCode(String zipCode) {
	this.zipCode = zipCode;
}
 
}
