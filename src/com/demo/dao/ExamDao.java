package com.demo.dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.demo.dto.Exam;

public class ExamDao {

public static List<Exam> retrieveExamsOfClass(Integer classId,Connection conn) throws SQLException{
   
    String query="select * from Exam where class_id="+String.valueOf(classId);
   
    PreparedStatement stmt = conn.prepareStatement(query);
   
    ResultSet rs= stmt.executeQuery();
   
    List<Exam> exams = new ArrayList<Exam>();
    while(rs.next()){
        Exam exam = new Exam();
        exam.setExamId(rs.getInt(1));
        exam.setExamTypeId(rs.getInt(2));
        exam.setDesc(rs.getString(3));
        exam.setDateConducted(rs.getDate(4));
        exam.setClassId(rs.getInt(5));
        exams.add(exam);
    }
    return exams;
   
}
public static void main(String[] args) throws SQLException {
    Connection conn = ConnectionProvider.getConnection();
    System.out.println(retrieveExamsOfClass(1, conn).get(0).getExamId());

    System.out.println(retrieveExamsOfClass(1, conn).get(1).getDesc());
   
}
}

