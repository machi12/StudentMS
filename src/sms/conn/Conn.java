package sms.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Conn {
	
	public static final String url = "jdbc:mysql://localhost:3306/course_pick_sys?useSSL=false&serverTimezone=GMT";
	
	public static final String name = "root";
	
	public static final String pwd = "123456789.a";
	
	public static Connection getConnection() {
		
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(url, name, pwd);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e1) {
			e1.printStackTrace();
		}
		
		return conn;

	}
	
	public static void release(Connection conn, Statement stmt) {
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			conn = null;
		}
		
		if(stmt != null) {
			try {
				stmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			stmt = null;
		}
	}
	
	public static void release(Connection conn, Statement stmt, ResultSet rs) {
		
		if(rs != null) {
			try {
				rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			rs = null;
		}
		
		release(conn, stmt);
		
	}

}

