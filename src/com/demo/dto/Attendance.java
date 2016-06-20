package com.demo.dto;
import java.util.Date;


public class Attendance {
   
    private Date toDay;
    private Student student;
    private String isHoliday;
    private ClassRoom classroom;
    private String status;
    private String desc;
    private Integer classId;
    public Integer getClassId() {
        return classId;
    }
    public void setClassId(Integer classId) {
        this.classId = classId;
    }
    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public Date getToDay() {
        return toDay;
    }
    public void setToDay(Date toDay) {
        this.toDay = toDay;
    }
   
    public Student getStudent() {
        return student;
    }
    public void setStudent(Student student) {
        this.student = student;
    }
    public ClassRoom getClassroom() {
        return classroom;
    }
    public void setClassroom(ClassRoom classroom) {
        this.classroom = classroom;
    }
    public String getIsHoliday() {
        return isHoliday;
    }
    public void setIsHoliday(String isHoliday) {
        this.isHoliday = isHoliday;
    }
   
   
   

}