<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.demo.dao.FeeDao" %>
<%@page import="com.demo.dao.StudentAddressDao"%>
<%@page import="com.demo.dao.AddressDao"%>
<%@page import="com.demo.dao.ClassRoomDao"%>
<%@page import="com.demo.dao.StudentClassDao"%>
<%@page import="com.demo.dao.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.demo.dao.ParentDao"%>
<%@page import="com.demo.dao.StudentDao"%>
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
                    <form action="EditInfo.jsp" method="post"><br>
                  <label class="label" for="id"><span>*</span> Student Id : </label><input type="text" class="inputLogin" name="id"><br><br>
                    <input type="submit" class="submitLogin" style="margin-left: 190px;" value="Go"><br><br>
                    </form>
                    <%} %>         
                    <%
                   
                    if(request.getParameter("id")!=null){
                        Connection conn =ConnectionProvider.getConnection();
                String rollno=request.getParameter("id");
                int i=StudentDao.getStudentId(rollno, conn);
                    List<Student> list = StudentDao.retriveData(i,conn);
                    if(!list.isEmpty()){
                 session.setAttribute("studentid", i);      
                Student st= list.get(0);
                
               
                    %>	
                    
                    <%session.setAttribute("student", st); %>
                    
                    <fieldset class="fieldHead">Student Personal Information</fieldset>
                    
                    <form action="update.jsp">
                    <fieldset class="fieldList">

                    <img src="../<%=st.getImgSrc()%>" height="133" width="100" style="margin-left: 10px;border: 3px solid white; border-radius:10px;">
      <label class="label" for="fname" style="position: absolute;top:50px;left:130px;"><span>*</span>First Name : </label><input id="fname" name="fname" style="position: absolute;top:50px;left:230px; " type="text" class="inputLogin" value="<%= st.getFname() %>" required="required"></input>
           <label class="label" for="lname"style="position: absolute;top:50px;left:400px;"><span>*</span>Last Name : </label><input id="lname" name="lname" style="position: absolute;top:50px;left:500px;" type="text" class="inputLogin" value="<%= st.getLname() %>" required="required"></input>
             <label  class="label" for="dob" style="position: absolute;top:50px;left:670px;" ><span>*</span>Date Of Birth : </label><input id="dob" name="DOB" style="position: absolute;top:50px;left:790px;"  type="text" value="<%= new SimpleDateFormat("dd-MM-yyyy").format(st.getDOB()) %>"  class="inputLogin" ></input>
        <a href="javascript:NewCal('dob','ddmmyyyy')"><img src="../Images/calen.png" style="position: absolute;top:50px;left:970px; width: 20px; height: 20px ;float: right; "  alt="Pick a date"></a>                  
      <label class="label" for="phone"style="position: absolute;top:90px;left:130px;"><span>*</span>Phone : </label><input id="phone" name="phone" style="position: absolute;top:90px;left:230px; " type="text" class="inputLogin" value="<%= st.getPhone() %>"  required="required"></input>
     <label class="label" for="email" style="position: absolute;top:90px;left:400px;"><span>*</span>Email : </label><input id="email" name="email" style="position: absolute;top:90px;left:500px;" type="text" class="inputLogin" value="<%= st.getEmail() %>" required="required"></input>
    <label  class="label" for="doj" style="position: absolute;top:90px;left:670px;" ><span>*</span>Date Of Join : </label><input id="doj" name="DOJ" style="position: absolute;top:90px;left:790px;" type="text" value="<%= new SimpleDateFormat("dd-MM-yyyy").format(st.getDOJ()) %>"  class="inputLogin" ></input>
        <a href="javascript:NewCal('doj','ddmmyyyy')"><img src="../Images/calen.png" style="position: absolute;top:90px;left:970px; width: 20px; height: 20px ;float: right; "  alt="Pick a date"></a>
     <label class="label" style="position: absolute;top:130px;left:130px;"><span>*</span>Caste : </label><select id="classList" class="inputs"  name="caste" style="position: absolute;top:130px;left:230px; ">
                                                                   <option><%=st.getCaste() %></option>
                                                                   <option>General</option>
                                                                   <option>OBC</option>
                                                                   <option>SC</option>
                                                                   <option>ST</option>
                                                               </select>
            <label class="label" style="position: absolute;top:130px;left:400px;"><span>*</span>Gender : </label><select id="gender" class="inputs"  name="gender" style="position: absolute;top:130px;left:500px;" >
                                                                   <option><%= st.getGender() %></option>
                                                                   <option>Male</option>
                                                                   <option>Female</option>   
                                                                   </select>    
      
           
            <label  class="label"  style="position: absolute;top:130px;left:670px;"><span>*</span>Religion : </label><select id="classList" class="inputs" name="religion" style="position: absolute;top:130px;left:790px;">
                                                                   <option><%= st.getReligion() %></option>
                                                                   <option>Christian</option>
                                                                   <option>Muslim</option>
                                                                   <option>Hindu</option>
                                                               </select>   
     <label class="label" for="imgSrc" style="position: absolute;top:170px;left:130px;"><span>*</span>Image Path :</label><input id="imgSrc" name="imgSrc" style="position: absolute;top:170px;left:230px;" type="text" class="inputLogin" value="<%= st.getImgSrc()%>" required="required"></input>
          <label class="label" for="studentid" style="position: absolute;top:170px;left:400px;"><span>*</span>Student id :</label><input id="rollNo" name="rollNo" style="position: absolute;top:170px;left:500px;" type="text"  class="inputLogin" value="<%= st.getRollNo()%>" required="required"></input>
                   
            </fieldset>
            <% Parent pt= ParentDao.retriveData(st.getParent().getParentId(),conn); 
            session.setAttribute("parentid", conn);
            %>
            <fieldset class="fieldHead">Parent/Guardian Information</fieldset>   
                
                <fieldset class="fieldList">
                
              <label class="label" for="fathername"><span>*</span>First Name : </label><input id="fatherfname"  type="text" value="<%= pt.getFirstName() %>" class="inputLogin" name="firstname"></input>
              <label class="label"><span>*</span>Last Name : </label><input  class="inputLogin" name="lastname" value="<%= pt.getLastName() %>" ></input>
              <label class="label"><span>*</span>Occupation : </label><input  type="text" class="inputLogin" name="occupation" value="<%= pt.getOccupation() %>"></input><br/><br/>
              <label class="label" for="phone"><span>*</span>Phone : </label><input id="pphone" name="pphone"  type="text" class="inputLogin" value="<%= pt.getPhone() %>" required="required"></input>
             <label class="label" for="email"><span>*</span>Email : </label><input id="pemail" name="pemail"  type="text" class="inputLogin" value="<%= pt.getEmail() %>" required="required"></input>       
             <label class="label" for="email"><span>*</span>Relationship : </label><input id="email" name="relation"  type="text" class="inputLogin" value="<%= pt.getRelation() %>" required="required"></input><br><br>
             </fieldset>
            <fieldset class="fieldHead">Class Details</fieldset>
            <% StudentClass class1 = StudentClassDao.retrieveData(i, conn);
             ClassRoom room = ClassRoomDao.retriveData(class1.getClassroom().getId(),conn);
            %>
           
              <fieldset class="fieldList">
              
            <label  class="label"><span>*</span>Class : </label><select id="classname" class="inputs"  name="classname">
                                                                     <option><%=room.getGradeId()==1?"First":room.getGradeId()==2?"Second":room.getGradeId()==3?"Third":room.getGradeId()==4?"Fourth":room.getGradeId()==5?"Fifth":room.getGradeId()==6?"Sixth":room.getGradeId()==7?"Seventh":room.getGradeId()==8?"Eighth":room.getGradeId()==9?"Ninth":room.getGradeId()==10?"Tenth":room.getGradeId()==11?"LKG":room.getGradeId()==12?"UKG":room.getGradeId()==13?"Nursery":"" %></option>
                                                                     <option>Nursery</option>
                                                                     <option>LKG</option>
                                                                     <option>UKG</option>
                                                                     <option>First</option>
                                                                     <option>Second</option>
                                                                     <option>Third</option>
                                                                     <option>Fourth</option>
                                                                     <option>Fifth</option>
                                                                     <option>Sixth</option>
                                                                     <option>Seventh</option>
                                                                     <option>Eighth</option>
                                                                     <option>Ninth</option>
                                                                     <option>Tenth</option>
                                                                     </select>
            <label  class="label"><span>*</span>Section : </label><select id="sectionList" class="inputs"  name="section">
                                                                <option><%= room.getSection() %></option>
                                                                <option>A</option>
                                                                <option>B</option>
                                                                <option>C</option>
                                                                <option>D</option>
                                                              </select>
            <label  class="label"><span>*</span>Medium : </label><select id="sectionList" class="inputs" name="medium">
                                                                <option><%= st.getMedium() %></option>
                                                                <option>Telugu</option>
                                                                <option>English</option>
                                                              </select><br><br>
            <label  class="label"><span>*</span>Second Lang : </label><select id="sectionList" class="inputs"  name="secondLang">
                                                                <option><%=st.getSecondLang() %></option>
                                                                <option>Hindi</option>
                                                                <option>Sanskrit</option>
                                                                <option>Telugu</option>
                                                                <option>Urdu</option>
                                                              </select><br/><br/>
            </fieldset>
     			
				<fieldset class="fieldHead">Fee Information</fieldset>	
			  
			  <fieldset class="fieldList">
			  
			    <% Fee fee=FeeDao.retriveData(st.getFee().getFeeId(), conn); %>
			  <label class="label" ><span>*</span>Registration Fee :</label><input id="regFee"  type="text" class="inputLogin" name="regFee" value="<%=fee.getRegFee() %>" ></input>
			  <label class="label"><span>*</span>Fee Paid :</label><input  type="text" class="inputLogin" name="feePaid" value="<%=fee.getFeePaid() %>"></input>
              <label style="display: inline-block;"><span>*</span>Tuition Fee :</label><input  type="text" class="inputLogin" name="tutionFee" value="<%=fee.getTutionFee()%>"></input><br/><br/>
              <label class="label" for="phone"><span>*</span>Miscellaneous Fee :</label><input id="phone" name="misFee"  type="text" class="inputLogin" required="required" value="<%=fee.getMisFee()%>"></input>
			 <label class="label" for="email"><span>*</span>Total Fee :</label><input id="email" name="totalFee" type="text" class="inputLogin" required="required" value="<%=fee.getTotalFee() %>"></input>	
		             <%session.setAttribute("feeid", fee.getFeeId()); %>
              			</fieldset>
			
            
            
            <fieldset class="fieldHead">Mailing Address</fieldset>
           
                        <%StudentAddress  saddress = StudentAddressDao.retriveData(i, conn);
                        /*  Address address = AddressDao.retriveData(saddress.getAddress().getAddressId(),conn);*/ 
                        session.setAttribute("addressid",saddress.getAddress().getAddressId() );
                        %>
            <fieldset class="fieldList">
            
              <label  class="label"><span>*</span>House No :: </label><input  class="inputLogin" value="<%= saddress.getAddress().getHouseNo() %>" name="houseNo"></input>
              <label  class="label"><span>*</span>Street :: </label><input type="text" class="inputLogin" value=<%= saddress.getAddress().getStreet() %> name="street"></input>
              <label  class="label"><span>*</span>Locality :: </label><input  type="text" class="inputLogin" value=<%= saddress.getAddress().getLocality() %> name="locality"></input><br/><br/>
              <label  class="label"><span>*</span>city :: </label><input  type="text" class="inputLogin" name="city" value=<%= saddress.getAddress().getCity() %> ></input>           
              <label  class="label"><span>*</span>State :: </label><input  type="text" class="inputLogin" value=<%= saddress.getAddress().getState() %> name="state"></input>
              <label  class="label"><span>*</span>Country :: </label><input  type="text" class="inputLogin" name="country" value="INDIA"></input><br/><br/>
              <label  class="label"><span>*</span>Zip Code :: </label><input  type="text" class="inputLogin" name="zipCode" value=<%= saddress.getAddress().getZipCode() %>></input>
              </fieldset>
           
            <fieldset class="fieldList">
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