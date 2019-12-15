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
	
	//��ѯ�Ƿ��иù���Ա����Ĺ���Ա
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
		
		//���ݹ���Ա�Ų�ѯ����Ա����
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
		
		//��ѯ����ѧ��
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
	
		//����ѧ�Ų�ѯѧ����Ϣ
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
		
		//����ѧ��״̬
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
		
		//���һ��ѧ����Ϣ
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
		
		//����ѧ��ɾ��һ��ѧ������Ϣ
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
		
		//����ѧ����Ϣ��������
		public static int countStudents() {
			Connection conn = Conn.getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			int a = 0;
			
			try {
				stmt = conn.createStatement();
				String sql = "select * from students";
				rs = stmt.executeQuery(sql);
				//ͨ��������������ȡ���ݵ�������
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
		
		//����ָ��λ�õ�ѧ����Ϣ,���ڶ����ݿ����α��ҳ
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
		
		//����������ѯѧ����Ϣ
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
		
		//����������ѯѧ����Ϣ
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
				
			//��ѯ���н�ʦ
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
				
				//���ݽ�ʦ��ɾ��һ����ʦ����Ϣ
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
				
				//��������
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
