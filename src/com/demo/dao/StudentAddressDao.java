package com.demo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.demo.dto.Address;
import com.demo.dto.StudentAddress;
import com.demo.dto.StudentClass;

public class StudentAddressDao {
   
       
        public static int insert(StudentAddress sa,Connection connection) throws SQLException{
           
            String query="insert into STUDENT_ADDRESS(student_id,address_id) values(?,?)";
           
            /*Connection conn= ConnectionProvider.getConnection();*/
            java.sql.PreparedStatement statement = connection.prepareStatement(query);
           
            statement.setInt(1, sa.getStudent().getStudentId());
            statement.setInt(2, sa.getAddress().getAddressId());
           
            int i=statement.executeUpdate();
           
            System.out.println("inserted roows----"+i);
            statement.close();
        /*
        connection.commit();
        connection.close();*/
        return i;
        }
       
       
        public static StudentAddress retriveData(Integer sid,Connection conn ) throws SQLException{
            
        	 
            Statement     stmt = conn.createStatement();
             
         
            /******
             * need to implement for searching with name
             * 
             * *****/
        StudentAddress dto = new StudentAddress();
            if(sid!=null){
                 
            String query ="    select * from student_address where student_id='"+sid+"'";
             
            ResultSet rs = stmt.executeQuery(query);
             
         
            while(rs.next()){
                 
                System.out.println("it is in result set");
                dto.setStudent(StudentDao.retriveData(rs.getInt(1),conn).get(0));
                dto.setAddress(AddressDao.retriveData(rs.getInt(2),conn));
                }
             
            }
             
            stmt.close();
             
            return dto;
             
        }
}