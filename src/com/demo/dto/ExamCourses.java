package com.demo.dto;

public class ExamCourses {
   
    private Integer examId;
    private Integer CousreId;
    private String courseName;
    private Integer maxMarks;
    
    
    public Integer getMaxMarks() {
		return maxMarks;
	}
	public void setMaxMarks(Integer maxMarks) {
		this.maxMarks = maxMarks;
	}
	public Integer getExamId() {
        return examId;
    }
    public void setExamId(Integer examId) {
        this.examId = examId;
    }
    public Integer getCousreId() {
        return CousreId;
    }
    public void setCousreId(Integer cousreId) {
        CousreId = cousreId;
    }
    public String getCourseName() {
        return courseName;
    }
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

}