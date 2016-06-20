
package com.demo.dto;

import java.util.Date;

public class Exam {
    private Integer examId;
    private Integer examTypeId;
    private String desc;
    private Date dateConducted;
    private Integer classId;
    public Integer getExamId() {
        return examId;
    }
    public void setExamId(Integer examId) {
        this.examId = examId;
    }
    public Integer getExamTypeId() {
        return examTypeId;
    }
    public void setExamTypeId(Integer examTypeId) {
        this.examTypeId = examTypeId;
    }
    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
    public Date getDateConducted() {
        return dateConducted;
    }
    public void setDateConducted(Date dateConducted) {
        this.dateConducted = dateConducted;
    }
    public Integer getClassId() {
        return classId;
    }
    public void setClassId(Integer classId) {
        this.classId = classId;
    }
    

}


