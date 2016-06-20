import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.demo.dao.AddressDao;
import com.demo.dao.ClassRoomDao;
import com.demo.dao.ConnectionProvider;
import com.demo.dao.FeeDao;
import com.demo.dao.GradeDao;
import com.demo.dao.ParentDao;
import com.demo.dao.StudentAddressDao;
import com.demo.dao.StudentClassDao;
import com.demo.dao.StudentDao;
import com.demo.dao.UsersDao;
import com.demo.dto.Address;
import com.demo.dto.ClassRoom;
import com.demo.dto.Fee;
import com.demo.dto.Grade;
import com.demo.dto.Parent;
import com.demo.dto.Student;
import com.demo.dto.StudentAddress;
import com.demo.dto.StudentClass;
import com.demo.dto.Users;
import com.sun.org.apache.xml.internal.serializer.ToTextStream;


public class SubmitAdmission  extends HttpServlet{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException{
		
		
		String fname=request.getParameter("fname");
		   String lname=request.getParameter("lname");
		   String dob=request.getParameter("dob");
		   
		   String doj=request.getParameter("doj");
		   String gender=request.getParameter("gender");
		   String religion=request.getParameter("religion");
		   
		   String caste=request.getParameter("cast");
		   String sphone=request.getParameter("phone");
		   String semail=request.getParameter("email");
		   String imgSrc=request.getParameter("imgSrc");
		   System.out.println("imgSrc value from UI is : "+imgSrc);
		   if(imgSrc.isEmpty()){
			      imgSrc="Images/logo.jpg";
		   }
		   
		   
		   String fatherfname=request.getParameter("fatherfname");
		   String fatherlname=request.getParameter("fatherlname");
		   String occupation=request.getParameter("occupation");
		   
		   String relation=request.getParameter("relation");
		   String pphone=request.getParameter("pphone");
		   String pemail=request.getParameter("pemail");
		  
		   
		   
		   String classname=request.getParameter("classname");
		   String section=request.getParameter("section");
		   String medium=request.getParameter("medium");
		   String slang=request.getParameter("slang");
		   
		   String regFee=request.getParameter("regFee");
		   String tutionFee=request.getParameter("tutionFee");
		   String feePaid=request.getParameter("feePaid");
		   String misFee=request.getParameter("misFee");
		   String totalFee=request.getParameter("totalFee");
		   
		   String hNo=request.getParameter("hno");
		   String street=request.getParameter("street");
		   String locality=request.getParameter("locality");
		   String city=request.getParameter("city");
		   String state=request.getParameter("state");
		   String country=request.getParameter("country");
		   String zip=request.getParameter("zip");
		   
		   Parent parent = new Parent();
		   SimpleDateFormat df= new  SimpleDateFormat("dd-mm-yyyy");
		   int j=0;
		
