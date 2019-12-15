package sms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sms.bean.CourseScore;
import sms.conn.Conn;

public class ScoreAnalyseSql {
	
	//课程名+成绩的键值对
	public static List<CourseScore> query(String sid){
		
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<CourseScore> list = new ArrayList<>();
		//Map<String, Integer> map = new HashMap<>();
		//List<String> list1 = new ArrayList<>();
		//List<Integer> list2 = new ArrayList<>();
		
		try {
			stmt = conn.createStatement();
			String sql = "select cname, score from courses, choice where courses.cno = choice.cno and score is not null and sno = " + "'" + sid + "'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				CourseScore cs = new CourseScore(rs.getInt(2), rs.getString(1));
				list.add(cs);
			}
			return list;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt, rs);
		}
		return null;
		
	}

}
