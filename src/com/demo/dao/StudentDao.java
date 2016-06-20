package com.demo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;


import com.demo.dto.Fee;
import com.demo.dto.Parent;
import com.demo.dto.Student;


public class StudentDao {

	


	public static int insert(Student studentDto,Connection conn) throws SQLException{

		
		//Connection conn= ConnectionProvider.getConnection();
				//String str="select * from student";

			String query = "insert into student(student_id,first_name,last_name,phone,email_id,parent_id,caste," +
					"gender,religion,fee_id,medium,DOB,DOJ,second_lang,roll_no,img_src)" +
					" values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement 	stmt = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);

			 //stmt.setInt(1, studentDto.getStudentId());
		stmt.setString(1, studentDto.getFname());
		stmt.setString(2, studentDto.getLname());
		stmt.setString(3, studentDto.getPhone());
		stmt.setString(4, studentDto.getEmail());
		if(studentDto.getParent().getParentId()!=null){
			stmt.setInt(5, studentDto.getParent().getParentId());
			System.out.println("Parent id is been added to Student Table..."+studentDto.getParent().getParentId());
		}else{
		stmt.setObject(5, null);}
		stmt.setString(6, studentDto.getCaste());
		stmt.setString(7, studentDto.getGender());
		stmt.setString(8, studentDto.getReligion());
		if(studentDto.getFee().getFeeId()!=null){
			stmt.setInt(9, studentDto.getFee().getFeeId());
			System.out.println("Fee id is been added to Student Table..."+studentDto.getFee().getFeeId());
		}else{
		stmt.setObject(9, null);}
		stmt.setString(10, studentDto.getMedium());
		stmt.setDate(11,new java.sql.Date( studentDto.getDOB().getTime()));
		stmt.setDate(12, new java.sql.Date(studentDto.getDOJ().getTime()));
		stmt.setString(13, studentDto.getSecondLang());
		stmt.setString(14, studentDto.getRollNo());
		stmt.setString(15, studentDto.getImgSrc());
		
		 int i=stmt.executeUpdate();
			//	int i = stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
				ResultSet rs= stmt.getGeneratedKeys();
				System.out.println("i value in student insert---"+i);
			
				if(i>0){
					System.out.println("Sql statement executed successfully");
				if(rs.next()){
						System.out.println("studentId---"+rs.getInt(1));
						return rs.getInt(1);
					
					}
				
					//conn.commit();
					stmt.close();
					//conn.close();
					return i;
				}
				else{
			    
			   	//	conn.close();
				System.out.println("Disconnected from database");
				
				return i;
				}
			}
public static List<Student> retriveData(Integer sid,Connection conn ) throws SQLException{
	

	Statement 	stmt = conn.createStatement();
	
List<Student> Students = new ArrayList<Student>();
	/******
	 * need to implement for searching with name
	 * 
	 * *****/
	if(sid!=0){
		
	String query ="	select * from student where student_id='"+sid+"'";
	
	ResultSet rs = stmt.executeQuery(query);
	int i=0;
	while(rs.next()){
		Student student = new Student();
		System.out.println("it is in studentdao result set");
		student.setStudentId(rs.getInt(1));
		student.setFname(rs.getString(2));
		student.setLname(rs.getString(3));
		
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
		
		student.setDOB(rs.getDate(4)==null?null:new java.util.Date(rs.getDate(4).getTime()));
		student.setPhone(rs.getString(5));
		student.setEmail(rs.getString(6));
		student.setDOJ(rs.getDate(7)==null?null:new java.util.Date(rs.getDate(7).getTime()));
	//	Parent parent=new Parent();
		//parent.setParentId(rs.getInt(8));
		student.setParent(ParentDao.retriveData(rs.getInt(8), conn));
		student.setStatus(rs.getString(9));
		student.setBranchId(rs.getInt(10));
		student.setGender(rs.getString(11));
		student.setReligion(rs.getString(12));
		student.setCaste(rs.getString(13));
		student.setMedium(rs.getString(14));
		student.setSecondLang(rs.getString(16));
		student.setImgSrc(rs.getString(19));
		student.setRollNo(rs.getString(20));
		//Fee fee =new Fee();
		//fee.setFeeId(rs.getInt(15));
		student.setFee(FeeDao.retriveData(rs.getInt(15), conn));
	//	
		//student.setParent(parent.setParentId(Integer.valueOf(rs.getInt(8))));
	Students.add(student);
	System.out.println("it is in studentdao result set");
	}

	}
	
	
	
	return Students;
	
}

public static Student retriveConductData(Integer sid,Connection conn ) throws SQLException{
	

	Statement 	stmt = conn.createStatement();
	
Student student=new Student();
	 /*
	 * need to implement for searching with name
	 * 
	 * *****/
	if(sid!=null){
		
	String query ="	select first_name,last_name,rating,rating_description from student where student_id='"+sid+"'";
	
	ResultSet rs = stmt.executeQuery(query);
	int i=0;if(!rs.wasNull()){
		
	
	while(rs.next()){
	
		System.out.println("it is in result set");
		student.setFname(rs.getString(1));
		student.setLname(rs.getString(2));
		student.setRating(rs.getInt(3));
		student.setRatingDescription(rs.getString(4));
		
	}
	}else{
		System.out.println("result set doesnt contain any value...");
	}
}
	
	
	
	return student;
	
}


public static Student retriveInfoForLib(Integer sid,Connection conn ) throws SQLException{
	

	Statement 	stmt = conn.createStatement();
	
Student student=new Student();
	 /*
	 * need to implement for searching with name
	 * 
	 * *****/
	if(sid!=null){
		
	String query ="	select img_src,first_name,last_name,roll_no from student where student_id='"+sid+"'";
	
	ResultSet rs = stmt.executeQuery(query);
	int i=0;if(!rs.wasNull()){
		
	
	while(rs.next()){
	
		System.out.println("it is in result set");
		student.setImgSrc(rs.getString(1));
		student.setFname(rs.getString(2));
		student.setLname(rs.getString(3));
		student.setRollNo(rs.getString(4));
		
		
	}
	}else{
		System.out.println("result set doesnt contain any value...");
	}
}
	
	
	
	return student;
	
}





public static boolean update(Student student,Connection conn) throws SQLException{
	String query = "update student set student_id=?, first_name=?,last_name=?,DOB=?,phone=?," +
			       " email_id=?,doj=?,status=?,branch_id=?,gender=?,religion=?,caste=?,medium=?,second_lang=?,img_src=?,roll_no=?  where student_id=?";
	
	PreparedStatement 	stmt = conn.prepareStatement(query);
	System.out.println(query);
	stmt.setInt(1, student.getStudentId());
	stmt.setString(2, student.getFname());
	stmt.setString(3, student.getLname());
	stmt.setDate(4, new java.sql.Date(student.getDOB().getTime()));
	stmt.setString(5, student.getPhone());
	stmt.setString(6, student.getEmail());
	stmt.setDate(7,new java.sql.Date(student.getDOJ().getTime()));
	stmt.setString(8,student.getStatus());
	stmt.setNull(9,java.sql.Types.INTEGER);
	stmt.setString(10,student.getGender());
	stmt.setString(11,student.getReligion());
	stmt.setString(12,student.getCaste());
	stmt.setString(13, student.getMedium());
	stmt.setString(14, student.getSecondLang());
    stmt.setString(15,student.getImgSrc());
    stmt.setString(16,student.getRollNo());
    stmt.setInt(17, student.getStudentId());
    
/*	stmt.setInt(8, student.getParent().getParentId());*/

	int i=stmt.executeUpdate();
	if(i>0){
		return true;
	}
	
	return false;
}


public static boolean updateConduct(Student student,Connection conn) throws SQLException{
	String query = "update student set rating=?,rating_description=?  where student_id=?";
	
	PreparedStatement 	stmt = conn.prepareStatement(query);
	System.out.println(query);
	stmt.setInt(1, student.getRating());
	stmt.setString(2, student.getRatingDescription());
	stmt.setInt(3, student.getStudentId());
	int i=stmt.executeUpdate();
	System.out.println("updated rating successfully-->"+i);
	if(i>0){
		return true;
	}
	
	return false;
}


public static boolean delete(Integer sid) throws SQLException{
	
	String query="delete from student where student_id="+sid;
	
	Statement stmt = ConnectionProvider.getConnection().createStatement();
	
	int i =stmt.executeUpdate(query);
	if(i>0)
	return true;
    return false;
}

public static String getMaxId(String classId,String section) throws SQLException{
	String str="select ifnull(max(substring(roll_no,8)),0)  from student s,classroom c ,class_student cs where s.student_id=cs.student_id " +
			" and cs.classroom_id=c.classroom_id "+ 
"and c.grade_id='"+classId +"' and c.section='"+section+"'";
	
	Statement statement = ConnectionProvider.getConnection().createStatement();
	ResultSet rs= statement.executeQuery(str);
	String rollno = null;
	if(rs.next()){
		 rollno= rs.getString(1);
	}
	
	return rollno;
}

public static String retrieveImage(Integer stdId, Connection conn) throws SQLException{
	
	String query ="select img_src from student where student_id='"+stdId+"'";
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery(query);
	if(!rs.wasNull()){
		while(rs.next()){		
		
		System.out.println("result set is not null");
		System.out.println(rs.getString(1));
		return rs.getString(1);
		}
	}
	
	return null;
}
public static int getStudentId(String rollNo, Connection conn) throws SQLException{
	
	String query ="select student_id from student where roll_no='"+rollNo+"'";
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery(query);
	if(!rs.wasNull()){
		while(rs.next()){		
		
		System.out.println("result set is not null");
		System.out.println(rs.getString(1));
		return rs.getInt(1);
		}
	}
	
	return 0;
}
public static void main(String[] args) throws SQLException, ParseException {
	

/*	
	Student dto = new Student();
	
	dto.setStudentId(1);
	dto.setFname("rajasekhar");
	dto.setLname("reddy");
	dto.setPhone("900010609");
	dto.setEmail("abcd@gmail.com");
	dto.setGender("M");
	
	//dto.setDOB(new java.sql.Date(12, 12, 2013));
	dto.setDOJ(new java.sql.Date(12, 12, 2013));
	
	Parent parent = new Parent();
	parent.setParentId(11);
	dto.setParent(parent);
	SimpleDateFormat df= new  SimpleDateFormat("dd-MM-yyyy"); 
	Date dob= df.parse("01-11-2013");
	System.out.println(dob);
	dto.setDOB(dob);	
	
	//StudentDao.insert(dto);
	Connection connection = ConnectionProvider.getConnection();
	//Student dto2= StudentDao.retriveData(50, null,connection).get(0);
//System.out.println(dto2.getFname()+"--"+dto2.getLname()+"fee--"+dto2.getFee().getTutionFee());
//update(dto, connection);
	//List<String> student=StudentDao.retriveConductData(1, connection);
	//System.out.println(student.size());
connection.commit();
System.out.println("student--->"+retriveData(21, connection).get(0).getDOB());
connection.close();
	Connection connection = ConnectionProvider.getConnection();
	System.out.println(StudentDao.insert(dto,connection));
	connection.commit();
	connection.close();
	//System.out.println(StudentDao.delete(dto.getStudentId()));


System.out.println(new java.sql.Date(dto.getDOB().getTime()));
*/
	Connection connection = ConnectionProvider.getConnection();
System.out.println(getStudentId("201311A10", connection));	
}

}