		   Connection connection=null;
		try {
			connection = ConnectionProvider.getConnection();
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		   if(connection!=null){
		try {
		//	j = ParentDao.getMaxId();
		/*Connection connection =ConnectionProvider.getConnection();*/
		   //parent.setParentId(11);
		   parent.setFirstName(fatherfname);
		   parent.setLastName(fatherlname);
		   parent.setPhone(pphone);
		   parent.setEmail(pemail);
		   parent.setOccupation(occupation);
		   parent.setRelation(relation);
		   
		   int parentId= ParentDao.insert(parent,connection);
		   if(parentId>0){
			   parent.setParentId(parentId);
			   System.out.println("parent inserted");
		   }
		   
		   Fee fee=new Fee();
		   fee.setRegFee(Float.parseFloat(regFee));
		   fee.setFeePaid(Float.parseFloat(feePaid));
		   fee.setTutionFee(Float.parseFloat(tutionFee));
		   fee.setMisFee(Float.parseFloat(misFee));
		   fee.setTotalFee(Float.parseFloat(totalFee));
		   int feeId=FeeDao.insertData(fee, connection);
		   
		   if(feeId>0){
			   fee.setFeeId(feeId);
			   System.out.println("Fee id inserted into the fee table successfully...");
		   }
		
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
			
		   Student student = new Student();
		    String rollno=StudentDao.getMaxId(i.toString(),section);
		    Integer roll=Integer.valueOf(rollno)+1;
		    //roll.toString().format("00", null);
		    // dto.setStudentId(k+1);
		   student.setFname(fname);
		   student.setLname(lname);   	   
		   student.setDOB(df.parse(dob));
		   
		   student.setDOJ(df.parse(doj));
		   student.setPhone(sphone);
		   student.setEmail(semail);
		   
		   student.setCaste(caste);
		   student.setGender(gender);
		   student.setReligion(religion);
		   
		   student.setMedium(medium);
		   student.setSecondLang(slang);
		   student.setFee(fee);
		   
		   student.setParent(parent);
		   student.setImgSrc(imgSrc);
		   student.setRollNo(Calendar.getInstance().get(1)+String.format("%02d", i)+section+String.format("%02d", roll));
           
		   int studentId=  StudentDao.insert(student,connection);
		 if(studentId>0){
			 student.setStudentId(studentId);
			 System.out.println("student inserted successfully");
		 }
		 
		 StudentClass class1 = new StudentClass();
		 
		 class1.setStudent(student);
		 
		ClassRoom classRoom = ClassRoomDao.retriveDataByClass(i, section,connection);
		System.out.println("id----------"+classRoom.getId()+"clgradeid-----"+classRoom.getGradeId()+"  "+classRoom.getSection());
		   class1.setClassroom(classRoom);
		   
		   StudentClassDao.insert(class1,connection);
		   
		   Address address= new Address();
		   address.setHouseNo(hNo);
		   address.setStreet(street);
		   address.setLocality(locality);
		   address.setCity(city);
		   
		   address.setState(state);
		   address.setZipCode(zip);
		   
		   
		   
		   int addressId=AddressDao.insert(address, connection);
		   address.setAddressId(addressId);
		   StudentAddress studentAddress = new StudentAddress();
		   studentAddress.setAddress(address);
		   studentAddress.setStudent(student);
		   StudentAddressDao.insert(studentAddress, connection);
		   
		   Users user = new Users();
		   user.setUserName(fname.substring(0,3)+lname);
		   user.setPassword("Password");
		   user.setUserType("student");
		   user.setId(studentId);
		   UsersDao.insert(user, connection);
		   connection.commit();
		   connection.close();
		  /* RequestDispatcher dispatcher =request.getRequestDispatcher("Common/Success.jsp");   
		   dispatcher.forward(request, response);*/
		   HttpSession session=request.getSession();
		   
		   session.setAttribute("msg", "The student added successully & student Id is : "+Calendar.getInstance().get(1)+String.format("%02d", i)+section+String.format("%02d", roll));
		   response.sendRedirect(request.getContextPath()+"/Common/Success.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
				connection.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			
		}
		finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		   }
		   else{
			   System.out.println("connection not established");
		   }
		
	
		   }

}

















/*import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.dao.ClassRoomDao;
import com.demo.dao.ConnectionProvider;
import com.demo.dao.GradeDao;
import com.demo.dao.ParentDao;
import com.demo.dao.StudentDao;
import com.demo.dto.ClassRoom;
import com.demo.dto.Grade;
import com.demo.dto.Parent;
import com.demo.dto.Student;
import com.demo.dto.StudentClass;


public class SubmitAdmission  extends HttpServlet{
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException{
		
		
		String fname=request.getParameter("fname");
		   String lname=request.getParameter("lname");
		   String dob=request.getParameter("dob");
		   
		   String doj=request.getParameter("doj");
		   String gender=request.getParameter("gender");
		   String religion=request.getParameter("religion");
		   
		   String caste=request.getParameter("cast");
		   String sphone=request.getParameter("phone");
		   String semail=request.getParameter("email");
		   
		   String fatherfname=request.getParameter("fatherfname");
		   String fatherlname=request.getParameter("fatherlname");
		   String occupation=request.getParameter("occupation");
		   String relation=request.getParameter("relation");
		   String pphone=request.getParameter("phone");
		   String pemail=request.getParameter("email");
		  
		   
		   
		   String classname=request.getParameter("classname");
		   String section=request.getParameter("section");
		   String medium=request.getParameter("medium");
		   String slang=request.getParameter("slang");
		   String hNo=request.getParameter("hno");
		   String street=request.getParameter("street");
		   String locality=request.getParameter("locality");
		   String city=request.getParameter("city");
		   String state=request.getParameter("state");
		   String country=request.getParameter("country");
		   String zip=request.getParameter("zip");
		   
		   Parent parent = new Parent();
		   SimpleDateFormat df= new  SimpleDateFormat("dd/mm/yyyy");
		   int j=0;
		try {
		//	j = ParentDao.getMaxId();
		
		   //parent.setParentId(11);
		   parent.setFirstName(fatherfname);
		   parent.setLastName(fatherlname);
		   parent.setPhone(pphone);
		   parent.setEmail(pemail);
		   parent.setOccupation(occupation);
		   parent.setRelation(relation);
		   
		   ParentDao.insert(parent);
		   
		   Student student = new Student();
		  // int k=StudentDao.getMaxId();
		  // dto.setStudentId(k+1);
		   student.setFname(fname);
		   student.setLname(lname);
   	   
		   student.setDOB(df.parse(dob));
		   student.setDOJ(df.parse(doj));
		   student.setPhone(sphone);
		   student.setParent(parent);
		   student.setEmail(semail);
		   student.setCaste(caste);
		   student.setGender(gender.equals("Male")?'M':'F');
		   student.setReligion(religion);
		   
		 int studentId=  StudentDao.insert(student);
		 
		 StudentClass class1 = new StudentClass();
		 
		 class1.setStudentId(studentId);
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
		 
		ClassRoom classRoom = ClassRoomDao.retriveData(i, section);
		   class1.setClassroomId(classRoom.getId());
		   
		  	   
		} catch (Exception e) {
			e.printStackTrace();
			
		} 
	}

}
*/