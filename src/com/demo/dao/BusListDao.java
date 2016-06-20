package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.demo.dto.BusList;

public class BusListDao {

	public static BusList retrieveBusInfo(String routeNo,Connection conn) throws SQLException{
		
		String query ="select route_name,begin_point,destination_point,bus_no,contact_no from bus_list where route_no='"+routeNo+"'";
		BusList busList=new BusList();
		PreparedStatement stmt=conn.prepareStatement(query);
		ResultSet rs=stmt.executeQuery();
		if(rs!=null){
			while(rs.next()){
				busList.setRouteName(rs.getString(1));
				busList.setBeginPoint(rs.getString(2));
				busList.setDestinationPoint(rs.getString(3));
				busList.setBusNo(rs.getString(4));
				busList.setContactNo(rs.getString(5));
			}
		}else{
			System.out.println("Result is empty");
		}
		return busList;
	}
}
