<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My WebSite for Schools</title>
<script  type="text/javascript" src="../datetimepicker.js"></script>
<link rel="stylesheet" type=text/css href="${pageContext.request.contextPath}/Css/login.css"/>

<!-- <script type="text/javascript" src="messages.js"></script> -->
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
<body style="background-image: url('../Images/schools7.jpg');">
 	<!-- container div starting-->

<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="${pageContext.request.contextPath}/../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="${pageContext.request.contextPath}/../Common/common_finale.jsp"></jsp:include>
<%} %>

		<!-- content div starting-->
	
	<div id="content"  class="content" >
			
					<fieldset class="fieldHead">Student Information</fieldset>
					<form action="../SubmitAdmission" id="form" name="form"   method="post">
<fieldset class="fieldList">

			<label class="label" for="fname"><span>*</span>First Name :</label><input id="fname" name="fname"  type="text" class="inputLogin" required="required"></input>
			 <label class="label" for="lname"><span>*</span>Last Name :</label><input id="lname" name="lname"  type="text" class="inputLogin" required="required"></input>
			 <label class="label"><span>*</span>Date Of Birth  :</label><input id="dob"  type="text" class="inputLogin" name="dob"></input>
			 <a href="javascript:NewCal('dob','ddmmyyyy')"><img src="../Images/calen.png" style=" width: 20px; height: 20px ;float: right; "  alt="Pick a date"></a><br/><br/>
			 <label class="label" for="phone"><span>*</span>Phone :</label><input id="phone" name="phone"  type="text" class="inputLogin" required="required"></input>
			 <label class="label" for="email"><span>*</span>Email :</label><input id="email" name="email"  type="text" class="inputLogin" required="required"></input>
			 <label  class="label" for="doj" ><span>*</span>Date Of Join :</label><input id="doj" name="doj"  type="text" class="inputLogin" ></input>
			 <a href="javascript:NewCal('doj','ddmmyyyy')"><img src="../Images/calen.png" style=" width: 20px; height: 20px ; margin-left: 2px;float: right; "  alt="Pick a date"></a><br><br>
			 <label class="label"><span>*</span>Caste :</label><select id="classList" class="inputs" name="cast">
                                                                   <option>---Select---</option>
                                                                   <option>General</option>
                                                                   <option>OBC</option>
                                                                   <option>SC</option>
                                                                   <option>ST</option>
                                                               </select>
            
			<label class="label"><span>*</span>Gender :</label><select id="gender" class="inputs"   name="gender" >
                                                                   <option>---Select---</option>
                                                                   <option>Male</option>
                                                                   <option>Female</option>	
                                                                   </select>
               <label  class="label"><span>*</span>Religion :</label><select id="classList" class="inputs"  name="religion">
                                                                   <option>---Select---</option>
                                                                   <option>Christian</option>
                                                                   <option>Muslim</option>
                                                                   <option>Hindu</option>
                                                               </select><br/><br/>
             
           <label class="label" for="imgSrc">Image Path :</label><input id="imgSrc" name="imgSrc"  type="text" class="inputLogin" ></input><br/><br>
            </fieldset>
			
			<fieldset class="fieldHead">Parent/Guardian Information</fieldset>	

<fieldset class="fieldList">

			  <label class="label" for="fathername"><span>*</span>First Name :</label><input id="fatherfname"  type="text" class="inputLogin" name="fatherfname"></input>
			  <label class="label"><span>*</span>Last Name :</label><input  type="text" class="inputLogin" name="fatherlname"></input>
              <label class="label"><span>*</span>Occupation :</label><input  type="text" class="inputLogin" name="occupation"></input><br/><br/>
              <label class="label" for="phone"><span>*</span>Phone :</label><input id="pphone" name="pphone"  type="text" class="inputLogin" required="required"></input>
			 <label class="label" for="email"><span>*</span>Email :</label><input id="pemail" name="pemail"  type="text" class="inputLogin" required="required"></input>	
			 <label class="label" for="email"><span>*</span>Relationship :</label><input id="relation" name="relation"  type="text" class="inputLogin" required="required"></input>	
			 

             
              			</fieldset>
		
						
			<fieldset class="fieldHead">Class Details</fieldset>
			
<fieldset class="fieldList">

			<label  class="label"><span>*</span>Class :</label><select id="classname" class="inputs"  name="classname">
                                                                     <option>Select</option>
                                                                     <option>Nurser</option>
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
			<label  class="label"><span>*</span>Section :</label><select id="sectionList" class="inputs"  name="section">
			                                                    <option>Select</option>
			                                                    <option>A</option>
			                                                    <option>B</option>
			                                                    <option>C</option>
			                                                    <option>D</option>
			                                                  </select>
			<label  class="label"><span>*</span>Medium :</label><select id="sectionList" class="inputs"  name="medium">
			                                                    <option>Select</option>
			                                                    <option>Telugu</option>
			                                                    <option>English</option>
			                                                  </select><br><br>
			<label  class="label"><span>*</span>Second Lang : </label><select id="sectionList" class="inputs"  name="slang">
			                                                    <option>Select</option>
			                                                    <option>Hindi</option>
			                                                    <option>Sanskrit</option>
			                                                    <option>telugu</option>
			                                                    <option>urdu</option>
			                                                  </select><br/><br/>
			</fieldset>
			
			
				<fieldset class="fieldHead">Fee Information</fieldset>	

<fieldset class="fieldList">

 <label class="label" ><span>*</span>Registration Fee :</label><input id="regFee"  type="text" class="inputLogin" name="regFee"></input>
 <label class="label"><span>*</span>Fee Paid :</label><input  type="text" class="inputLogin" name="feePaid"></input>
 <label class="label" ><span>*</span>Tuition Fee :</label><input  type="text" class="inputLogin" name="tutionFee"></input><br/><br/>
 <label class="label" ><span>*</span>Misc Fee :</label><input id="phone" name="misFee"  type="text" class="inputLogin" required="required"></input>
 <label class="label" ><span>*</span>Total Fee :</label><input id="email" name="totalFee"  type="text" class="inputLogin" required="required"></input>	
		             
              			</fieldset>
			
			
			<fieldset class="fieldHead">Address For Correspondence</fieldset>
			
						
			<fieldset class="fieldList">
			
			  <label  class="label"><span>*</span>House No :: </label><input  type="text" class="inputLogin" name="hno"></input>
			  <label  class="label"><span>*</span>Street :: </label><input  type="text" class="inputLogin" name="street"></input>
              <label  class="label"><span>*</span>Locality :: </label><input  type="text" class="inputLogin" name="locality"></input><br/><br/>
              <label  class="label"><span>*</span>city :: </label><input  type="text" class="inputLogin" name="city"></input>			
			  <label  class="label"><span>*</span>State :: </label><input  type="text" class="inputLogin" name="state"></input>
			  <label  class="label"><span>*</span>Country :: </label><input  type="text" class="inputLogin" name="country"></input><br/><br/>
			  <label  class="label"><span>*</span>Zip Code :: </label><input  type="text" class="inputLogin" name="zip"></input>
              </fieldset>
			
		<fieldset class="fieldList">
			 <label  class="label"></label><input class="submitLogin"  type="reset"/><input class="submitLogin" style="margin-left: 20px;" type="submit" value="Submit"  />
		</fieldset>	
			 </form>
	</div> <!-- content div ending-->
		
	<!-- footer div starting -->
		
	 <!-- footer div ending -->
	</div> <!-- container div ending-->

</body>
</html>