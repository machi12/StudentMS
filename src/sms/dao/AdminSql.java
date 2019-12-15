package sms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import sms.bean.Student;
import sms.conn.Conn;
import sms.bean.Teacher;

public class AdminSql {
	
	//查询是否有该管理员密码的管理员
		public static boolean isAdmin(String unumber, String pwd){
		
			Connection conn = Conn.getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				stmt = conn.createStatement();
				String sql = "select * from admin where ano = " + "'" + unumber + "'" + " and password = " + "'" + pwd + "'";
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
		
		//根据管理员号查询管理员姓名
		public static String getAName(String unumber) {
			
			Connection conn = Conn.getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				stmt = conn.createStatement();
				String sql = "select aname from admin where ano = " + "'" + unumber + "'";
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					String tname = rs.getString(1);
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
		
		//查询所有学生
		public static ArrayList<Student> getAllStudents(){
			
			Connection conn = Conn.getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			ArrayList<Student> list = new ArrayList<>();
			
			try {
				stmt = conn.createStatement();
				String sql = "select sno, sname, sdepartment, state from students";
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					String sno = rs.getString(1);
					String sname = rs.getString(2);
					String sdepartment = rs.getString(3);
					String state = rs.getString(4);
					Student student = new Student(sno, sname, sdepartment, state, 1);
					list.add(student);
				}
				return list;
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				Conn.release(conn, stmt, rs);
			}
			return null;
		}
	
		//根据学号查询学生信息
		public static Student getThisStudent(String sno){
			
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
					//String state = rs.getString(4);
					Student student = new Student(snoa, sname, sdepartment);
					return student;
					//list.add(student);
				}
				//return list;
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				Conn.release(conn, stmt, rs);
			}
			return null;
		}
		
		//更新学生状态
		public static boolean updateStudent(String sno, String state){
			Connection conn = Conn.getConnection();
			Statement stmt = null;
			int a = 0;
			
			try {
				stmt = conn.createStatement();
				String sql = "update students set state = " + "'" + state + "'"  + " where sno = " + "'" + sno + "'";
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
		
		//添加一名学生信息
		public static boolean insertStudent(String sno, String sname, String sdepartment, String state){
			Connection conn = Conn.getConnection();
			Statement stmt = null;
			int a = 0;
			
			try {
				stmt = conn.createStatement();
				String sql = "insert into students(sno, sname, sdepartment, state) values (" + "'" + sno + "'" + "," + " '" + sname + "'" + "," + " '" + sdepartment + "'" + "," + " '" + state + "'" + ")";
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
		
		//根据学号删除一个学生的信息
		public static boolean removeStudent(String sno){
			Connection conn = Conn.getConnection();
			Statement stmt = null;
			int a = 0;
			
			try {
				stmt = conn.createStatement();
				String sql = "delete from students where sno = " + "'" + sno + "'";
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
		
		//返回学生信息的总行数
		public static int countStudents() {
			Connection conn = Conn.getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			int a = 0;
			
			try {
				stmt = conn.createStatement();
				String sql = "select * from students";
				rs = stmt.executeQuery(sql);
				//通过下面两条语句获取数据的总行数
				rs.last();
				a = rs.getRow();
				return a;
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				Conn.release(conn, stmt, rs);
			}
			return 0;
		}
		
		//返回指定位置的学生信息,用于对数据库进行伪分页
		public static ArrayList<Student> getStudents(int startLine, int pageSize){
			Connection conn = Conn.getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			ArrayList<Student> list = new ArrayList<>();
			
			try {
				stmt = conn.createStatement();
				String sql = "select sno, sname, sdepartment, state from students limit " + startLine + "," + pageSize;
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					String sno = rs.getString(1);
					String sname = rs.getString(2);
					String sdepartment = rs.getString(3);
					String state = rs.getString(4);
					Student student = new Student(sno, sname, sdepartment, state, 1);
					list.add(student);
				}
				return list;
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				Conn.release(conn, stmt, rs);
			}
			return null;
		}
		
		//根据姓名查询学生信息
		public static Student getStudentByName(String sname) {
			Connection conn = Conn.getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				stmt = conn.createStatement();
				String sql = "select sno, sname, sdepartment, state from students where sname = " + "'" + sname + "'";
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					String sno = rs.getString(1);
					String snameo = rs.getString(2);
					String sdepartment = rs.getString(3);
					String state = rs.getString(4);
					Student student = new Student(sno, snameo, sdepartment, state, 1);
					return student;
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				Conn.release(conn, stmt, rs);
			}
			return null;
		}
		
		//根据姓名查询学生信息
				public static Student getStudentBySno(String sno) {
					Connection conn = Conn.getConnection();
					Statement stmt = null;
					ResultSet rs = null;
					
					try {
						stmt = conn.createStatement();
						String sql = "select sno, sname, sdepartment, state from students where sno = " + "'" + sno + "'";
						rs = stmt.executeQuery(sql);
						
						while(rs.next()) {
							String snoa = rs.getString(1);
							String sname = rs.getString(2);
							String sdepartment = rs.getString(3);
							String state = rs.getString(4);
							Student student = new Student(snoa, sname, sdepartment, state, 1);
							return student;
						}
					}catch(SQLException e) {
						e.printStackTrace();
					}finally {
						Conn.release(conn, stmt, rs);
					}
					return null;
				}
				
			//查询所有教师
				public static ArrayList<Teacher> getAllTeachers(){
					
					Connection conn = Conn.getConnection();
					Statement stmt = null;
					ResultSet rs = null;
					ArrayList<Teacher> list = new ArrayList<>();
					
					try {
						stmt = conn.createStatement();
						String sql = "select tno, tname, title, tdepartment from teachers";
						rs = stmt.executeQuery(sql);
						
						while(rs.next()) {
							String tno = rs.getString(1);
							String tname = rs.getString(2);
							String title = rs.getString(3);
							String tdepartment = rs.getString(4);
							Teacher teacher = new Teacher(tno, tname, title, tdepartment);
							list.add(teacher);
						}
						return list;
					}catch(SQLException e) {
						e.printStackTrace();
					}finally {
						Conn.release(conn, stmt, rs);
					}
					return null;
				}
				
				//根据教师号删除一个教师的信息
				public static boolean removeTeacher(String tno){
					Connection conn = Conn.getConnection();
					Statement stmt = null;
					int a = 0;
					
					try {
						stmt = conn.createStatement();
						String sql = "delete from teachers where tno = " + "'" + tno + "'";
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
						String sql = "update admin set password = " + "'" + pwd + "'" +  " where ano = " + "'" + uname + "'";
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
