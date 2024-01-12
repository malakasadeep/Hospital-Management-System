package com.hms.user;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static String url = "jdbc:mysql://localhost:3306/hms";
	private static String un = "root";
	private static String pw = "sql123";
	private static Connection con;
	
	public static Connection getconnection() {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, un, pw);
			
		} catch (Exception e) {
			
			System.out.println("Connection faild!!");
		}
		
		return con;
	}

}
