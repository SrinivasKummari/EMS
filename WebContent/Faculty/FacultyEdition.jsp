<%@page import="com.demo.dao.FacultyAddressDao"%>
<%@page import="com.demo.dao.AddressDao"%>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.demo.dao.FacultyDao"%>
<%@ page language="java"
import="java.util.*,com.demo.dto.* "
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My WebSite for Schools</title>
<link rel="stylesheet" type=text/css href="../css/login.css" href="../css/layout.css"/>
<!-- <script type="text/javascript" src="messages.js"></script> -->

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
                    <fieldset class="fieldHead">Edit Faculty Information</fieldset><br>
                    <form action="FacultyEdition.jsp" method="post">
           <label class="label" for="fname"><span>*</span>Faculty Id : </label><input type="text" class="inputLogin" name="id"><br><br>
                    <input type="submit" class="submitLogin" style="margin-left: 190px;" value="Go">
                    </form>
                   <%} %>
                    <%
                   
                    if(request.getParameter("id")!=null){
                        Connection conn =ConnectionProvider.getConnection();
                Integer i=Integer.valueOf(request.getParameter("id"));
                    List<Faculty> list = FacultyDao.retriveData(i, null,conn);
                    if(!list.isEmpty()){
                       
                Faculty ft= list.get(0);
               
                    %>
                    
                    <%session.setAttribute("faculty", ft); %>
                  
                  <fieldset class="fieldHead">Faculty Image</fieldset>
                    
                    <fieldset class="fieldList">
<label class="label" for="imgSrc">Image Path :</label><input id="imgSrc" name="imgSrc" type="text" class="inputLogin" value="<%= ft.getImgSrc()%>"></input><br>
                    <img src="../<%=ft.getImgSrc()%>" height="133" width="100" style="margin-left: 10px;border: 3px solid #395656;">
                    
                    </fieldset>
                  
                    <fieldset class="fieldList">
            <label class="label" for="fname"><span>*</span>First Name:</label><input id="fname" name="fname"  type="text" class="inputLogin" value="<%= ft.getFname() %>" required="required"></input>
             <label class="label" for="lname"><span>*</span>Last Name:</label><input id="lname" name="lname"  type="text" class="inputLogin" value="<%= ft.getLname() %>" required="required"></input>
             <label class="label"><span>*</span>Birth Date:</label><input  type="text" class="inputLogin" name="dob" value="<%= ft.getDOB() %>" ></input><br/><br/>
            <label  class="label" for="doj" ><span>*</span>Date Of Join:</label><input id="doj" name="doj"  type="text" value="<%= ft.getDOJ() %>"  class="inputLogin" ></input>
                                                               <label class="label" for="phone"><span>*</span>Phone:</label><input id="phone" name="phone"  type="text" class="inputLogin" value="<%= ft.getPhone() %>"  required="required"></input>
             <label class="label" for="email"><span>*</span>Email:</label><input id="email" name="email"  type="text" class="inputLogin" value="<%= ft.getEmail() %>" required="required"></input><br><br>
           <label class="label"><span>*</span>Gender:</label><select id="gender" class="inputs"   name="gender" >
                                                                   <option><%= ft.getGender() %></option>
                                                                   <option>Male</option>
                                                                   <option>Female</option>   
                                                                 </select>
                                                                 </fieldset>
            <fieldset class="fieldHead">Faculty Professional Information</fieldset>
            <fieldset class="fieldList">
             <label class="label" for="fname"><span>*</span>Qualification :</label><input id="qualification" name="qualification"  type="text" class="inputLogin" value="<%= ft.getQualification() %>" required="required"></input>
              <label class="label" for="fname"><span>*</span>Experience :</label><input id="experience" name="experience"  type="text" class="inputLogin" value="<%= ft.getExperience() %>" required="required"></input>
               <label class="label" for="fname"><span>*</span>Previous CTC :</label><input id="previousCTC" name="previousCTC"  type="text" class="inputLogin" value="<%= ft.getPreviousCTC() %>" required="required"></input><br><br>
                <label class="label" for="fname"><span>*</span>Current CTC :</label><input id="currentCTC" name="currentCTC"  type="text" class="inputLogin" value="<%= ft.getCurrentCTC() %>" required="required"></input>
                 <label class="label" for="fname"><span>*</span>Previous School :</label><input id="previousSchool" name="previous_school"  type="text" class="inputLogin" value="<%= ft.getPrevious_school() %>" required="required"></input>
                  <label class="label" for="fname"><span>*</span>Subject :</label><input id="subject" name="subject"  type="text" class="inputLogin" value="<%= ft.getSubject() %>" required="required"></input><br><br>
                 </fieldset>
                  
            <fieldset class="fieldHead">Address For Correspondence</fieldset>
           
                        <%FacultyAddress  facAddress = FacultyAddressDao.retriveData(i, conn);
                        
                          Address address = AddressDao.retriveData(facAddress.getAddressId(),conn);
                        %>
            <fieldset class="fieldList">
              <label  class="label"><span>*</span>House No :: </label><input  type="text" class="inputLogin" value="<%= address.getHouseNo() %>" name="hno"></input>
              <label  class="label"><span>*</span>Street :: </label><input  type="text" class="inputLogin" value=<%= address.getStreet() %> name="street"></input>
              <label  class="label"><span>*</span>Locality :: </label><input  type="text" class="inputLogin" value=<%= address.getLocality() %> name="locality"></input><br><br>
              <label  class="label"><span>*</span>city :: </label><input  type="text" class="inputLogin" name="city" value=<%= address.getCity() %> ></input>
              <label  class="label"><span>*</span>State :: </label><input  type="text" class="inputLogin" value=<%= address.getState() %> name="state"></input>
              <label  class="label"><span>*</span>Country :: </label><input  type="text" class="inputLogin" name="country" value="INDIA"></input><br/><br/>
              <label  class="label"><span>*</span>Zip Code :: </label><input  type="text" class="inputLogin" name="zip" value=<%= address.getZipCode() %>></input><br><br>
              </fieldset>
           
           <fieldset class="fieldList">
             <label  class="label"></label><input class="submitLogin" type="reset"/><input class="submitLogin" style="margin-left: 20px;" type="submit" value="Update"  />
           </fieldset>
            
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