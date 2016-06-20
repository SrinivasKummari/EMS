<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@page import="com.demo.dao.LibraryDao"%>
<%@page import="com.demo.dto.Library"%>
<%@page  import="java.lang.Exception" %>
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
<%

Integer studentid= (Integer)session.getAttribute("studentid"); 
System.out.print("studentid--"+studentid);%>
<jsp:useBean id="library" class="com.demo.dto.Library" ></jsp:useBean>

<jsp:setProperty property="bookCode" name="library"/>
<jsp:setProperty property="bookName" name="library"/>
<%SimpleDateFormat df= new  SimpleDateFormat("dd-MM-yyyy"); 
		   Date issueDate= df.parse(request.getParameter("issueDate"));
		   library.setIssueDate(issueDate);%>

<jsp:setProperty property="noOfDays" name="library" />
<jsp:setProperty property="submissionStatus" name="library" />
<jsp:setProperty property="studentId" name="library" value="<%=studentid.intValue() %>"/>
 
<%
Connection conn=ConnectionProvider.getConnection();
try{
	LibraryDao.insertBook(library, conn);
System.out.println("Issued book successfully");
conn.commit();
session.setAttribute("msg", "Issued book successfully.");
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