package sms.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sms.dao.*;
import sms.bean.*;

/**
 * Servlet implementation class ChoiceCourseServlet
 */
@WebServlet("/ChoiceCourseServlet")
public class ChoiceCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChoiceCourseServlet() {
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
		String cno = request.getParameter("cno");
		//out.println(cno);
		String choose_id = StudentSql.getChoose_id(cno);
		if(choose_id == null) {
			out.println("选课失败");
			response.setHeader("refresh", "2;URL=login.html");
		}
		else {
			HttpSession session = request.getSession();
			Student s = (Student) session.getAttribute("student");
			String sno = s.getId();
			boolean b = StudentSql.insertChoose(sno, choose_id, cno);
			if(b == true) {
				out.println("选课成功");
				response.setHeader("refresh", "2;URL=ChoiceCourse.jsp");
			}
			else {
				out.println("选课失败");
				response.setHeader("refresh", "2;URL=ChoiceCourse.jsp");
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
