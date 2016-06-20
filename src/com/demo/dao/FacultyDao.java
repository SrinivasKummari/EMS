package com.demo.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.demo.dto.Faculty;
import com.demo.dto.Parent;
import com.demo.dto.Faculty;

public class FacultyDao {
	

	public static int insert(Faculty faculty,Connection conn) throws SQLException{
		String query="insert into faculty(first_name,last_name,dob,phone,email_id,doj,qualification,experience,PREVIOUSE_CTC,current_ctc,previous_school,course,gender,img_src) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement stmt=conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1, faculty.getFname());
		stmt.setString(2, faculty.getLname());


java.util.Date utilStartDate = faculty.getDOB();
java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
		stmt.setDate(3, sqlStartDate);
		stmt.setString(4, faculty.getPhone());
		stmt.setString(5, faculty.getEmail());
		java.util.Date utilStartDate1 = faculty.getDOJ();
		java.sql.Date sqlStartDate1 = new java.sql.Date(utilStartDate1.getTime());

		stmt.setDate(6, sqlStartDate1);
		stmt.setString(7, faculty.getQualification());
		stmt.setFloat(8, faculty.getExperience());
		stmt.setFloat(9, faculty.getPreviousCTC());
		stmt.setFloat(10, faculty.getCurrentCTC());
		stmt.setString(11, faculty.getPrevious_school());
		stmt.setString(12, faculty.getSubject());
		stmt.setString(13, faculty.getGender());
		stmt.setString(14, faculty.getImgSrc());
		System.out.println(faculty.getSubject());
		System.out.println(faculty.getFname());
		int i=stmt.executeUpdate();
		
		ResultSet rs=stmt.getGeneratedKeys();
		System.out.println("i value in faculty insert---"+i);
		if(i>0){
			System.out.println("Sql statement executed successfully");
			if(rs.next()){
				return rs.getInt(1);
			}
		
			stmt.close();
			return i;
		}
		else{
			conn.commit();
	   		conn.close();
		System.out.println("Disconnected from database");
		return i;
		}
	}
	
	public static List<Faculty> retriveData(Integer fid,String name,Connection conn ) throws SQLException{
		

		Statement 	stmt = conn.createStatement();
		
	List<Faculty> facultyList = new ArrayList<Faculty>();
		/******
		 * need to implement for searching with name
		 * 
		 * *****/
		if(fid!=null){
			
		String query ="	select * from Faculty where Faculty_id='"+fid+"'";
		
		ResultSet rs = stmt.executeQuery(query);
		int i=0;
		while(rs.next()){
			Faculty faculty = new Faculty();
			System.out.println("it is in result set");
			faculty.setFacultyId(rs.getInt(1));
			faculty.setFname(rs.getString(2));
			faculty.setLname(rs.getString(3));
			
	/*		DOB	date	YES			
			phone	varchar(30)	YES			
			email_id	varchar(30)	YES			
			DOJ	date	YES			
			parent_id	int(30)	YES	MUL		
			status	varchar(2)	YES			
			branch_id	int(30)	YES			
			gender	varchar(1)	YES			
			religion	varchar(10)	YES			
			caste	varchar(10)	YES			
			medium	varchar(10)	YES			
	*/
			
			faculty.setDOB(rs.getDate(4));
			faculty.setPhone(rs.getString(5));
			faculty.setEmail(rs.getString(6));
			faculty.setDOJ(rs.getDate(7));
			faculty.setQualification(rs.getString(10));
			faculty.setExperience(rs.getFloat(11));
			faculty.setPreviousCTC(rs.getFloat(12));
			faculty.setCurrentCTC(rs.getFloat(13));
			faculty.setPrevious_school(rs.getString(14));
			faculty.setSubject(rs.getString(15));
			faculty.setGender(rs.getString(16));
			faculty.setImgSrc(rs.getString(17));
		//	
			//Faculty.setParent(parent.setParentId(Integer.valueOf(rs.getInt(8))));
		facultyList.add(faculty);
		}

		}
		
		
		
		return facultyList;
		
	}

	public static boolean update(Faculty faculty) throws SQLException{
		String query = "update Faculty set Faculty_id=?,first_name=?,last_name=?,DOB=?,phone=?,email_id=?,doj=?,parent_id=?,img_src=?";
		
		PreparedStatement 	stmt = ConnectionProvider.getConnection().prepareStatement(query);
		stmt.setInt(1, faculty.getFacultyId());
		stmt.setString(2, faculty.getFname());
		stmt.setString(3, faculty.getLname());
		stmt.setDate(4, (java.sql.Date)faculty.getDOB());
		stmt.setString(5, faculty.getPhone());
		stmt.setString(6, faculty.getEmail());
		stmt.setDate(7,(java.sql.Date) faculty.getDOJ());
		stmt.setString(8, faculty.getImgSrc());
	
		
		int i=stmt.executeUpdate();
		if(i>0){
			return true;
		}
		
		return false;
	}
	public static boolean delete(Integer sid) throws SQLException{
		
		String query="delete from Faculty where Faculty_id="+sid;
		
		Statement stmt = ConnectionProvider.getConnection().createStatement();
		
		int i =stmt.executeUpdate(query);
		if(i>0)
		return true;
	    return false;
	}

	public static int getMaxId() throws SQLException{
		String str="select max(Faculty_id) from Faculty";
		
		Statement statement = ConnectionProvider.getConnection().createStatement();
		ResultSet rs= statement.executeQuery(str);
		int i=0;
		if(rs.next()){
			 i= rs.getInt(1);
		}
		
		return i;
	}
	public static void main(String[] args) throws SQLException {
		

		
		Faculty dto = new Faculty();
		
		dto.setFacultyId(1);
		dto.setFname("rajasekhar");
		dto.setLname("reddy");
		dto.setPhone("9000106097");
		dto.setEmail("abcd@gmail.com");
		dto.setDOB(new java.sql.Date(12, 12, 2013));
		dto.setDOJ(new java.sql.Date(12, 12, 2013));
		
		Parent parent = new Parent();
		parent.setParentId(11);
		
		
		
		//FacultyDao.insert(dto);
		//Faculty dto2= FacultyDao.retriveData(1, null).get(0);
//		System.out.println(dto2.getFname()+"--"+dto2.getLname());
		Connection connection = ConnectionProvider.getConnection();
		System.out.println(FacultyDao.insert(dto,connection));
		connection.commit();
		connection.close();
		//System.out.println(FacultyDao.delete(dto.getFacultyId()));
	}
	

	
}