package sms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sms.conn.Conn;

public class CourseNumberSql {
	
	public static Map<String, Object> query(){
		
		Connection conn = Conn.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		Map<String, Object> map = new HashMap<>();
		List<String> list1 = new ArrayList<>();
		List<Integer> list2 = new ArrayList<>();
		
		try {
			stmt = conn.createStatement();
			String sql = "select cname, count(choice.sno) from courses left join choice on courses.cno = choice.cno group by courses.cno";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list1.add(rs.getString(1));
				list2.add(rs.getInt(2));
			}
			//String[] course = (String[])list1.toArray();
			//Integer[] num = (Integer[])list2.toArray();
			String[] course = new String[list1.size()];
			int[] num = new int[list2.size()];
			int index = 0;
			for(String s:list1) {
				course[index++] = s;
			}
			index = 0;
			for(int i:list2) {
				num[index++] = i;
			}
			map.put("course", course);
			map.put("num", num);
			return map;
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			Conn.release(conn, stmt, rs);
		}
		return null;
	}

}
