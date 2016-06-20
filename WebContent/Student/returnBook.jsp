<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.demo.dao.StudentDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@page import="com.demo.dao.LibraryDao" %>
<%@page import="com.demo.dto.Library" %>
<%@page  import="java.lang.Exception" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.demo.dto.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Integer studentid= (Integer)session.getAttribute("studentid"); 
System.out.print("studentid--"+studentid);

int countBook=(Integer)session.getAttribute("countbook");
System.out.print("countBook--"+countBook);
List<Library> libList=new ArrayList<Library>();


for(int i=1;i<=countBook;i++){
	Library lib=new Library();
	System.out.println("bookcode-->"+request.getParameter("bookCode"+i));
	lib.setBookCode(request.getParameter("bookCode"+i));
lib.setBookName(request.getParameter("bookName"+i));
SimpleDateFormat df= new  SimpleDateFormat("dd-MM-yyyy"); 
Date issueDate= df.parse(request.getParameter("issueDate"+i));
lib.setIssueDate(issueDate);
lib.setNoOfDays(Integer.valueOf(request.getParameter("noOfDays"+i).toString()));
lib.setSubmissionStatus(Integer.valueOf(request.getParameter("submissionStatus"+i).toString()));
lib.setStudentId(studentid);
libList.add(lib);

}
System.out.println("List size-->"+libList.size());
Connection conn=ConnectionProvider.getConnection();
try{
	LibraryDao.update(libList, conn);
	System.out.println("librarydao update method-->");
conn.commit();
session.setAttribute("msg", "Submitted book successfully.");
response.sendRedirect(request.getContextPath()+"/Common/Success.jsp");
conn.close();
}
catch(Exception e){
	response.sendRedirect(request.getContextPath()+"/Common/error.jsp");
	conn.rollback();
	conn.close();
}
%>
</body>
</html>