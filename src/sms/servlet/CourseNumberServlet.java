package sms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import sms.bean.*;
import sms.dao.*;


/**
 * Servlet implementation class CourseNumberServlet
 */
@WebServlet("/CourseNumberServlet")
public class CourseNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseNumberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("null")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		Map<String, Object> map = new HashMap<>();
		map = CourseNumberSql.query();
		
//		String[] course = {"1","2","3","4","5","6"};
//		Integer[] num = {10,100,20,56,35,80};
//		Map<String, Object> map = new HashMap<>();
//		map.put("course", course);
//		map.put("num", num);
		
//		ArrayList<CourseNumber> list= CourseNumberSql.getCourseNumber();  //调用BarDao的query方法。返回一个从数据库中读取之后的集合
//		String[] course = null;
//		int[] num = null;
//		for(int i = 0; i < list.size(); i++) {
//			course[i] = list.get(i).getCourse();
//			num[i] = list.get(i).getNum();
//		}
//		Map<String, Object> map = new HashMap<>();
//		map.put("course", course);
//		map.put("num", num);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(JSON.toJSONString(map));
		
		//response.getWriter().println(JSON.toJSONString(map));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
