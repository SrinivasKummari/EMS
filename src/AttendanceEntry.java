

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;



import com.demo.dao.*;
import com.demo.dto.*;
import com.demo.util.ExtendDate;

/**
 * Servlet implementation class Attendance
 */
@WebServlet("/AttendanceEntry")
public class AttendanceEntry extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       
        PrintWriter out = response.getWriter();
       
         if(request.getParameter("classname")!=null){
        	
              Connection connection=null;
			
				try {
					connection = ConnectionProvider.getConnection();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			 String classname=request.getParameter("classname");
              String section=request.getParameter("section");
               String fromDate=request.getParameter("fromdate");
             // String toDate=request.getParameter("todate");
              System.out.print("frmdate-"+fromDate);
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
                 } try{
                  ClassRoom classroom = ClassRoomDao.retriveDataByClass(i, section, connection);
                 List<Student> students = StudentClassDao.retriveDataByClass(classroom.getId(), connection);
                 
                 
                 SimpleDateFormat df= new SimpleDateFormat("dd-MM-yyyy");
                 Date frmDate= df.parse(fromDate);
                 //out.println(frmDate);
                 HttpSession session =request.getSession();
                 session.setAttribute("fromdate", frmDate);
                 session.setAttribute("classId",classroom.getId());
                    //Date toDate2=df.parse(toDate);
                   
                 if(!students.isEmpty()){
                	 System.out.println("got students");
                	 System.out.println(AttendanceDao.retriveDataByclassDay(classroom.getId(), frmDate, connection));
                     if(AttendanceDao.retriveDataByclassDay(classroom.getId(), frmDate, connection))
                        {
                            request.setAttribute("error", "attendance already entered for this day");
                            request.getRequestDispatcher("Common/error.jsp").forward(request, response);
                        }
                     else if(frmDate.compareTo(new Date())>0){
                         request.setAttribute("error", "this is a future day");
                            request.getRequestDispatcher("Common/error.jsp").forward(request, response);
                     }
                     else{
                     //if(frmDate.compareTo(toDate2)<=0){
                         //Student student = new Student();
                         /*for(Student s:students){
                             //student =StudentDao.retriveData(i, null, connection).get(0);
                             out.println(s.getStudentId()+"--"+s.getFname()+" "+s.getLname());
                            // String existedDate;
                            //    for(Date checkdate=frmDate;checkdate.compareTo(toDate2)<=0;checkdate=ExtendDate.rollDays(checkdate, 1)){
                               
                        Attendance attendance = new Attendance();
                       
                        attendance.setToDay(frmDate);
                        attendance.setClassroom(classroom);
                        attendance.setStudent(s);
                                AttendanceDao.insert(attendance ,connection);
                         }
                                int days=ExtendDate.daysDiff(frmDate, toDate2);
                                for(int j=0;j<days;j++){
                                }*/
                    	 System.out.println("else part");
                    	 session.setAttribute("mark", "markattendance");
                    	 session.setAttribute("students", students);
                                session.setAttribute("conn",connection);
                       //  request.getRequestDispatcher("Student/MarkAttendance.jsp").forward(request, response);
                                response.sendRedirect(request.getContextPath()+"/Student/MarkAttendance.jsp");
                     //connection.commit();connection.close();
                                }
                 }
                 else{
                	 request.setAttribute("error", "There are no students in this class");
                     request.getRequestDispatcher("Common/error.jsp").forward(request, response);
                	 //out.print("There are no students in this class");
                 }
                         }
                 catch (Exception e) {
                    // TODO: handle exception
                }
         }
    }
}

