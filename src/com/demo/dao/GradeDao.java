package com.demo.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.demo.dto.Grade;
import com.demo.dto.Parent;
import com.demo.dto.Student;

public class GradeDao {

	
	public static int insert(Grade gradeDto) throws SQLException{

		
		//String query = "insert into parent(parent_id,first_name,last_name,phone,email_id) values(?,?,?,?,?)";
			
		String query="insert into grade values(?,?,?)";	
		
		//String str="select * from student";
		PreparedStatement 	stmt = ConnectionProvider.getConnection().prepareStatement(query);
		
		
		//System.out.println(gradeDto.getFirstName()+"--"+parentDto.getLastName()+" --"+parentDto.getParentId());
		stmt.setInt(1, gradeDto.getGradeId());
		stmt.setString(2, gradeDto.getGradeName());
		stmt.setString(3, gradeDto.getDescription());
		
	
		    
			   //ResultSet rs = stmt.executeQuery(str);
			   

				//System.out.println("query" +query);
			   
		int i = stmt.executeUpdate();
				
			
		
		if(i>0){
					System.out.println("Sql statement executed successfully");
				}
			    
			   
				
				ConnectionProvider.getConnection().close();
				System.out.println("Disconnected from database");
				
				return i;
			}

public static Grade retriveData(String gid ) throws SQLException{
			

			Statement 	stmt = ConnectionProvider.getConnection().createStatement();
			
			Grade dto = new Grade();
			/******
			 * need to implement for searching with name
			 * 
			 * *****/
			if(gid!=null){
				
			String query ="	select * from Grade where grade_id='"+gid+"'";
			
			ResultSet rs = stmt.executeQuery(query);

			while(rs.next()){
				
				System.out.println("it is in result set");
				dto.setGradeId(rs.getInt(1));
				dto.setGradeName(rs.getString(2));
				dto.setDescription(rs.getString(3));
				
				
			
			}
			
			}
			
			
			
			return dto;
			
		}

		public static boolean update(Grade grade) throws SQLException{
			String query = "update grade set grade_id=?,grade_name=?,description=? ";
			
			PreparedStatement 	stmt = ConnectionProvider.getConnection().prepareStatement(query);
			
		    stmt.setInt(1, grade.getGradeId());
		    stmt.setString(2, grade.getGradeName());
		    stmt.setString(3, grade.getDescription());
			
			int i=stmt.executeUpdate();
			if(i>0){
				
				
				
				return true;
			}
			
			return false;
		}
		
		public static boolean delete(Integer gid) throws SQLException{
			
			String query="delete from grade where grade_id="+gid;
			
			Statement stmt = ConnectionProvider.getConnection().createStatement();
			
			int i =stmt.executeUpdate(query);
			if(i>0)
			return true;
		    return false;
		}
		
		public static int getMaxId() throws SQLException{
			String str="select max(grade_id) from grade";
			
			Statement statement = ConnectionProvider.getConnection().createStatement();
			ResultSet rs= statement.executeQuery(str);
			int i=0;
			if(rs.next()){
				 i= rs.getInt(1);
			}
			
			return i;
		}
	
}
