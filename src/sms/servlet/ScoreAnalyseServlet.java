package sms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.ArrayList;

import com.alibaba.fastjson.JSON;

import sms.dao.ScoreAnalyseSql;
import sms.bean.CourseScore;

/**
 * Servlet implementation class ScoreAnalyseServlet
 */
@WebServlet("/ScoreAnalyseServlet")
public class ScoreAnalyseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScoreAnalyseServlet() {
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
		
		String sid = request.getParameter("sid");
		//System.out.println(sid);
		//Map<String, Integer> map = new HashMap<>();
		//map = ScoreAnalyseSql.query(sid);
		List<CourseScore> list = new ArrayList<>();
		list = ScoreAnalyseSql.query(sid);
		
		System.out.println(list);
		
		out.println(JSON.toJSONString(list));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
