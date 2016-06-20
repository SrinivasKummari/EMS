package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.demo.dto.FacultyAddress;

public class FacultyAddressDao {

	public static int insert(FacultyAddress facultyAddress,Connection connection) throws SQLException{
		
		String query="insert into faculty_address(faculty_id,address_id) values(?,?)";
		PreparedStatement statement=connection.prepareStatement(query);
		statement.setInt(1, facultyAddress.getFacultyId());
		statement.setInt(2, facultyAddress.getAddressId());
		
		int i=0;
		i=statement.executeUpdate();
		return i;
	}
	
	public static FacultyAddress retriveData(Integer fid,Connection conn ) throws SQLException{
	     
		 
	    Statement     stmt = conn.createStatement();
	     
	 
	    /******
	     * need to implement for searching with name
	     * 
	     * *****/
	FacultyAddress dto = new FacultyAddress();
	    if(fid!=null){
	         
	    String query ="    select * from faculty_address where faculty_id='"+fid+"'";
	     
	    ResultSet rs = stmt.executeQuery(query);
	     
	 
	    while(rs.next()){
	         
	        //System.out.println("it is in result set");
	        dto.setFacultyId(rs.getInt(1));
	        dto.setAddressId(rs.getInt(2));
	        }
	     
	    }
	     
	    stmt.close();
	     
	    return dto;
	     
	}
}
