
<%@page import="com.demo.dao.ResultsDao"%>
<%@page import="com.demo.dto.Results"%>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="com.demo.dao.ExamDao"%>
<%@page import="com.demo.dto.Exam"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Integer studentId=2; //(Integer)request.getAttribute("stdId");
Integer classId=1; //(Integer)request.getAttribute("classId");
Connection conn = ConnectionProvider.getConnection();
List<Exam> exams = ExamDao.retrieveExamsOfClass(classId, conn);

for(Exam exam: exams){
%>  

 <a><%=exam.getDesc() %></a> <br/>
 <table>
 <tr style="border:5px; border-color:red ;"><td>Subject</td>
 <td>Max Marks</td>
 <td>Marks Secured</td> </tr>
 
 <% ResultSet rs= ResultsDao.retriveDataByStudentExamId(studentId, exam.getExamId(), conn); 
 while(rs.next()){
//	 out.print("in resultset");
	%>
	<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getInt(2) %></td>
     <td><%=rs.getInt(3) %></td>
	
	
	 </tr>
	 <%
 }
 %>
 </table>
 <% } %>


     
<%conn.close(); %>


</body>
</html>


