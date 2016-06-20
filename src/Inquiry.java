

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.dao.AddressDao;
import com.demo.dao.ClassRoomDao;
import com.demo.dao.ConnectionProvider;
import com.demo.dao.ParentDao;
import com.demo.dao.StudentAddressDao;
import com.demo.dao.StudentClassDao;
import com.demo.dao.StudentDao;
import com.demo.dto.Address;
import com.demo.dto.ClassRoom;
import com.demo.dto.Parent;
import com.demo.dto.Student;
import com.demo.dto.StudentAddress;
import com.demo.dto.StudentClass;

/**
 * Servlet implementation class Enquiry
 */
@WebServlet("/Enquiry")
public class Inquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String str=request.getParameter("stdid");
		String str1=request.getParameter("name");
		String str2=request.getParameter("classList");
		String str3=request.getParameter("sectionList");
		PrintWriter out=response.getWriter();
		
		Connection conn;
		//ConnectionProvider connectionProvider =new ConnectionProvider();
		try {
			conn=ConnectionProvider.getConnection();
			System.out.println("connected to the DB");
			try{
				
				Student student = StudentDao.retriveData(Integer.valueOf(str),conn).isEmpty()==true?null:StudentDao.retriveData(Integer.valueOf(str),/* str1,*/conn).get(0);
				int i=student.getParent().getParentId();
				System.out.println("got parent id from stdent table---"+i);
				Parent parent=ParentDao.retriveData(i, conn);
				System.out.println("got parent id from parent table---"+i);
				StudentAddress studentAddress=StudentAddressDao.retriveData(Integer.valueOf(str), conn);
				int j=studentAddress.getAddress().getAddressId();
				System.out.println("got address id from student address---"+j);
				Address address=AddressDao.retriveData(j,conn);
				StudentClass studentClass=StudentClassDao.retrieveData(Integer.valueOf(str), conn);
				int k=studentClass.getClassroom().getId();
				System.out.println("got class room id from student class"+k);
				ClassRoom classRoom=ClassRoomDao.retriveData(k,conn);
						//String name=hashMap.get(str);
				if(student!=null){
					out.println("<table><tr><th>ID</th><th>F Name</th><th>L name</th><th>DOB</th></tr>");
					//out.print("<b>ID</b>"+str+"<br>");
					
					out.print("<tr><td>"+student.getStudentId()+"</td>");
					out.print("<td>"+student.getFname()+"</td>");
					out.print("<td>"+student.getLname()+"</td>");
					out.println("<td>"+student.getCaste()+"</td>");
					out.print("<td>"+student.getDOB()+"</td></tr>");
					out.print("</table>");
				}
				
			}
			catch(Exception e){
				{
					out.println("<b>No student</b>");
				}
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
	/*	Map<String ,String> hashMap=new HashMap<String,String>();
		hashMap.put("1", "srinivas");
		hashMap.put("2", "Raj");
	List<String> ids=new ArrayList<String>();
	ids.add("1");
	ids.add("2")
	ids.add("3");
	*/
		


}
	
	
	
	}

