<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.demo.dao.StudentDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@ page import="com.demo.dao.StudentBusDao" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.demo.dto.*" %>
<<jsp:useBean id="studentBus" class="com.demo.dto.StudentBus"></jsp:useBean>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Integer studentId= (Integer)session.getAttribute("studentid"); 
System.out.print("studentid--"+studentId);
 studentBus.setStudentId(studentId);
Connection conn=ConnectionProvider.getConnection(); %>
<jsp:setProperty property="stopNo" name="studentBus"/>
<%int i=StudentBusDao.updateStudentBus(studentBus, conn);
if(i!=0){
	   session.setAttribute("msg", "The student bus stop number updated successully.");
	   response.sendRedirect(request.getContextPath()+"/Common/Success.jsp");
conn.commit();
}else{
conn.rollback();
System.out.println("no record is updated in student bus table.");
}%>
</body>
</html>