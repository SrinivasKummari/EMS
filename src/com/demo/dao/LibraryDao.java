package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.demo.dto.Library;

public class LibraryDao {

	public static int update(List<Library> library,Connection conn) throws SQLException{
		int i=0;
		for(Library lib:library){
		String query="update library set submission_status=? where student_id='"+lib.getStudentId()+"'  and book_code='"+lib.getBookCode()+"'";
		PreparedStatement stmt=conn.prepareStatement(query);
		
		System.out.println("query is: "+query);
		/*stmt.setInt(1, lib.getStudentId());
		stmt.setString(2, lib.getBookCode());
		stmt.setString(3, lib.getBookName());
		stmt.setDate(4, new java.sql.Date(lib.getIssueDate().getTime()));
		stmt.setInt(5, lib.getNoOfDays());*/
		stmt.setInt(1, lib.getSubmissionStatus());
		stmt.executeUpdate();
		conn.commit();
		i++;
		}
		return i;
	}
	
	
	
	public static ResultSet retrieveLibInfo(int i,Connection conn) throws SQLException{
		/*List<Library> libraries =new ArrayList<Library>();
		Library library=new Library();
		*/String query="select book_code,book_name,issue_date,no_of_days,submission_status from library where student_id='"+i+"' and submission_status='0'";
		PreparedStatement stmt=conn.prepareStatement(query);
		ResultSet rs=stmt.executeQuery();
		
		/*if(rs!=null){
			while(rs.next()){
				library.setBookCode(rs.getString(1));
				library.setBookName(rs.getString(2));
				library.setIssueDate(rs.getDate(3)==null?null:new java.util.Date(rs.getDate(7).getTime()));
				library.setNoOfDays(rs.getInt(4));
				library.setSubmissionStatus(rs.getInt(5));
				
				libraries.add(library);
			}
		}else{
			System.out.println("No recards found for this student");
		}*/
		return rs;
	}
	
	public static int insertBook(Library library,Connection conn) throws SQLException{
		System.out.println("Entered into the isert book method");
		String query="insert into library(student_id,book_code,book_name,issue_date,no_of_days,submission_status) values(?,?,?,?,?,?) ";
		PreparedStatement stmt=conn.prepareStatement(query);

		
		stmt.setInt(1,library.getStudentId());
		stmt.setString(2,library.getBookCode());
		stmt.setString(3, library.getBookName());
		stmt.setDate(4,new java.sql.Date(library.getIssueDate().getTime()));
		stmt.setInt(5, library.getNoOfDays());
		stmt.setInt(6, library.getSubmissionStatus());

		int i=stmt.executeUpdate();
		return i;
	}
	public static void main(String[] args) throws SQLException {
		Library lib=new Library();
		lib.setStudentId(152);
		lib.setBookCode("A1358");
		lib.setBookName("fjldksjf");
		lib.setIssueDate(new java.util.Date());
		lib.setNoOfDays(30);
		lib.setSubmissionStatus(0);
		Connection conn=ConnectionProvider.getConnection();
		Library lib1=new Library();
		lib1.setStudentId(152);
		lib1.setBookCode("A1359");
		lib1.setBookName("fjldksjf");
		lib1.setIssueDate(new java.util.Date());
		lib1.setNoOfDays(30);
		lib1.setSubmissionStatus(0);
		List<Library> liblist=new ArrayList<Library>();
		liblist.add(lib);
		liblist.add(lib1);
		System.out.println(LibraryDao.update(liblist, conn));
	}
}
