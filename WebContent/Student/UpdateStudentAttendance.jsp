<%@page import="com.demo.dao.AttendanceDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.demo.dao.FeeDao"%>
<%@page import="com.demo.dao.AddressDao"%>
<%@page import="com.demo.dao.ParentDao"%>
<%@page import="com.demo.dao.StudentDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@ page import="com.demo.dao.ClassRoomDao" %>
<%@page  import="com.demo.dao.StudentClassDao" %>
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
<% Integer studentId= (Integer)session.getAttribute("studentId"); 
SimpleDateFormat df= new  SimpleDateFormat("dd-mm-yyyy");
Date date=df.parse(session.getAttribute("date").toString());
System.out.print("studentId--"+studentId);%>

<%
String status=request.getParameter("status");

%>
<%

Connection conn = ConnectionProvider.getConnection();
AttendanceDao.updateAttendanceByIdAndDate(studentId, date,status,conn); %>
 
</body>
</html>