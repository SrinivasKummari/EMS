

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.dao.AddressDao;
import com.demo.dao.ConnectionProvider;
import com.demo.dao.FacultyAddressDao;
import com.demo.dao.FacultyDao;
import com.demo.dao.UsersDao;
import com.demo.dto.Address;
import com.demo.dto.Faculty;
import com.demo.dto.FacultyAddress;
import com.demo.dto.Users;


public class SubmitFacultyAdmission extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Connection conn=null;
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	SimpleDateFormat sdf=new SimpleDateFormat("dd-mm-yyyy");	
		String fname=request.getParameter("fname");
		   String lname=request.getParameter("lname");
		   String dob=request.getParameter("dob");
		   
		   String doj=request.getParameter("doj");
		   String gender=request.getParameter("gender");
		   String imgSrc=request.getParameter("imgSrc");
		   
		   String phone=request.getParameter("phone");
		   String email=request.getParameter("email");
		   String qualification=request.getParameter("qualification");
		   String experience=request.getParameter("experience");
		   String previousctc=request.getParameter("previousctc");
		   String currentctc=request.getParameter("currentctc");
		   String previousschool=request.getParameter("previousschool");
		   String subject=request.getParameter("subject");
		   String hNo=request.getParameter("hno");
		   String street=request.getParameter("street");
		   String locality=request.getParameter("locality");
		   String city=request.getParameter("city");
		   String state=request.getParameter("state");
		   String country=request.getParameter("country");
		   String zip=request.getParameter("zip");
		   
		   
		   Faculty faculty=new Faculty();
		   faculty.setFname(fname);
		   faculty.setLname(lname);
		   try {
			faculty.setDOB(sdf.parse(dob));
			faculty.setDOJ(sdf.parse(doj));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		   
		   faculty.setGender(gender);
		   faculty.setImgSrc(imgSrc);
		   faculty.setPhone(phone);
		   faculty.setEmail(email);
		   faculty.setQualification(qualification);
		   faculty.setExperience(Float.parseFloat(experience));
		   faculty.setPreviousCTC(Float.parseFloat(previousctc));
		   faculty.setCurrentCTC(Float.parseFloat(currentctc));
		   faculty.setPrevious_school(previousschool);
		   faculty.setSubject(subject);
		   Address address=new Address();
		   address.setHouseNo(hNo);
		   address.setStreet(street);
		   address.setLocality(locality);
		   address.setCity(city);
		   address.setState(state);
		   address.setCountry(country);
		   address.setZipCode(zip);
		   try {
		int facultyId=	FacultyDao.insert(faculty, conn);
		System.out.println("faculty inserted successfully and faculty id is: "+facultyId);
		int addressId=	AddressDao.insert(address, conn);
		System.out.println("Address inserted successfully and address_id: "+addressId);
		FacultyAddress facultyAddress=new FacultyAddress();
		facultyAddress.setAddressId(addressId);
		facultyAddress.setFacultyId(facultyId);
		int i=FacultyAddressDao.insert(facultyAddress, conn);
		

		   Users user = new Users();
		   user.setUserName(fname.substring(0,3)+lname);
		   user.setPassword("Password");
		   user.setUserType("admin");
		   user.setId(facultyId);
		   UsersDao.insert(user, conn);
		System.out.println("number of rows in FacultyAddress table is: "+i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   try {
			conn.commit();
			conn.close();
			/* RequestDispatcher dispatcher =request.getRequestDispatcher("/Common/Success.jsp");   
			   dispatcher.forward(request, response);*/
			HttpSession session=request.getSession();
			session.setAttribute("msg", "Faculty added successfully");
			response.sendRedirect(request.getContextPath()+"/Common/Success.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
		  	   
	
	}

}
