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
<% Integer studentid= (Integer)session.getAttribute("studentid"); 
System.out.print("studentid--"+studentid);%>
<jsp:useBean id="student" class="com.demo.dto.Student" ></jsp:useBean>

<jsp:setProperty property="fname" name="student"/>
<jsp:setProperty property="lname" name="student"/>
<%SimpleDateFormat df= new  SimpleDateFormat("dd-MM-yyyy"); 
		   Date dob= df.parse(request.getParameter("DOB"));
		   Date doj=df.parse(request.getParameter("DOJ"));%>
		   <%System.out.println("dob----"+dob); %>${dob }
<%-- <jsp:setProperty property="DOB" name="student" value="${dob }"/>
		   
<jsp:setProperty property="DOJ" name="student" value="${ doj}"/> --%>
<% student.setDOB(dob);
student.setDOJ(doj);%>
<jsp:setProperty property="phone" name="student" />
<jsp:setProperty property="email" name="student" />
<jsp:setProperty property="caste" name="student" />
<jsp:setProperty property="gender" name="student" />
<jsp:setProperty property="religion" name="student" />
<jsp:setProperty property="medium" name="student" />
<jsp:setProperty property="secondLang" name="student" />
<jsp:setProperty property="caste" name="student" />
<jsp:setProperty property="imgSrc" name="student" />
<jsp:setProperty property="rollNo" name="student"/>

<jsp:setProperty property="studentId" name="student" value="<%=studentid.intValue() %>" />
<%
String pfirstname=request.getParameter("firstname");
String plastname = request.getParameter("lastname");
String pphone = request.getParameter("pphone");
String pemail = request.getParameter("pemail");
String occupation=request.getParameter("occupation");
String relation=request.getParameter("relation");


Student tempStudent = (Student)session.getAttribute("student");
System.out.print("parent_id--"+tempStudent.getParent().getParentId());
Parent parent = new Parent();
parent.setParentId(tempStudent.getParent().getParentId());
parent.setEmail(pemail);
parent.setFirstName(pfirstname);
parent.setLastName(plastname);
parent.setOccupation(occupation);
parent.setRelation(relation);
parent.setPhone(pphone);

%>
<%-- <jsp:useBean id="parent" class ="com.demo.dto.Parent"></jsp:useBean>

<jsp:setProperty property="firstName" name="parent" value="${pfirstname}" />
<jsp:setProperty property="lastName" name="parent" value="${plastname }"/>
<jsp:setProperty property="phone" name="parent" value="${pphone }"/>
<jsp:setProperty property="email" name="parent" value="${pemail }"/>
<jsp:setProperty property="occupation" name="parent" value="${occupation }"/>
<jsp:setProperty property="relation" name="parent" value="${relation }"/>
<% Integer parentId = (Integer)session.getAttribute("parnetid"); %>
<jsp:setProperty property="parentId" name="parent" value="${parentId }"/>
<jsp:setProperty property="parent" name="student" value="${parent }"/>
 --%>

<%

StudentClass class1 = new StudentClass();

String classname=request.getParameter("classname");
String section = request.getParameter("section");

class1.setStudent(student);
Integer i=0;
if(classname.equals("Nursery")){
	 i=13;
}else if(classname.equals("UKG")){
	 i=12;
}
else if(classname.equals("LKG")){
	 i=11;
}
else if(classname.equals("Tenth")){
	 i=10;
}else if(classname.equals("Ninth")){
	 i=9;
}else if(classname.equals("Eighth")){
	 i=8;
}else if(classname.equals("Seventh")){
	 i=7;
}else if(classname.equals("Sixth")){
	 i=6;
}else if(classname.equals("Fifth")){
	 i=5;
}else if(classname.equals("Fourth")){
	 i=4;
}else if(classname.equals("Third")){
	 i=3;
}else if(classname.equals("Second")){
	 i=2;
}else if(classname.equals("First")){
	 i=1;
}
Connection conn = ConnectionProvider.getConnection();
try{
ClassRoom classRoom = ClassRoomDao.retriveDataByClass(i, section,conn);
System.out.println("id----------"+classRoom.getId()+"clgradeid-----"+classRoom.getGradeId()+"  "+classRoom.getSection());
  class1.setClassroom(classRoom);
  
  StudentClassDao.update(class1, conn); %>
  <jsp:useBean id="address" class="com.demo.dto.Address"></jsp:useBean>
  <jsp:setProperty property="houseNo" name="address"/>
  <jsp:setProperty property="street" name="address"/>
  <jsp:setProperty property="state" name="address"/>
 <jsp:setProperty property="locality" name="address"/>
 <jsp:setProperty property="city" name="address"/>
 <jsp:setProperty property="country" name="address"/>
 <jsp:setProperty property="zipCode" name="address"/>
 <% Integer addressId=(Integer)session.getAttribute("addressid"); %>
 <jsp:setProperty property="addressId" name="address" value="${addressid }" />
 
 <jsp:useBean id="fee" class="com.demo.dto.Fee"></jsp:useBean>
 <jsp:setProperty property="regFee" name="fee"/>
 <jsp:setProperty property="feePaid" name="fee"/>
 <jsp:setProperty property="totalFee" name="fee"/>
 <jsp:setProperty property="tutionFee" name="fee"/>
 <jsp:setProperty property="misFee" name="fee"/>
<%Integer feeid=(Integer)session.getAttribute("feeid"); %> 
 <jsp:setProperty property="feeId" name="fee" value="${feeid }"/>
 
<%
System.out.println("parent.lastname-- "+parent.getLastName());
System.out.println("fee update"+FeeDao.update(fee, conn));
System.out.println("add update"+AddressDao.update(address, conn));
System.out.println("parent update"+ParentDao.update(parent, conn));
System.out.println("student update"+StudentDao.update(student, conn));
conn.commit();
session.setAttribute("msg", "Student Information updated successfully.");
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