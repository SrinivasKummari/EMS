 

var personal=document.getElementById("personal");

var clas=document.getElementById("class");
var fee=document.getElementById("fee");
var address=document.getElementById("address");
var attendance=document.getElementById("attendance");
var marks=document.getElementById("Marks");

var imgcolor1=document.getElementById("img1");
var imgcolor2=document.getElementById("img2");
var imgcolor3=document.getElementById("img3");
var imgcolor4=document.getElementById("img4");
var imgcolor5=document.getElementById("img5");
var imgcolor6=document.getElementById("img6");

function ValidatePersonalInfo() {
	
	
	clas.style.visibility="hidden";
	fee.style.visibility="hidden";
	address.style.visibility="hidden";
	marks.style.visibility="hidden";
	attendance.style.visibility="hidden";

	
	imgcolor2.style.border="5px solid #1947D1";
	imgcolor3.style.border="5px solid #1947D1";
	imgcolor4.style.border="5px solid #1947D1";
	imgcolor5.style.border="5px solid #1947D1";
	imgcolor6.style.border="5px solid #1947D1";
	
	if(personal.style.visibility == "hidden") {
        personal.style.visibility = "visible";
        imgcolor1.style.border="5px solid #33AD33";
}
else if(personal.style.visibility=="visible") {
    personal.style.visibility = "hidden";
    imgcolor1.style.border="5px solid #1947D1";
}

}


function ValidateClass() {
	personal.style.visibility="hidden";
	fee.style.visibility="hidden";
	address.style.visibility="hidden";
	attendance.style.visibility="hidden";
	marks.style.visibility="hidden";
	
	imgcolor1.style.border="5px solid #1947D1";
	imgcolor3.style.border="5px solid #1947D1";
	imgcolor4.style.border="5px solid #1947D1";
	imgcolor5.style.border="5px solid #1947D1";
	imgcolor6.style.border="5px solid #1947D1";
	
	
	if(clas.style.visibility == "hidden") {
		clas.style.visibility = "visible";
		imgcolor2.style.border="5px solid #33AD33";
	}
else if(clas.style.visibility=="visible") {
	clas.style.visibility = "hidden";
	imgcolor2.style.border="5px solid #1947D1";
  }
}
function ValidateAddress() {
	
	clas.style.visibility="hidden";
	fee.style.visibility="hidden";
	personal.style.visibility="hidden";
	attendance.style.visibility="hidden";
	marks.style.visibility="hidden";

	imgcolor1.style.border="5px solid #1947D1";
	imgcolor2.style.border="5px solid #1947D1";
	imgcolor4.style.border="5px solid #1947D1";
	imgcolor5.style.border="5px solid #1947D1";
	imgcolor6.style.border="5px solid #1947D1";
	
	if(address.style.visibility == "hidden") {
		address.style.visibility = "visible";
		imgcolor3.style.border="5px solid #33AD33";
}
else if(address.style.visibility=="visible") {
	address.style.visibility = "hidden";
	imgcolor3.style.border="5px solid #1947D1";
}
	
}
function ValidateFee() {
	
	clas.style.visibility="hidden";
	personal.style.visibility="hidden";
	address.style.visibility="hidden";
	attendance.style.visibility="hidden";
	marks.style.visibility="hidden";
	
	imgcolor1.style.border="5px solid #1947D1";
	imgcolor2.style.border="5px solid #1947D1";
	imgcolor3.style.border="5px solid #1947D1";
	imgcolor5.style.border="5px solid #1947D1";
	imgcolor6.style.border="5px solid #1947D1";
	
	
	if(fee.style.visibility == "hidden") {
		fee.style.visibility = "visible";
		imgcolor4.style.border="5px solid #33AD33";
}
else if(fee.style.visibility=="visible") {
	fee.style.visibility = "hidden";
	imgcolor4.style.border="5px solid #1947D1";
}
	
}
function ValidateAttendance() {
	clas.style.visibility="hidden";
	personal.style.visibility="hidden";
	address.style.visibility="hidden";
	fee.style.visibility="hidden";
	marks.style.visibility="hidden";
	
	imgcolor1.style.border="5px solid #1947D1";
	imgcolor2.style.border="5px solid #1947D1";
	imgcolor3.style.border="5px solid #1947D1";
	imgcolor4.style.border="5px solid #1947D1";
	imgcolor6.style.border="5px solid #1947D1";
	
	
	if(attendance.style.visibility == "hidden") {
		attendance.style.visibility = "visible";
		imgcolor5.style.border="5px solid #33AD33";
	}
else if(attendance.style.visibility=="visible") {
	attendance.style.visibility = "hidden";
	imgcolor5.style.border="5px solid #1947D1";
}
	
}

function ValidateMarks() {
	clas.style.visibility="hidden";
	personal.style.visibility="hidden";
	address.style.visibility="hidden";
	fee.style.visibility="hidden";
	attendance.style.visibility="hidden";
	
	imgcolor1.style.border="5px solid #1947D1";
	imgcolor2.style.border="5px solid #1947D1";
	imgcolor3.style.border="5px solid #1947D1";
	imgcolor4.style.border="5px solid #1947D1";
	imgcolor5.style.border="5px solid #1947D1";
	
	
	if(marks.style.visibility == "hidden") {
		marks.style.visibility = "visible";
		imgcolor6.style.border="5px solid #33AD33";
}
else if(marks.style.visibility=="visible") {
	marks.style.visibility = "hidden";
	imgcolor6.style.border="5px solid #1947D1";
}
	
}

