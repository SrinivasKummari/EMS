import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.dao.ConnectionProvider;
import com.demo.dao.StudentDao;
import com.demo.dto.Student;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;


public class ExcelTest {
	
	public ExcelTest() throws BiffException, IOException, SQLException{
		

Connection conn=null;
conn=ConnectionProvider.getConnection();
	
	File f = new File("C:/Users/SAI BABA/workspace/Book1.xls");
	
	Workbook wb= Workbook.getWorkbook(f);
	
	

	List<Student> dtos= new ArrayList<Student>();
	
	
	System.out.println(wb.getSheet(0).getName());
	
	int noOfSheets = wb.getNumberOfSheets();
	
	System.out.println("no of sheets---"+noOfSheets);
	Cell cell;
	int i,j,k;
	
	System.out.println("rows----------"+wb.getSheet(0).getRows());
	System.out.println("colss----------"+wb.getSheet(0).getColumns());
	for(i=0;i<noOfSheets;i++){
		Sheet sheet = wb.getSheet(i);
		for(j=0;j<sheet.getRows();j++){
		System.out.println("j value----"+j);
		Student studentDto = new Student();
		List<String> list = new ArrayList<String>();
		
			for(k=0;k<sheet.getColumns();k++){
				
				
				cell = sheet.getCell(k,j);
	
				System.out.println("cell "+k+","+j+" contents--"+cell.getContents());
				list.add(cell.getContents());
			System.out.println(" k value----"+k);
			
				
			}
System.out.println("building studentdto----" +j);
			//StudentDto studentDto = new StudentDto();
			studentDto .setStudentId(Integer.valueOf(list.get(0)));
			studentDto.setFname(list.get(1));
			studentDto.setLname(list.get(2));
			studentDto.setDOB(null);
			studentDto.setPhone(list.get(0));

			StudentDao dao = new StudentDao();
	//		dao.updateOrInsert(studentDto);
			
			
			Student dto =StudentDao.retriveData(1,conn).get(0);
			
			//dtos.add(studentDto);
		}
		
	}
/*System.out.println(dtos.get(0).getCourseIid());
	for(int l=0;l<dtos.size();l++){
		StudentDao dao = new StudentDao(dtos.get(i));
	}*/
	}
	public static void main(String[] args) throws BiffException, IOException, SQLException {
		// TODO Auto-generated method stub

	ExcelTest excelTest = new ExcelTest();
	
	}
	

}
