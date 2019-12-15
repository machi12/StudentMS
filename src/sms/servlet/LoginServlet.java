package sms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sms.conn.Conn;
import sms.dao.AdminSql;
import sms.dao.StudentSql;
import sms.bean.Admin;
import sms.bean.Student;
import sms.bean.Teacher;
import sms.dao.TeacherSql;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String unumber = request.getParameter("usernumber");
		String pwd = request.getParameter("password");
		String shenfen = request.getParameter("shenfen");
		//out.println(unumber);
		//out.println(pwd);
		//out.println(shenfen);
		//out.print(shenfen);
		if("student".equals(shenfen)) {
			StudentSql studentSql = new StudentSql();
			boolean b = studentSql.isStudent(unumber, pwd);
			//out.print(b);
			if(b) {
				String uname = studentSql.getSName(unumber);
				Student s = new Student(uname, unumber);
				HttpSession session = request.getSession();
				session.setAttribute("student", s);
				//out.println("’˝»∑");
				response.sendRedirect("index_Student.jsp");
			}else {
				out.println("’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
				response.setHeader("refresh", "2;URL=login.html");
			}
		}
		else if("teacher".equals(shenfen)) {
			TeacherSql teacherSql = new TeacherSql();
			boolean b = teacherSql.isTeacher(unumber, pwd);
			//out.print(b);
			if(b) {
				String uname = teacherSql.getTName(unumber);
				Teacher t = new Teacher(uname, unumber);
				HttpSession session = request.getSession();
				session.setAttribute("teacher", t);
				//out.println("’˝»∑");
				response.sendRedirect("index_Teacher.jsp");
			}else {
				out.println("’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
				response.setHeader("refresh", "2;URL=login.html");
			}
		}
		else if("admin".equals(shenfen)){
			boolean b = AdminSql.isAdmin(unumber, pwd);
			if(b) {
				String uname = AdminSql.getAName(unumber);
				Admin admin = new Admin(unumber, uname);
				HttpSession session = request.getSession();
				session.setAttribute("admin", admin);
				response.sendRedirect("index_Admin.jsp");
			}
			else {
				out.println("’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
				response.setHeader("refresh", "2;URL=login.html");
			}
		}else {
			out.println("¥ÌŒÛ");
			response.setHeader("refresh", "2;URL=login.html");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
