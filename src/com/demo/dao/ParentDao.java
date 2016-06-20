package com.demo.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.demo.dto.Parent;
import com.demo.dto.Student;




public class ParentDao {
	
	/*public static int insert(Parent parent) throws SQLException{

		String query = "insert into parent set first_name='"+parent.getFirstName()+"',last_name='"+parent.getLastName()+",phone="+parent.getPhone()+",phone="+parent.getPhone();
		
		Statement statement = ConnectionProvider.getConnection().createStatement();
		
		statement.execute(query);
		return 0;
	
	}*/
	
	public static int insert(Parent parentDto,Connection conn) throws SQLException{

		
		String query = "insert into parent(parent_id,first_name,last_name,phone,email_id,relation,occupation) values(null,?,?,?,?,?,?)";
			
				//String str="select * from student";
		PreparedStatement 	stmt = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
		
		
		System.out.println(parentDto.getFirstName()+"--"+parentDto.getLastName()+" --"+parentDto.getParentId());
		//stmt.setInt(1, (Intnull);
		stmt.setString(1, parentDto.getFirstName());
		stmt.setString(2, parentDto.getLastName());
		stmt.setString(3, parentDto.getPhone());
		stmt.setString(4, parentDto.getEmail());
		stmt.setString(5, parentDto.getRelation());
		stmt.setString(6, parentDto.getOccupation());
	
		    
			   //ResultSet rs = stmt.executeQuery(str);
			   

				//System.out.println("query" +query);
			   
		int i = stmt.executeUpdate();
				
			
		
		ResultSet rs= stmt.getGeneratedKeys();
		
		
		System.out.println("i value in student insert---"+i);
	
		if(i>0){
			System.out.println("Sql statement executed successfully");
		if(rs.next()){
				System.out.println("studentId---"+rs.getInt(1));
				return rs.getInt(1);
			
			}
		
		   
				
	//			ConnectionProvider.getConnection().close();
		//		System.out.println("Disconnected from database");
		}	
				return i;
			}

public static Parent retriveData(int i,Connection conn ) throws SQLException{			
			System.out.println("parent id is-->"+i);
			Statement 	stmt = conn.createStatement();			
			Parent parent=new Parent();
			/******
			 * need to implement for searching with name
			 * 
			 * *****/
			if(i!=0){
				
			String query ="	select * from parent where parent_id='"+i+"'";
			
			ResultSet rs = stmt.executeQuery(query);

			while(rs.next()){
				
				System.out.println("it is in result set");
				parent.setParentId(rs.getInt(1));
				System.out.println(parent.getParentId());
				parent.setFirstName(rs.getString(2));
				parent.setLastName(rs.getString(3));
				parent.setPhone(rs.getString(4));
				parent.setEmail(rs.getString(5));
				parent.setStatus(rs.getString(6));
				parent.setRelation(rs.getString(7));
				parent.setOccupation(rs.getString(8));
			
			}

			}
			return parent;
	}

		public static boolean update(Parent parent,Connection conn) throws SQLException{
			String query = "update parent set  first_name=?,last_name=?,phone=?, email_id=?,relation=?,occupation=?  where parent_id=?";
			
			PreparedStatement 	stmt = conn.prepareStatement(query);
			
			stmt.setString(1, parent.getFirstName());
			stmt.setString(2, parent.getLastName());
			stmt.setString(3, parent.getPhone());
			stmt.setString(4, parent.getEmail());
			stmt.setString(5, parent.getRelation());
			stmt.setString(6, parent.getOccupation());
			stmt.setInt(7, parent.getParentId());
			
		    
			int i=stmt.executeUpdate();
			System.out.println("parent update value"+i);
			if(i>=0){
				return true;
			}
			
			return false;
		}
		
		public static boolean delete(Integer pid) throws SQLException{
			
			String query="delete from parent where parent_id="+pid;
			
			PreparedStatement stmt = ConnectionProvider.getConnection().prepareStatement(query);
			
			int i =stmt.executeUpdate();
			if(i>0)
			return true;
		    return false;
		}
		
		public static int getMaxId() throws SQLException{
			String str="select max(parent_id) from parent";
			
			Statement statement = ConnectionProvider.getConnection().createStatement();
			ResultSet rs= statement.executeQuery(str);
			int i=0;
			if(rs.next()){
				 i= rs.getInt(1);
			}
			
			return i;
		}
public static void main(String[] args) throws SQLException {
	
	Parent parent = new Parent();
	
	parent.setFirstName("rajasekhar");
	parent.setLastName("reddy");
	parent.setParentId(1);
	Connection conn= ConnectionProvider.getConnection();
ParentDao.update(parent, conn);
conn.commit();
}
}


