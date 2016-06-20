package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExamCourseDao {
   
    public static List<String> retrieveCoursesOfExam(Integer examId,Connection conn ) throws SQLException{
       
        String query="select course_name from examcourse where exam_id="+examId;
       
        PreparedStatement stmt = conn.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
       
        List<String> courseNames = new ArrayList<String>();
       
        while(rs.next()){
            courseNames.add(rs.getString(0));
        }
       
       
       
        return courseNames;
    }

}
