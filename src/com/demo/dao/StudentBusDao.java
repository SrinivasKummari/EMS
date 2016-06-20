package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.demo.dto.StudentBus;

public class StudentBusDao {

	public static String retrieveStopNo(int stdId,Connection conn) throws SQLException{
		String stopNo=null;
		String query="select stop_no from student_bus where student_id='"+stdId+"'";
		
		PreparedStatement stmt=conn.prepareStatement(query);
		ResultSet  rs=stmt.executeQuery();
		if(rs!=null){
			while(rs.next()){
				stopNo=rs.getString(1);
			}
		}else{
			System.out.println("Result set has null");
		}
		return stopNo;
	}
	
	public static int updateStudentBus(StudentBus studentBus,Connection conn) throws SQLException{
		int i=0;
		String query="update student_bus set stop_no='"+studentBus.getStopNo()+"' where student_id='"+studentBus.getStudentId()+"'";
		PreparedStatement stmt=conn.prepareStatement(query);
		i=stmt.executeUpdate();
		return i;
	}
}
