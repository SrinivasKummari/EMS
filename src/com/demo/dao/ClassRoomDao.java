package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.demo.dto.Address;
import com.demo.dto.ClassRoom;

public class ClassRoomDao {

	
	
	public static int insert(ClassRoom classRoom,Connection conn) throws SQLException{

		
		String query = "insert into Classroom(Classroom_id,year,grade_id,section,status) values(?,?,?,?,?)";
			
				//String str="select * from student";
		
		
		PreparedStatement 	stmt = conn.prepareStatement(query);
		
		stmt.setInt(1, classRoom.getId());
		stmt.setString(2, null);
		stmt.setInt(3, classRoom.getGradeId());
		stmt.setString(4, classRoom.getSection());
		stmt.setString(5, classRoom.getStatus());
		//stmt.setInt(6, classRoom.getAssignedFaculty());
	    
		    
			   //ResultSet rs = stmt.executeQuery(str);
			   

				//System.out.println("query" +query);
			   
				int i = stmt.executeUpdate();
				
			
				if(i>0){
					
					System.out.println("Sql statement executed successfully");
				}
			    
				
			   stmt.close();
				
				
				System.out.println("Disconnected from database");
				
				return i;
			}

public static ClassRoom retriveData(Integer classId,Connection conn) throws SQLException{
			

			Statement 	stmt =conn.createStatement();
			ClassRoom classRoom = new ClassRoom();
		
			if(classId!=null){
				
			String query ="	select * from classroom where classroom_id='"+classId+"'";
			
			ResultSet rs = stmt.executeQuery(query);

			while(rs.next()){
				
				System.out.println("it is in result set");
				classRoom.setId(rs.getInt(1));
				//classRoom.setYear(rs.getString(2));
				classRoom.setGradeId(rs.getInt(3));
				classRoom.setSection(rs.getString(4));
				classRoom.setStatus(rs.getString(5));
				classRoom.setAssignedFaculty(rs.getInt(6));
				
			
				
				
			}
	
			}
			
			
			
			return classRoom;
			
		}


public static ClassRoom retriveDataByClass(Integer gradeId,String section,Connection connection) throws SQLException{
    

    Statement     stmt = connection.createStatement();
    ClassRoom classRoom = new ClassRoom();

    if(gradeId!=null){
       
    String query ="select * from classroom where grade_id='"+gradeId+"' and section='"+section+"'";
   System.out.println("query--"+query);
    ResultSet rs = stmt.executeQuery(query);

    while(rs.next()){
       
        System.out.println("it is in result set");
        classRoom.setId(rs.getInt(1));
        //classRoom.setYear(rs.getString(2));
        classRoom.setGradeId(rs.getInt(3));
        classRoom.setSection(rs.getString(4));
        classRoom.setStatus(rs.getString(5));
        classRoom.setAssignedFaculty(rs.getInt(6));
       
   
       
       
    }

    }
   
    stmt.close();
   
    return classRoom;
   
}

		public static boolean update(ClassRoom classRoom) throws SQLException{
			String query = "update grade set grade_id=?, year=?,section=?,status=? teacher_id=? where grade_id=? ";
			
			Connection conn= ConnectionProvider.getConnection(); 
			
			
			PreparedStatement stmt = conn.prepareStatement(query);
			
			stmt.setInt(1, classRoom.getGradeId());
			stmt.setDate(2,null);
			stmt.setString(3, classRoom.getSection());
			stmt.setString(4,classRoom.getStatus());
			stmt.setInt(5, classRoom.getAssignedFaculty());
			stmt.setInt(6, classRoom.getGradeId());
		    
		    
			int i=stmt.executeUpdate(query);
			if(i>0){
				return true;
			}
			
			return false;
		}
		
		public static boolean delete(Integer gid) throws SQLException{
			
			String query="delete from classroom where classroom_id="+gid;
			
			Statement stmt = ConnectionProvider.getConnection().createStatement();
			
			int i =stmt.executeUpdate(query);
			if(i>0)
			return true;
		    return false;
		}
		public static int getMaxId() throws SQLException{
			String str="select max(classroom_id) from classroom";
			
			Statement statement = ConnectionProvider.getConnection().createStatement();
			ResultSet rs= statement.executeQuery(str);
			int i=0;
			if(rs.next()){
				 i= rs.getInt(1);
			}
			
			return i;
		}
		
		public static void main(String[] args) throws SQLException {
			Connection conn=ConnectionProvider.getConnection();
			System.out.println(ClassRoomDao.retriveData(5, conn).getGradeId());
		}
}
