<%@page import="java.sql.Connection"%>
<%@page import="com.demo.dao.AttendanceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.demo.dto.Student" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.demo.dto.Attendance"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%


System.out.println("in submitadmission");
System.out.println(session.getAttribute("students"));
List<Student> students =(List<Student>)session.getAttribute("students");
System.out.println("ids---"+session.getAttribute("students"));
Connection connection = (Connection)session.getAttribute("conn");
for(Student s:students){
    if(request.getParameter(String.valueOf(s.getStudentId()))!=null){
        Attendance attendance = new Attendance();
        System.out.println(request.getParameter(String.valueOf(s.getStudentId())));
        attendance.setToDay((Date)session.getAttribute("fromdate"));
        System.out.println(session.getAttribute("fromdate"));
        attendance.setStatus(request.getParameter(String.valueOf(s.getStudentId())));
        System.out.println("id--"+s.getStudentId());
        attendance.setStudent(s);
        attendance.setIsHoliday("N");
        attendance.setClassId((Integer)session.getAttribute("classId"));
        attendance.setDesc(request.getParameter(String.valueOf(s.getStudentId())).equals("P")?"Present":"Absent");
          
        AttendanceDao.insert(attendance,connection);
        //out.print("in attendance");
        connection.commit();
       
    }
    }
connection.close();
request.getRequestDispatcher("../Common/Success.jsp").forward(request, response);
 %>
</body>
</html> 