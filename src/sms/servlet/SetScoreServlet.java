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
 * Servlet implementation class SetScoreServlet
 */
@WebServlet("/SetScoreServlet")
public class SetScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetScoreServlet() {
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
		String score = request.getParameter("score");
		String sno = request.getParameter("sno");
		String cno = request.getParameter("cno");
		int myScore = Integer.parseInt(score);
		if(myScore > 100 || myScore < 0) {
			out.println("输入的成绩不符合要求");
			response.setHeader("refresh", "1;URL=SetScore.jsp?cno=" + cno + "&sno=" + sno);
		}
		else {
			boolean b = TeacherSql.updateScore(sno, cno, score);
			if(b) {
				out.println("录入成绩成功");
				response.setHeader("refresh", "1;URL=School_Grades_details.jsp?cno=" + cno);
			}
			else {
				out.println("录入成绩失败");
				response.setHeader("refresh", "1;URL=School_Grades_details.jsp?cno=" + cno);
			}
		}
		//out.println(sno);
		//out.println(cno);
		//out.println(score);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
