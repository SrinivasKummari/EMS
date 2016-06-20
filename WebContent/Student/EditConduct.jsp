<%@page import="com.demo.dao.ClassRoomDao"%>
<%@page import="com.demo.dao.StudentClassDao"%>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.demo.dao.StudentDao"%>
<%@ page language="java"
import="java.util.*,com.demo.dto.* "
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My WebSite for Schools</title>
<script  type="text/javascript" src="../datetimepicker.js"></script>

<link rel="stylesheet" type=text/css href="${pageContext.request.contextPath}/Css/login.css"/>
</head>
<body >
     <!-- container div starting-->

<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="../Common/common_finale.jsp"></jsp:include>
<%} %>

        <!-- content div starting-->
   
   
    <div id="content"  class="content" >
                       <%
                   
                    if(request.getParameter("id")==null){%>
           
                    <fieldset class="fieldHead"><b>Edit student conduct information</b></fieldset>
                    <form action="EditConduct.jsp" method="post"><br>
                    <label class="label" for="fname"><span>*</span> Student Id : </label> <input type="text" class="inputLogin" name="id"><br><br>
                    <input type="submit" class="submitLogin" style="margin-left: 190px;" value="Go">
                    </form>
                   <%} %>
                    <%
                   
                    if(request.getParameter("id")!=null){
                        Connection conn =ConnectionProvider.getConnection();
                
                String rollno=request.getParameter("id");
                int i=StudentDao.getStudentId(rollno, conn);
                   
                    Student student = StudentDao.retriveConductData(i,conn);
                    if(student!=null){
                 session.setAttribute("studentid", i);      
              
                
               
                    %>
                    
                    <%session.setAttribute("student", student); %>
                    
                    <form action="UpdateConduct.jsp">
                    <fieldset class="fieldHead"><b>Update student conduct information</b></fieldset>
           <fieldset class="fieldList">
            <label class="label" for="fname"><span>*</span>First Name : </label><input id="fname" name="fname"  type="text" class="inputLogin" value="<%= student.getFname() %>" required="required"></input>
             <label class="label" for="lname"><span>*</span>Last Name : </label><input id="lname" name="lname"  type="text" class="inputLogin" value="<%= student.getLname() %>" required="required"></input>
        	<label class="label" for="rating"><span>*</span>Rating : </label><input id="rating" name="rating"  type="text" class="inputLogin" value="<%= student.getRating() %>" required="required"></input><br><br>
             <label class="label" for="ratingDescription"><span>*</span>rating Description : </label><input id="ratingDescription" name="ratingDescription"  type="text" class="inputLogin" value="<%= student.getRatingDescription() %>" required="required"></input>
             </fieldset>
              <fieldset  id="fieldList">
             <label  class="label"></label><input class="submitLogin" type="reset"/><input class="submitLogin" style="margin-left: 20px;" type="submit" value="Update"  />
               </fieldset>
          
          </form>
            <%}else{ %>
                No Such Student
                <%
               
                }
                   
                    }
            else{%>
            Please enter a value
            <%} %>
        </div>
       
        </div>
</body>
</html>