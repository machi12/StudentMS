package sms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import sms.conn.Conn;
import sms.bean.*;

public class TeacherSql {
	
	//查询是否有该教师号密码的教师
	public static boolean isTeacher(String unumber, String pwd){
	
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			String sql = "select * from teachers where tno=" + "'" + unumber+ "'" + " and password=" + "'" + pwd + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				return true;
			}
			return false;
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt, rs);
		}
		return false;
	}
	
	//根据教师号查询教师姓名
	public static String getTName(String unumber) {
		
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			String sql = "select tname from teachers where tno = " + "'" + unumber +"'";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String tname = rs.getString("tname");
				return tname;
			}
			return null;
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt, rs);
		}
		return null;
	}
	
	//根据教师号查找自己负责的课程
	public static ArrayList<Course> getTCourses(String tno) {
		
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Course> list = new ArrayList<>();
		
		try {
			stmt = conn.createStatement();
			String sql = "select courses.cno, cname, scale, count(*) number, courses.credit, course_room from teaching, courses, choice where teaching.cno = courses.cno and teaching.choose_id = choice.choose_id and teacher = " + "'" + tno + "'";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String cno = rs.getString(1);
				String cname = rs.getString(2);
				String scale = rs.getString(3);
				String number = rs.getString(4);
				String credit = rs.getString(5);
				String room = rs.getString(6);
				if(cno == null) {
					return null;
				}
				Course course = new Course(cno, cname, scale, number, credit, room);
				list.add(course);
			}
			return list;
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt, rs);
		}
		return null;
	}
	
	//根据课程号查询选择选择该门的学生
	public static ArrayList<Student> getMyStudents(String cno){
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Student> list = new ArrayList<>();
		
		try {
			stmt = conn.createStatement();
			String sql = "select students.sno, sname, sdepartment, score from students, choice where choice.sno = students.sno and cno = " + "'" + cno + "'";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String sno = rs.getString(1);
				String sname = rs.getString(2);
				String sdepartment = rs.getString(3);
				String score = rs.getString(4);
				Student student = new Student(sno, sname, sdepartment, score);
				list.add(student);
			}
			return list;
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt, rs);
		}
		return null;
	}
	
	//根据学号查询学生信息
	public static Student getStudent(String sno){
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		//ArrayList<Student> list = new ArrayList<>();
		
		try {
			stmt = conn.createStatement();
			String sql = "select sno, sname, sdepartment from students where sno = " + "'" + sno + "'";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String snoa = rs.getString(1);
				String sname = rs.getString(2);
				String sdepartment = rs.getString(3);
				//String score = rs.getString(4);
				Student student = new Student(snoa, sname, sdepartment);
				//list.add(student);
				return student;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt, rs);
		}
		return null;
	}
	
	//向学生信息中更新成绩
	public static boolean updateScore(String sno, String cno, String score){
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		//ResultSet rs = null;
		//ArrayList<Student> list = new ArrayList<>();
		int a = 0;
		
		try {
			stmt = conn.createStatement();
			String sql = "update choice set score = " + "'" + score + "'" + " where sno = " + "'" + sno + "'" + " and cno = " + "'"+ cno + "'";
			a = stmt.executeUpdate(sql);
			if(a > 0) {
				return true;
			}
			else {
				return false;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt);
		}
		return false;
	}
	
	//更新密码
			public static boolean updatePassword(String uname, String pwd){
				Connection conn = Conn.getConnection();
				Statement stmt = null;
				//ResultSet rs = null;
				//ArrayList<Student> list = new ArrayList<>();
				int a = 0;
				
				try {
					stmt = conn.createStatement();
					String sql = "update teachers set password = " + "'" + pwd + "'" +  " where tno = " + "'" + uname + "'";
					a = stmt.executeUpdate(sql);
					if(a > 0) {
						return true;
					}
					else {
						return false;
					}
				}catch(SQLException e){ 
					e.printStackTrace();
				}finally {
					Conn.release(conn, stmt);
				}
				return false;
			}

}
