package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.demo.dto.BusRoute;

public class BusRouteDao {

	public static BusRoute retrieveBusInfo(String stopNo,Connection conn) throws SQLException{
		BusRoute busRoute=new BusRoute();
	String query="select route_no,stop_name,pick_time,drop_time,slab_for_trans_fee from bus_route where stop_no='"+stopNo+"'";
	System.out.println("query is-->"+query);
	PreparedStatement stmt=conn.prepareStatement(query);	
	ResultSet rs=stmt.executeQuery();
	if(rs!=null){
		while(rs.next()){
			busRoute.setRouteNo(rs.getString(1));
			busRoute.setStopName(rs.getString(2));
			busRoute.setPickTime(rs.getString(3));
			busRoute.setDropTime(rs.getString(4));
			busRoute.setSlabForTransFee(rs.getString(5));
		}
	}else{
		System.out.println("Result set is null");
	}
		return busRoute;
	}
}
