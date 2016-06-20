package com.demo.dto;

public class ClassRoom {

	private Integer id;
	 private Integer gradeId;
	 private String section;
	 private Integer assignedFaculty;
	 private String status;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getGradeId() {
		return gradeId;
	}
	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public Integer getAssignedFaculty() {
		return assignedFaculty;
	}
	public void setAssignedFaculty(Integer assignedFaculty) {
		this.assignedFaculty = assignedFaculty;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
