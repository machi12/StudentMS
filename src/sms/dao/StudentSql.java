package sms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import sms.conn.Conn;
import sms.bean.Course;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentSql {
	
	//��ѯ�Ƿ��и�ѧ�������ѧ��
	public static boolean isStudent(String unumber, String pwd){
	
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			String sql = "select * from students where sno=" + "'" + unumber+ "'" + " and password=" + "'" + pwd + "'";
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
	
	//����ѧ����ѧ�Ų�ѯѧ������
	public static String getSName(String unumber) {
		
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			String sql = "select sname from students where sno = " + "'" + unumber +"'";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String sname = rs.getString("sname");
				return sname;
			}
			return null;
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt, rs);
		}
		return null;
	}
	
	//����ѧ��id��ѯѡ��Ŀγ�
	public static ArrayList<Course> getSCourse(String id) {
			
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Course> list = new ArrayList<>();
			
		try {
			stmt = conn.createStatement();
			String sql = "select courses.cno, cname, credit, tname, tdepartment from courses, choice, teaching, teachers where courses.cno = choice.cno and teaching.choose_id = choice.choose_id and teaching.teacher = teachers.tno and choice.sno =" + "'" + id + "'";
			rs = stmt.executeQuery(sql);
			//int index = 0;
			while(rs.next()) {
				String cno = rs.getString(1);
				String cname = rs.getString(2);
				String credit = rs.getString(3);
				String tname = rs.getString(4);
				String tdeparment = rs.getString(5);
				Course myCourse = new Course(cno, cname, credit, tname, tdeparment);
				list.add(myCourse);
				//courses[index][0] = rs.getString(1);
				//courses[index][1] = rs.getString(2);
				//courses[index][2] = rs.getString(3);
				//index++;
			}
			return list;
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt, rs);
		}
		return list;
	}
	
	//ѧ�����˿β���
	public static boolean removeCourse(String sno, String cno) {
			
		Connection conn = Conn.getConnection();
		Statement stmt = null;
			
		try {
			stmt = conn.createStatement();
			String sql = "delete from choice where sno = " + "'" + sno + "'" + 
					" and cno = " + "'" + cno + "'";
			int line = stmt.executeUpdate(sql);
			if(line > 0) {
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
	
	//����ѧ�Ų�ѯδѡ�Ŀγ�
	public static ArrayList<Course> getCourses(String sno) {
			
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList<Course> list = new ArrayList<>();
		
		try {
			stmt = conn.createStatement();
			//ע��+�ŷָ���λ��
			String sql = "select courses.cno, cname, credit, tname, tdepartment from courses, teaching, teachers where courses.cno = teaching.cno and teaching.teacher = teachers.tno and courses.cno not in (select choice.cno from choice where choice.sno = " + "'" + sno + "'" + ")";	
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String cno = rs.getString(1);
				String cname = rs.getString(2);
				String credit = rs.getString(3);
				String tname = rs.getString(4);
				String tdeparment = rs.getString(5);
				Course myCourse = new Course(cno, cname, credit, tname, tdeparment);
				list.add(myCourse);
			}
			return list;
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt, rs);
		}
		return list;
	}
	
	//����ѧ��id��ѯѡ��Ŀγ�
	public static String getChoose_id(String cno) {
				
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		//String[] s = new String[2];
				
		try {
			stmt = conn.createStatement();
			String sql = "select choose_id from teaching where cno = " + "'" + cno + "'";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String choose_id = rs.getString(1);
				return choose_id;
			}
			return null;
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt, rs);
		}
		return null;
	}
	
	//ѡ��,��ѡ�α��в�������
	public static boolean insertChoose(String sno, String choose_id, String cno) {
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		
		try {
			stmt = conn.createStatement();
			String sql = "insert into choice values(" + "'" + sno + "'" + "," + "'" + choose_id + "'" + "," + "'" + cno + "'" + "," + "null" + ")";
			int line = stmt.executeUpdate(sql);
			if(line > 0) {
				return true;
			}
			else {
				return false;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt);
		}
		return false;
	}
	
	//ѧ����ѯ�ɼ�
	public static ArrayList<Course> selectGrade(String sno) {
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Course> list = new ArrayList<>();
		
		try {
			stmt = conn.createStatement();
			String sql = "select choice.cno, cname, tname, credit, score from choice, courses, teaching, teachers where choice.cno = courses.cno and choice.choose_id = teaching.choose_id and teaching.teacher = teachers.tno and sno = " + "'" + sno + "'";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String cno = rs.getString(1);
				String cname = rs.getString(2);
				String tname = rs.getString(3);
				String credit = rs.getString(4);
				String score = rs.getString(5);
				Course course = new Course(cno, cname, tname, credit, score, true);
				list.add(course);
			}
			return list;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt);
		}
		return null;
	}
	
	//��������
		public static boolean updatePassword(String uname, String pwd){
			Connection conn = Conn.getConnection();
			Statement stmt = null;
			//ResultSet rs = null;
			//ArrayList<Student> list = new ArrayList<>();
			int a = 0;
			
			try {
				stmt = conn.createStatement();
				String sql = "update students set password = " + "'" + pwd + "'" +  " where sno = " + "'" + uname + "'";
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
		
		//ѡ����
		public static int courseNumber(String sid) {
			Connection conn = Conn.getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			//int[] array = new int[4];
					
			try { 
					stmt = conn.createStatement();
					String sql = "select count(*) from choice where sno = " + "'" + sid + "'";
					rs = stmt.executeQuery(sql);
					while(rs.next()) {
						int a = rs.getInt(1);
						return a;
					}
					return 0;
			}catch(SQLException e){ 
				e.printStackTrace();
			}finally {
				Conn.release(conn, stmt, rs);
			}
			return 0;
		}
		
		//�γ��ܷ�
		public static int totalGrade(String sid) {
			Connection conn = Conn.getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			//int[] array = new int[4];
					
			try { 
					stmt = conn.createStatement();
					String sql = "select sum(score) from choice where sno = " + "'" + sid + "'";
					rs = stmt.executeQuery(sql);
					while(rs.next()) {
						int a = rs.getInt(1);
						return a;
					}
					return 0;
			}catch(SQLException e){ 
				e.printStackTrace();
			}finally {
				Conn.release(conn, stmt, rs);
			}
			return 0;
		}
		
		//��ѧ��
				public static int creditNumber(String sid) {
					Connection conn = Conn.getConnection();
					Statement stmt = null;
					ResultSet rs = null;
					//int[] array = new int[4];
							
					try { 
							stmt = conn.createStatement();
							String sql = "select sum(credit) from courses, choice where courses.cno = choice.cno and choice.sno = " + "'" + sid +"'";
							rs = stmt.executeQuery(sql);
							while(rs.next()) {
								int a = rs.getInt(1);
								return a;
							}
							return 0;
					}catch(SQLException e){ 
						e.printStackTrace();
					}finally {
						Conn.release(conn, stmt, rs);
					}
					return 0;
				}
				
				//�гɼ��Ŀγ�����
				public static int notNullCourseNumber(String sid) {
					Connection conn = Conn.getConnection();
					Statement stmt = null;
					ResultSet rs = null;
					//int[] array = new int[4];
							
					try { 
							stmt = conn.createStatement();
							String sql = "select count(*) from choice where score is not null and sno = " + "'" + sid + "'";
							rs = stmt.executeQuery(sql);
							while(rs.next()) {
								int a = rs.getInt(1);
								return a;
							}
							return 0;
					}catch(SQLException e){ 
						e.printStackTrace();
					}finally {
						Conn.release(conn, stmt, rs);
					}
					return 0;
				}
				
				//���ÿ�Ƶĳɼ��Լ�ѧ�ֵļ�ֵ��
				public static List<int[]> getCS(String sid){
					Connection conn = Conn.getConnection();
					Statement stmt = null;
					ResultSet rs = null;
					//Map<Integer, Integer> cs = new HashMap<>();
					List<int[]> list = new ArrayList<>();
					int[] a = new int[2];
					
					try {
						stmt = conn.createStatement();
						String sql = "select credit, score from courses, choice where courses.cno = choice.cno and score is not null and sno = " + "'" + sid + "'";
						rs = stmt.executeQuery(sql);
						
						while(rs.next()) {
							a[0] = rs.getInt(1);
							a[1] = rs.getInt(2);
							list.add(a);
						}
						return list;
						
					}catch(SQLException e) {
						e.printStackTrace();
					}finally {
						Conn.release(conn, stmt, rs);
					}
					return null;
				}
				
				//�гɼ�����ѧ��
				public static int notNullCreditNumber(String sid) {
					Connection conn = Conn.getConnection();
					Statement stmt = null;
					ResultSet rs = null;
					//int[] array = new int[4];
							
					try { 
							stmt = conn.createStatement();
							String sql = "select sum(credit) from courses, choice where courses.cno = choice.cno and score is not null and sno = " + "'" + sid + "'";
							rs = stmt.executeQuery(sql);
							while(rs.next()) {
								int a = rs.getInt(1);
								return a;
							}
							return 0;
					}catch(SQLException e){ 
						e.printStackTrace();
					}finally {
						Conn.release(conn, stmt, rs);
					}
					return 0;
				}
				
}
