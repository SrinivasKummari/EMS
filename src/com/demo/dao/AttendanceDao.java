package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.demo.dto.Attendance;
import com.demo.dto.ClassRoom;
import com.demo.dto.Parent;
import com.demo.dto.Student;
import com.demo.dto.Users;
import com.demo.util.ExtendDate;

public class AttendanceDao {
public static int insert(Attendance attendance,Connection conn) throws SQLException{

		//to_date('"+new java.sql.Date(attendance.getToDay().getTime()).toString()+"','yyyy-MM-dd')"+","+attendance.getStudent().getStudentId()+",'"+attendance.getStatus()+"','"+attendance.getIsHoliday()+"','"+attendance.getDesc()+"',"+attendance.getClassId()+")
	String query = "insert into Attendance(TO_DATE,Student_id,status,is_holiday,description,classroom_id) values(?,?,?,?,?,?)";
	
		System.out.println(query);
			//String str="select * from student";
	PreparedStatement 	stmt = conn.prepareStatement(query);
	    
		   //ResultSet rs = stmt.executeQuery(str);
		   
stmt.setDate(1,new java.sql.Date(attendance.getToDay().getTime()));
stmt.setInt(2,attendance.getStudent().getStudentId());
stmt.setString(3,attendance.getStatus());
stmt.setString(4, attendance.getIsHoliday());
stmt.setString(5, attendance.getDesc());
stmt.setInt(6, attendance.getClassId());

	
			System.out.println("query" +query);
		   
			int i = stmt.executeUpdate();
			if(i>0){
				
				System.out.println("Sql statement executed successfully");
			}
		    
		   
			
			
			System.out.println("Disconnected from database");
			return i;
		}

	public static List<Attendance> retriveDataById(String sid,Connection conn ) throws SQLException{
		
		

		//Connection conn =DbConn.getConn();
		
		Statement 	stmt = conn.createStatement();
	List<Attendance> attendanceDtos = new ArrayList<Attendance>();
		
		if(sid!=null){
			
		String query ="	select * from attendance where student_id='"+sid+"'";
		
		ResultSet rs = stmt.executeQuery(query);

		while(rs.next()){
			Attendance dto = new Attendance();
			//System.out.println("it is in result set");
			dto.setToDay(rs.getDate(1));
			dto.setStudent(StudentDao.retriveData(rs.getInt(2),conn).get(0));
			dto.setIsHoliday(rs.getString(3));
			
		attendanceDtos.add(dto);
		}
		
		}
		
		conn.close();	
		
		return attendanceDtos;
		
	}
	
	public static ResultSet retriveAttendance(Integer stdId,Connection conn) throws SQLException{
		String query="select count(*),(select count(*) " +
				"from attendance where student_id='"+stdId+"') total_working ,monthname(to_date) month,status " +
				"from attendance where student_id='"+stdId+"' group by month,status order by month(to_date),status;";
		PreparedStatement stmt=conn.prepareStatement(query);
		ResultSet rs=stmt.executeQuery();
		
		return rs;
	}
	
	public static boolean retriveDataByclassDay(Integer classId,Date date,Connection conn ) throws SQLException{
		
		

		//System.out.println(date);
		
		
	//List<Attendance> attendanceDtos = new ArrayList<Attendance>();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String strdate= df.format(date);
		System.out.println("date---------"+date);
		System.out.println("strdate----------"+strdate);
		
		if(classId!=null){
		//	System.out.println(classId+"------------"+strdate);
			//select * from attendance where classroom_id="+classId+" and date_format(to_date,'%d %m %Y')= '"+strdate+"'";
		String query ="	select * from attendance where classroom_id=? and to_date=?";
		
		System.out.println(query);
		
		PreparedStatement 	stmt = conn.prepareStatement(query);
		
		stmt.setInt(1, classId);
		stmt.setDate(2, new java.sql.Date(date.getTime()));
		ResultSet rs = stmt.executeQuery();

		while(rs.next()){
			System.out.println("it is in attendance dao resultset");
			/*Attendance dto = new Attendance();
			//System.out.println("it is in result set");
			dto.setToDay(rs.getDate(1));
			dto.setStudentId(rs.getInt(2));
			dto.setIsHoliday(rs.getString(3));
			*/
		return true;
		}
		
		}
		
		return false;
		
	}

public static String retriveAttendanceByIdAndDate(Integer sid,Date date,Connection conn ) throws SQLException{
		
		//Statement 	stmt = conn.createStatement();
	

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String toDate= df.format(date);
		if(sid!=null && toDate!=null ){
			String query ="	select status from attendance where student_id='"+sid+"' and to_date='"+toDate+"'";	
		//String query ="	select status from attendance where student_id=? and to_date=?";
		System.out.println(query);
PreparedStatement 	stmt = conn.prepareStatement(query);
		
		stmt.setInt(1, sid);
		stmt.setDate(2, new java.sql.Date(date.getTime()));
		ResultSet rs = stmt.executeQuery();
		
		if(!rs.wasNull()){
			
			while(rs.next()){
			
			System.out.println("it is in result set");
			return rs.getString(1);
			
		
		}
		}else{
			System.out.println("resultset is empty");
			return null;
		}
		}
		
		return null;
		
	}
public static boolean updateAttendanceByIdAndDate(Integer id,Date date,String status,Connection conn) throws SQLException{
	System.out.println("student Id vlaue is---->"+id);
	String query="Update attendance set status='"+status+"' where student_id='"+id+"' and to_date='"+date+"'";
	
	Statement statement=conn.createStatement();
	int i=statement.executeUpdate(query);
	
	if(i>0){
		return true;
	}else{
	
		return false;
	}
	
}



public static void main(String[] args) throws SQLException {
	
	Connection conn= ConnectionProvider.getConnection();
	/*System.out.println("calender"+new java.util.Date(2013,06,16));*/
	//System.out.println("entry-----"+retriveDataByclassDay(23, new java.util.Date(2013,06,16), conn));
	/*Attendance attendance = new Attendance();
	Student student = new Student();
	student.setStudentId(1);
	ClassRoom classRoom = new ClassRoom();
	classRoom.setId(23);*/
	System.out.println(AttendanceDao.retriveAttendanceByIdAndDate(1, new java.util.Date(2013,8,19), conn));
	
	/*attendance.setStudent(student);
	attendance.setStatus("P");
	attendance.setClassroom(classRoom);
	attendance.setToDay(new Date());
  attendance.setClassId(23);*/	
//	System.out.println(insert(attendance, conn));
	/*ResultSet rs=retriveAttendance(143, conn);
	rs.next();
	System.out.println(rs.getInt(1));
	System.out.println(rs.getInt(2));
	System.out.println(rs.getString(3));
	System.out.println(rs.getString(4));
	//rs.next();
	System.out.println("second--"+rs.getInt(1));
	System.out.println(rs.getInt(2));
	System.out.println(rs.getString(3));
	System.out.println(rs.getString(4));*/
	conn.commit();
	conn.close();
}
}
