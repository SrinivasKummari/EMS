package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.demo.dto.Users;

public class UsersDao {
	
	public static Users retrieveData(String userName,Connection conn) throws SQLException {
		
		Statement stmt=conn.createStatement();
		String query="select user_name,password,user_type from users where user_name='"+userName+"'";
		ResultSet rs=stmt.executeQuery(query);
		if(rs.next()){
			Users users=new Users();
			users.setUserName(rs.getString(1));
			users.setPassword(rs.getString(2));
			users.setUserType(rs.getString(3));
			
						
			return users;
			
		}
		return null;
	}


	
	public static boolean update(Users users,Connection conn) throws SQLException{
		System.out.println("users.getPassword() vlaue is---->"+users.getPassword());
		String query="Update users set password='"+users.getPassword()+"' where user_name='"+users.getUserName()+"' and user_type='"+users.getUserType()+"'";
		
		Statement statement=conn.createStatement();
		int i=statement.executeUpdate(query);
		
		if(i>0){
			return true;
		}else{
		
			return false;
		}
		
	}
	
	public static int insert(Users user,Connection conn) throws SQLException{
		
		String query="insert into users values(?,?,?,?)";
				
	PreparedStatement stmt= conn.prepareStatement(query);
	
	stmt.setString(1, user.getUserName());
	stmt.setString(2, user.getPassword());
	stmt.setString(3, user.getUserType());
	stmt.setInt(4, user.getId());
	
	int i=stmt.executeUpdate();
	if(i>0){
	return i;
	}
	return -1;
	}
	

	
	public static void main(String[] args) throws SQLException {
		//System.out.println(UsersDao.retrieveData("srinivas"));
		/*
		String username=UsersDao.retrieveData("srinivas").getUserName();	
		System.out.println(username);*/
		Connection conn=ConnectionProvider.getConnection();
		Users dto2= UsersDao.retrieveData("srinivas",conn);
		System.out.println(dto2.getUserName()+"--"+dto2.getPassword());
		/*Users users=new Users();
		users.setUserName("srinivas");
		users.setPassword("sri");
		users.setUserType("student");
		System.out.println(UsersDao.update(users));
		Users dto3= UsersDao.retrieveData("srinivas");
		System.out.println(dto3.getUserName()+"--"+dto3.getPassword());
		
*/		}
}
