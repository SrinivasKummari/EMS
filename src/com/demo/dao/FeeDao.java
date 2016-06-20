package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.demo.dto.Fee;
import com.demo.dto.Parent;

public class FeeDao {
	
	public static int insertData(Fee fee,Connection conn) throws SQLException{
		String query="insert into fee(reg_fee,fee_paid,tution_fee,mis_fee,total_fee) values(?,?,?,?,?)";
		PreparedStatement statement=conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
		statement.setFloat(1, fee.getRegFee());
		statement.setFloat(2, fee.getFeePaid());
		statement.setFloat(3, fee.getTutionFee());
		statement.setFloat(4, fee.getMisFee());
		statement.setFloat(5, fee.getTotalFee());
		
		int i=statement.executeUpdate();
		ResultSet rs=statement.getGeneratedKeys();
		
		if(i>0){
			System.out.println("sql statment executed successfully...");
			if(rs.next()){
				return rs.getInt(1);
			}
		}
		return i;
	}
	
	public static Fee retriveData(Integer feeId,Connection conn) throws SQLException{
		System.out.println("fee id is-->" +feeId);
		Statement 	stmt = conn.createStatement();
		Fee fee=new Fee();
		
		if(feeId!=null){
			String query="select * from Fee where fee_id='"+feeId+"'";	
			System.out.println(query);
			ResultSet rs=stmt.executeQuery(query);
			
			while(rs.next()){
				System.out.println("it is in Fee result set");
				fee.setFeeId(rs.getInt(1));
				fee.setFeePaid(rs.getFloat(3));
				fee.setRegFee(rs.getFloat(2));
				fee.setMisFee(rs.getFloat(5));
				fee.setTutionFee(rs.getFloat(4));
				fee.setTotalFee(rs.getFloat(6));
					
			}
		}else{
			System.out.println("Fee Id is null");
		}
		
		
		
		
		
		return fee;
	}
	
public static boolean update(Fee fee,Connection conn) throws SQLException{
	
	String query="update FEE set reg_fee=? ,fee_paid=? ,tution_fee=? ,mis_fee=?,total_fee=? where fee_id=? ";
	
	PreparedStatement stmt= conn.prepareStatement(query);
	
	stmt.setFloat(1, fee.getRegFee());
	stmt.setFloat(2, fee.getFeePaid());
	stmt.setFloat(3, fee.getTutionFee());
	stmt.setFloat(4, fee.getMisFee());
	stmt.setFloat(5, fee.getTotalFee());
	stmt.setInt(6, fee.getFeeId());
	
	int i=stmt.executeUpdate();
	if(i==1){
	
return true;
	}
	return false;
}

public static void main(String[] args) throws SQLException {
	Connection conn=ConnectionProvider.getConnection();
	FeeDao.retriveData(51, conn);
	conn.close();
}
}
