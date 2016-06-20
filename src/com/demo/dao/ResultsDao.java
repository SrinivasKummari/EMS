package com.demo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import sun.reflect.ReflectionFactory.GetReflectionFactoryAction;

import com.demo.dto.Address;
import com.demo.dto.Results;

public class ResultsDao {

	
	public static List<Results> retriveDataByStudentId(Integer sid,Connection conn) throws SQLException{
		

		Statement 	stmt = conn.createStatement();
		Address address = new Address();
	
		if(sid!=null){
			
		String query ="	select * from address where address_id='"+sid+"'";
		
		ResultSet rs = stmt.executeQuery(query);

		while(rs.next()){
			
			//System.out.println("it is in result set");
			address.setAddressId(rs.getInt(1));
			address.setHouseNo(rs.getString(2));
			address.setStreet(rs.getString(3));
			address.setLocality(rs.getString(4));
			address.setCity(rs.getString(5));
			address.setState(rs.getString(6));
			address.setZipCode(rs.getString(6));
		
			
			
		}

		}
		
		
		
		return null;
		
	}
	public static ResultSet retriveDataByStudentExamId(Integer sid,Integer examId ,Connection conn) throws SQLException{
		
System.out.println("retriveDataByStudentExamId");
		Statement 	stmt = conn.createStatement();
		
		List<Results> resultsList = new ArrayList<Results>();
		Results results = new Results();
		ResultSet rs = null;
		
		if(sid!=null){
			
		String query ="select s.roll_no,ec.course_name,r.marks,ec.max_marks,concat(s.first_name,' ' ,s.last_name) name from results r,examcourse ec,student s " +
				" where r.course_id=ec.course_id and r.exam_id=ec.exam_id and s.student_id=r.student_id and r.student_id="+sid+" and r.exam_id="+examId+" order by ec.course_id";
		System.out.println(query);
		rs = stmt.executeQuery(query);

		/*while(rs.next()){
			
			//System.out.println("it is in result set");
			results.setExamId(rs.getInt(1));0000000
			results.setStudentid(rs.getInt(2));
			results.setCourseId(rs.getInt(3));
			results.setMarks(rs.getDouble(4));
			
		
			
			resultsList.add(results);
		}
*/       
		}
		
		
		
		//return resultsList;
		 return rs;
	}


public static void main(String[] args) throws SQLException {
	Connection conn = ConnectionProvider.getConnection();
	
	ResultSet rs= retriveDataByStudentExamId(146, 1, conn);
	
	System.out.println(rs);
	
}
}
