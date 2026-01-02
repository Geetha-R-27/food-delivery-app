package com.DBconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBconnection {

	private static final String URL = "jdbc:mysql://localhost:3306/foodapp";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "root";

	 public static  Connection  getConnection(){
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
		
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
		
	}
}
