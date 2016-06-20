<%@page import="java.sql.ResultSet"%>
<%@page import="com.demo.dao.LibraryDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.demo.dao.StudentDao"%>
<%@page import="com.demo.dao.LibraryDao" %>
<%@ page language="java"
import="java.util.*,com.demo.dto.* "
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My WebSite for Schools</title>
<script  type="text/javascript" src="../datetimepicker.js"></script>

<link rel="stylesheet" type=text/css href="${pageContext.request.contextPath}/Css/login.css"/>


<script type="text/javascript" >
new MY.DatePicker({
    input: 'arrivalDt',
    format: 'dd-MMM-yyyy',
    initialText : '22-June-2011',
    validate: function(value, errors) {
        if (value != null && value.isAfter(new Date())) {
            errors.push('Selected date is after current');
            return false;
        }
        return true;
    }
});

</script>
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
           
                    <fieldset class="fieldHead">Edit Student Information</fieldset>
                    <form action="issueBook.jsp" method="post"><br>
                  <label class="label" for="id"><span>*</span> Student Id : </label><input type="text" class="inputLogin" name="id"><br><br>
                    <input type="submit" class="submitLogin" style="margin-left: 190px;" value="Go"><br><br>
                    </form>
                    <%} %>         
                    <%
                   
                    if(request.getParameter("id")!=null){
                        Connection conn =ConnectionProvider.getConnection();
                String rollno=request.getParameter("id");
                int i=StudentDao.getStudentId(rollno, conn);
                    Student student = StudentDao.retriveInfoForLib(i,conn);
                    if(student!=null){
                 session.setAttribute("studentid", i);
         
                 //ResultSet rs=LibraryDao.retrieveLibInfo(i, conn);
               
                
               
                    %>	
                    
                    <%session.setAttribute("student", student); %>
                    
                    <fieldset class="fieldHead">Student Personal Information</fieldset>
           
                    
                  
                    <img src="../<%=student.getImgSrc()%>" height="133" width="100" style="margin-left: 10px;border: 3px solid #395656;"><br>
                  <b><label class="label" style="position: absolute;top:50px;left:130px;">Student Name</label><label style="position: absolute;top:50px;left:230px; "> <%= ':'+student.getFname() +' '+student.getLname()%></label></b>
                             <b><label class="label" style="position: absolute;top:90px;left:130px;">Student Id</label><label style="position: absolute;top:90px;left:230px; "> <%= ':'+student.getRollNo()%></label></b>
               
               <fieldset class="fieldHead"><b>Issued books information</b></fieldset><br>
		<% ResultSet rs=LibraryDao.retrieveLibInfo(i, conn);
		if(rs==null){%><label class="label">No books issued</label> <%}else{ %>
		<label class="label">Book Code</label>
		<label class="label">Book Name</label>
		<label class="label">Issued Date</label>
		<label class="label">No of Days</label>
		 <label class="label">Submission Status</label><br><br>
		
		<% while(rs.next()){ %>
		<label class="label"><%=rs.getString(1) %></label>
		<label class="label"><%=rs.getString(2) %></label>
		<label class="label"><%=rs.getDate(3) %></label>
		<label class="label"><%=rs.getInt(4) %></label>
		<label class="label"><%=rs.getInt(5) %></label><br>
		<%} }%>
		
               
        					<fieldset class="fieldHead">Issue Book</fieldset>
					<form action="addBook.jsp">
		<fieldset class="fieldList">

          	<label class="label" for="bookCode"><span>*</span>Book Code :</label><input id="bookCode" name="bookCode"  type="text" class="inputLogin" required="required"></input>
			 <label class="label" for="bookName"><span>*</span>Book Name :</label><input id="bookName" name="bookName"  type="text" class="inputLogin" required="required"></input>
			 <label class="label"><span>*</span>Issue Date :</label><input id="issueDate"  type="text" class="inputLogin" name="issueDate"></input>
			 <a href="javascript:NewCal('issueDate','ddmmyyyy')"><img src="../Images/calen.png" style=" width: 20px; height: 20px ;float: right; "  alt="Pick a date"></a><br/><br/>
			 <label class="label" for="noOfDays"><span>*</span>No of Days :</label><input id="noOfDays" name="noOfDays"  type="text" class="inputLogin" required="required"></input>
		<label class="label"><span>*</span>Submission Status :</label><select id="submissionStatus" class="inputs" name="submissionStatus">
                                                                   <option>---Select---</option>
                                                                   <option>0</option>
                                                                   <option>1</option>
                                                               </select>
            
		</fieldset>
              <fieldset class="fieldList">
             <label  class="label"></label><input class="submitLogin" type="reset"/><input class="submitLogin" style="margin-left: 20px;" type="submit" value="Submit"  />
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