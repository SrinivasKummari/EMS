package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.demo.dto.Address;





public class AddressDao {

	
	public static int insert(Address address,Connection conn) throws SQLException{

		
		String query = "insert into Address(house_no,street,locality,city,state,zip_code) values(?,?,?,?,?,?)";
			
				//String str="select * from student";
		
		
		PreparedStatement 	stmt = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
		
		//stmt.setInt(1, address.getAddressId());
		stmt.setString(1, address.getHouseNo());
		stmt.setString(2, address.getStreet());
		stmt.setString(3, address.getLocality());
		stmt.setString(4, address.getCity());
		stmt.setString(5, address.getState());
	    stmt.setString(6,address.getZipCode());
		    
			   //ResultSet rs = stmt.executeQuery(str);
			   

				//System.out.println("query" +query);
			   
				int i = stmt.executeUpdate();
				ResultSet rs=stmt.getGeneratedKeys();
/*			int j=stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);	*/
			
				if(i>0){
					
					System.out.println("Sql statement executed successfully");
					if(rs.next()){
						return rs.getInt(1);
					}
					
				}
			    
				
			   stmt.close();
				
				//conn.close();
				System.out.println("Disconnected from database");
				
				return i;
			}

public static Address retriveData(Integer aid,Connection conn) throws SQLException{
			

			Statement 	stmt = conn.createStatement();
			Address address = new Address();
		
			if(aid!=null){
				
			String query ="	select * from address where address_id='"+aid+"'";
			
			ResultSet rs = stmt.executeQuery(query);

			while(rs.next()){
				
				//System.out.println("it is in result set");
				address.setAddressId(rs.getInt(1));
				address.setHouseNo(rs.getString(2));
				address.setStreet(rs.getString(3));
				address.setLocality(rs.getString(4));
				address.setCity(rs.getString(5));
				address.setState(rs.getString(6));
				address.setZipCode(rs.getString(7));
			
				
				
			}
	
			}
			
			
			
			return address;
			
		}

		public static boolean update(Address address,Connection conn) throws SQLException{
			String query = "update address set  house_no=? , street=? , locality=? , city=? , state=? , zip_code=? where address_id=? ";
			
			//Connection conn= ConnectionProvider.getConnection(); 
			
			
			PreparedStatement stmt = conn.prepareStatement(query);
			
			
			stmt.setString(1, address.getHouseNo());
			stmt.setString(2, address.getStreet());
			stmt.setString(3, address.getLocality());
			stmt.setString(4, address.getCity());
			stmt.setString(5, address.getState());
		    stmt.setString(6,address.getZipCode());
		    stmt.setInt(7,	address.getAddressId());
		    
			int i=stmt.executeUpdate();
			if(i>0){
				return true;
			}
			
			return false;
		}
		
		public static boolean delete(Integer pid) throws SQLException{
			
			String query="delete from parent where parent_id="+pid;
			
			Statement stmt = ConnectionProvider.getConnection().createStatement();
			
			int i =stmt.executeUpdate(query);
			if(i>0)
			return true;
		    return false;
		}
public static void main(String[] args) throws SQLException {

	Address address= new Address();
	address.setAddressId(1);
	address.setCity("hyd");
	address.setHouseNo("2-8/5");
	Connection conn= ConnectionProvider.getConnection();
	update(address, conn);
	conn.commit();
	conn.close();
	
}
	


}
