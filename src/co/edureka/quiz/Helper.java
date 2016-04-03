package co.edureka.quiz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Helper {

	
	
	
	public int getCountOfRegister()
	{
		StringBuilder sql =new StringBuilder("SELECT count(id)"+
  				" FROM  users");
  	
		int count = 0;
		
		Connection con=DatabaseConnectionFactory.createConnection();
		
		try
		{
			PreparedStatement ps = con.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
			count = rs.getInt(1);	
			}
		}catch(SQLException sqe){
			System.out.println("Error : While Inserting record in database");
			}
		try
		{
		 con.close();	
		}catch(SQLException se){
			System.out.println("Error : While Closing Connection");
			
		}
		return count;
     	}

	public int getCountOfResult(String id)
	{
		StringBuilder sql =new StringBuilder("SELECT count(id)"+
  				" FROM  result");
  		if (id !=null && id.trim().equals(""))
  			sql.append(" where ").append(" id ='").append(id.trim()).append("' ");
  	
		int count = 0;
		
		Connection con=DatabaseConnectionFactory.createConnection();
		
		try
		{
			PreparedStatement ps = con.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
			count = rs.getInt(1);	
			}
		}catch(SQLException sqe){
			System.out.println("Error : While Inserting record in database");
			}
		try
		{
		 con.close();	
		}catch(SQLException se){
			System.out.println("Error : While Closing Connection");
			
		}
		return count;
     	}
	
	public java.util.List<ResultModel> getListOfResult(String sql)
	{

		List<ResultModel> list = new ArrayList<ResultModel>();
		Connection con=DatabaseConnectionFactory.createConnection();
		
		try
		{
			PreparedStatement ps = con.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
			list.add(new ResultModel(chkNull(rs.getString("id")), chkNull(rs.getString("uid")), chkNull(rs.getString("studentName")), 
					chkNull(rs.getString("exam_type")), chkNull(rs.getString("no_of_qos")), chkNull(rs.getString("status")), chkNull(rs.getString("corrent_ans")),chkNull(rs.getString("start_time"))))	;
			}
		}catch(SQLException sqe){
			System.out.println("Error : While Inserting record in database");
			}
		try
		{
		 con.close();	
		}catch(SQLException se){
			System.out.println("Error : While Closing Connection");
			
		}
		return list;
     	}
	
	
	public java.util.List<Users> getListOfUsers(String sql)
	{

		List<Users> list = new ArrayList<Users>();
		Connection con=DatabaseConnectionFactory.createConnection();
		
		try
		{
			PreparedStatement ps = con.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				list.add(new Users(chkNull(rs.getString("id")), chkNull(rs.getString("username")), chkNull(rs.getString("email")), 
						chkNull(rs.getString("mobile")), chkNull(rs.getString("address"))));
			}
		}catch(SQLException sqe){
			System.out.println("Error : While Inserting record in database");
			}
		try
		{
		 con.close();	
		}catch(SQLException se){
			System.out.println("Error : While Closing Connection");
			
		}
		return list;
     	}
	
	public static String chkNull(String obj) {
		return obj != null ? obj.trim() : "";
	}
}



