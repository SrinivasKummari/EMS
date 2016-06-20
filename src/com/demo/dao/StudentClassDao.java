package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.demo.dto.ClassRoom;
import com.demo.dto.StudentClass;
import com.demo.dto.Student;

import java.util.*;
public class StudentClassDao {
	
	public static StudentClass retrieveData(Integer i,Connection conn) throws SQLException{
		StudentClass studentClass=new StudentClass();
		Statement stmt=conn.createStatement();
		if(i!=null){
			
			String query="select * from class_student where student_id='"+i+"'";
			ResultSet rs=stmt.executeQuery(query);
			if(rs.next()){
				studentClass.setClassroom(ClassRoomDao.retriveData(rs.getInt(1), conn));
				studentClass.setStudent(StudentDao.retriveData(rs.getInt(2),conn).get(0));
			
				System.out.println("class room id is---"+studentClass.getClassroom());
			}else{
				System.out.println("no results found in the student class table");
			}
		}
		
		return studentClass;
	}

	
    public static int insert(StudentClass studentClass,Connection connection) throws SQLException{
        
        String query="insert into CLASS_STUDENT(student_id,classroom_id) values(?,?)";
       
        /*Connection conn= ConnectionProvider.getConnection();*/
        java.sql.PreparedStatement statement = connection.prepareStatement(query);
       
        statement.setObject(1, studentClass.getStudent().getStudentId());
        statement.setObject(2, studentClass.getClassroom().getId());
       
        int i=statement.executeUpdate();
       
        System.out.println("inserted roows----"+i);
        statement.close();
    /*
    connection.commit();
    connection.close();*/
    return i;
    }
	
 public static boolean update(StudentClass studentClass,Connection conn) throws SQLException{
	 
	 String query="update CLASS_STUDENT set classroom_id=?  where student_id=?";
PreparedStatement stmt= conn.prepareStatement(query);

stmt.setInt(1, studentClass.getClassroom().getId());
stmt.setInt(2, studentClass.getStudent().getStudentId());

int i=stmt.executeUpdate();

	 return true;
 }

public static List<Student> retriveDataByClass(int i,Connection conn ) throws SQLException{            

    Statement     stmt = conn.createStatement();            
    //StudentClass class1 = new StudentClass();
    List<Student> studentlist= new ArrayList<Student>();
    if(i!=0){
        
    String query ="    select * from class_student  where classroom_id='"+i+"'";
    
    ResultSet rs = stmt.executeQuery(query);

    while(rs.next()){
        
        System.out.println("it is in retriveDataByClass result set");
        //class1.setClassroomId(rs.getInt(1));
        //System.out.println(parent.getParentId());
        //class1.setStudentId(rs.getInt(2));
        //class1.setLastName(rs.getString(3));
        
        studentlist.add(StudentDao.retriveData(rs.getInt(2),conn).get(0));
    
    }
    stmt.close();
    return studentlist;
    }else{
    
        stmt.close();
    return studentlist;
    }
    
}

}