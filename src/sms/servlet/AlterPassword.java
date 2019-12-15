package sms.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sms.dao.*;

/**
 * Servlet implementation class AlterPassword
 */
@WebServlet("/AlterPassword")
public class AlterPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlterPassword() {
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
		String uname = request.getParameter("uname");
		String oldpw = request.getParameter("oldpw");
		String newpw = request.getParameter("newpw");
		String role = request.getParameter("role");
		if("student".equals(role)) {
			boolean b = StudentSql.isStudent(uname, oldpw);
			if(b) {
				boolean a = StudentSql.updatePassword(uname, newpw);
				if(a) {
					out.println("密码修改成功");
					response.setHeader("refresh", "1;login.html");
				}
				else {
					out.println("密码修改失败");
					response.setHeader("refresh", "1;login.html");
				}
			}
			else {
				out.println("该账号的密码错误,不能修改密码");
				response.setHeader("refresh", "1;alter.html");
			}
		}
		else if("teacher".equals(role)) {
			boolean b = TeacherSql.isTeacher(uname, oldpw);
			if(b) {
				boolean a = TeacherSql.updatePassword(uname, newpw);
				if(a) {
					out.println("密码修改成功");
					response.setHeader("refresh", "1;login.html");
				}
				else {
					out.println("密码修改失败");
					response.setHeader("refresh", "1;login.html");
				}
			}
			else {
				out.println("该账号的密码错误,不能修改密码");
				response.setHeader("refresh", "1;alter.html");
			}
		}
		else if("admin".equals(role)) {
			boolean b = AdminSql.isAdmin(uname, oldpw);
			if(b) {
				boolean a = AdminSql.updatePassword(uname, newpw);
				if(a) {
					out.println("密码修改成功");
					response.setHeader("refresh", "1;login.html");
				}
				else {
					out.println("密码修改失败");
					response.setHeader("refresh", "1;login.html");
				}
			}
			else {
				out.println("该账号的密码错误,不能修改密码");
				response.setHeader("refresh", "1;alter.html");
			}
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
