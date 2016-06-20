package com.demo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	
	public static Connection getConnection() throws SQLException{
		
		 String url = "jdbc:mysql://localhost:3306/schooldb";
		 String dbName = "schooldb";
		 String driver = "com.mysql.jdbc.Driver";
		 String userName = "root"; 
		 String password = "root";
		 
		 Connection conn = null;
		 try {
				
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url,userName,password);
				System.out.println("Connected to the database");
			}	 catch (Exception e) {
						e.printStackTrace();
						return null;
						}
		 conn.setAutoCommit(false);
		return conn;
		
	}

	
public static void main(String[] args) throws SQLException {
	System.out.println(ConnectionProvider.getConnection()==null?false:true);
}
}
