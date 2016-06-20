<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<% Integer studentid= (Integer)session.getAttribute("studentid"); 
System.out.print("studentid--"+studentid);%>
<jsp:useBean id="student" class="com.demo.dto.Student" ></jsp:useBean>

<jsp:setProperty property="fname" name="student"/>
<jsp:setProperty property="lname" name="student"/>
<jsp:setProperty property="rating" name="student"/>
<jsp:setProperty property="ratingDescription" name="student"/>
<jsp:setProperty property="studentId" name="student" value="<%=studentid.intValue() %>" />


<% Connection conn=ConnectionProvider.getConnection(); %>

<% Boolean b=StudentDao.updateConduct(student, conn);
conn.commit();
%>
</body>
</html>