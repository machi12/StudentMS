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
 * Servlet implementation class InsertStudentServlet
 */
@WebServlet("/InsertStudentServlet")
public class InsertStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertStudentServlet() {
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
		String sno = request.getParameter("sno");
		String sname = request.getParameter("sname");
		String sdepartment = request.getParameter("sdepartment");
		String state = request.getParameter("state");
		boolean b = AdminSql.insertStudent(sno, sname, sdepartment, state);
		if(b) {
			out.println("添加成功");
			response.setHeader("refresh", "1;URL=Manage_Students.jsp?pages=1");
		}
		else {
			out.println("添加失败");
			response.setHeader("refresh", "1;URL=Manage_Students.jsp?pages=1");
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
