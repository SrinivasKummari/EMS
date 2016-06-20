import java.sql.DriverManager;
import java.sql.ResultSet;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.SQLException;
import java.sql.Statement;


public class DatabaseConnection {
	public Connection conn;
	public Statement stmt;
	public ResultSet res;
	
	public DatabaseConnection(){
		
	}

	@SuppressWarnings("CallToThreadDumpStack")
	public Connection setConnection(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/schooldb","root","root");
		System.out.println("connection Established");
		}catch(Exception e){
			e.printStackTrace();
		}
	return conn;
	}
	
	public ResultSet getResultSet(String query,Connection conn){
		this.conn=conn;
		try{
			stmt=conn.createStatement();
			res=stmt.executeQuery(query);
			System.out.println("result was sent");
		}catch(Exception e){
			
		}
		return res;
	}
	public static void main(String[] args) throws SQLException {
		DatabaseConnection dbconn=new DatabaseConnection();
		Connection conn=dbconn.setConnection();
		Statement stmt=conn.createStatement();
		String str="insert into users values('rajasekhar','rajasekhar','student','rajasekhar')";
		String str1="select * from schooldb.users where user_name='srinivas' and password='Srini@34'";
		//dbconn.res =stmt.executeQuery(str);
	//System.out.println(stmt.executeQuery(str));          

	ResultSet res1=stmt.executeQuery(str1);
	if(res1.next()){
		
		System.out.println(res1.getString(1));
	System.out.println(res1.getString("user_name"));
	
	if(true){
		System.out.println("srinu is a brainless fellow");
	}
	
	
	}
	}
}
