import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.dao.AttendanceDao;
import com.demo.dao.ClassRoomDao;
import com.demo.dao.ConnectionProvider;
import com.demo.dao.ExamDao;
import com.demo.dao.StudentClassDao;
import com.demo.dto.ClassRoom;
import com.demo.dto.Exam;
import com.demo.dto.Student;


public class ClassMarksDisplay extends HttpServlet {
 


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
              try{
                  ClassRoom classroom = ClassRoomDao.retriveDataByClass(i, section, connection);
                 List<Student> students = StudentClassDao.retriveDataByClass(classroom.getId(), connection);
                 System.out.println("student size"+students.size()+"  "+students.get(0).getFname());
                 HttpSession session =request.getSession();
   List<Exam> exams = ExamDao.retrieveExamsOfClass(classroom.getId(), connection) ;
              
   
   if(students.isEmpty())
   {
       request.setAttribute("error", "No students found in this class");
       /*request.getRequestDispatcher("/Common/error.jsp").forward(request, response);*/
       response.sendRedirect(request.getContextPath()+"/Common/error.jsp");
   }
else if(exams.isEmpty()){
    session.setAttribute("error", "No Exams found for this class");
       /*request.getRequestDispatcher("/Common/error.jsp").forward(request, response);*/
        response.sendRedirect(request.getContextPath()+"/Common/error.jsp");
}
else{
	session.setAttribute("students", students);
	System.out.println("no of exams"+exams.size());
	session.setAttribute("exams", exams);
    session.setAttribute("conn",connection);
/* request.getRequestDispatcher("/Student/ClassMarksDisplay.jsp").forward(request, response); */
response.sendRedirect(request.getContextPath()+"/Student/ClassMarksDisplay.jsp");
}
}
         catch (Exception e) {
            // TODO: handle exception
        }
         }
         
    }
    
}