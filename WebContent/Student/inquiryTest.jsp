<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My WebSite for Schools</title>
<!-- <link rel="stylesheet" type=text/css href="layout.css"/> -->
<link rel="stylesheet" type=text/css href="../css/login.css" href="../css/content.css"/>
<style type="text/css">

table {
    margin: 40px auto;
}
td {
    width: 150px;
    height: 150px;
    text-align: center;
    padding: 20px;
}
td.spacer {
    height: 10px;
    padding: 0;
    background: #eee;
    border: 1px black solid;
}
td.pictext {
    height: 40px;
    vertical-align: top;
    font: normal 8pt verdana;
    text-align: center;
}
td a:link, td a:visited, td a:active {
    display: block;
    border: 1px white solid;
}
td a:hover {
    border: 1px black solid;
}
td a img {
    border: none;
}

</style>
<script type="text/javascript">

var text = {
        logo: "This is the SitePoint logo." ,
        lemons: "...and these are some lemons..Wow." //no trailing comma!
}

function pictext(what, where)
{
    what = text[what];
    where = document.getElementById(where);
    while (where.hasChildNodes())
        where.removeChild(where.lastChild);
    if (where && what)
    {
        what = document.createTextNode(what);
        where.appendChild(what);
    }
}

</script>

</head>
<body style="background-image: url('../images/schools7.jpg');">
 	<!-- container div starting-->

<div  id="container" class="container" >
<%if(session.getAttribute("uType").toString().equalsIgnoreCase("Student")){
	%><jsp:include page="../Common/common_student.jsp"></jsp:include>
<% }else{%><jsp:include page="../Common/common_finale.jsp"></jsp:include>
<%} %>

		<!-- content div starting-->
	
	
	<div id="InquiryContent"  class="content" >
    


<table>
      <tbody>
            <tr>
               <td><a href="#null" onclick="pictext('logo','pictext1')"><img id="logo" title="click me" src="smiley.jpg" /></a></td>
               <td><a href="#null" onclick="pictext('lemons','pictext2')"><img id="lemons" title="click me" src="smiley.jpg" /></a></td>
    
               <td id="pictext1" class="pictext"></td><td id="pictext2" class="pictext" colspan="2"></td>
      </tbody>
</table>

</div>
</div>
</body>
</html>