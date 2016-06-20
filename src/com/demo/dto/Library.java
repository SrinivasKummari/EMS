package com.demo.dto;

import java.util.Date;

public class Library {

	private int studentId;
	private String bookCode;
	private String bookName;
	private Date issueDate;
	private int submissionStatus;
	private int noOfDays;
	
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getBookCode() {
		return bookCode;
	}
	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public Date getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}
	public int getSubmissionStatus() {
		return submissionStatus;
	}
	public void setSubmissionStatus(int submissionStatus) {
		this.submissionStatus = submissionStatus;
	}
	public int getNoOfDays() {
		return noOfDays;
	}
	public void setNoOfDays(int noOfDays) {
		this.noOfDays = noOfDays;
	}
}
