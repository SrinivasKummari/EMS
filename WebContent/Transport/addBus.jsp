<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<body style="background-image: url('../Images/schools7.jpg');">
 	<!-- container div starting-->

<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="${pageContext.request.contextPath}/../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="${pageContext.request.contextPath}/../Common/common_finale.jsp"></jsp:include>
<%} %>

		<!-- content div starting-->
	
	<div id="content"  class="content" >
			
					<fieldset class="fieldHead">Bus Information</fieldset>
					<form action="../SubmitAdmission" id="form" name="form"   method="post">
<fieldset class="fieldList">

	<label class="label" for="busNo"><span>*</span>Bus Number :</label><input id="busNo" name="busNo"  type="text" class="inputLogin" required="required"></input>
	<label class="label" for="routeNo"><span>*</span>Route Number :</label><input id="routeNo" name="routeNo"  type="text" class="inputLogin" required="required"></input>
	<label class="label" for="routeName"><span>*</span>Route Name :</label><input id="routeName" name="routeName"  type="text" class="inputLogin" required="required"></input><br/><br>
			  
    <label class="label" for="beginPoint">Begin Point :</label><input id="beginPoint" name="beginPoint"  type="text" class="inputLogin" ></input>
    <label class="label" for="destinationPoint"><span>*</span>Destination Point :</label><input  type="text" class="inputLogin" name="destinationPoint"></input>
    <label class="label" for="contactNo"><span>*</span>Contact Number :</label><input  type="text" class="inputLogin" name="contactNo"></input><br/><br/>
            </fieldset>
			
			<fieldset class="fieldHead">Route Information</fieldset>	

<fieldset class="fieldList">

			  <label class="label" for="stopNo"><span>*</span>Stop Number :</label><input id="fatherfname"  type="text" class="inputLogin" name="fatherfname"></input>
			  <label class="label"><span>*</span>Stop Name :</label><input  type="text" class="inputLogin" name="fatherlname"></input>
              <label class="label"><span>*</span>Picking Time :</label><input  type="text" class="inputLogin" name="occupation"></input><br/><br/>
              <label class="label" for="phone"><span>*</span>Dropping Time :</label><input id="pphone" name="pphone"  type="text" class="inputLogin" required="required"></input>
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