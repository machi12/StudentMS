package sms.dao;

import java.io.IOException;

public class DatabaseSql {
	/**
	 * ���ݿ��û���
	 */
	public static String username = "root";
	/**
	 * ���ݿ�����
	 */
	public static String password = "123456789.a" ;
	/**
	 * mysql bin·��
	 * mysql��װ������  �ڰ�װ·���в����пո�
	 */
	public static String mysqlpaths = "C://Program Files//MySQL//MySQL Server 8.0//bin";
	/**
	 * ���ݿ�����
	 */
	public static String databaseName = "course_pick_sys";
	/**
	 * ���ݿ�url
	 */
	public static String address = "localhost";
	/**
	 * ���ݻ�ԭ·��
	 */
	public static String sqlpath = "E://DababaseBack//";
	
	//������,�����õ�
//	public static void main(String[] args) {
//			/*back("fengxin.sql");
//			load("fengxin.sql");*/
//	}
	
	/**
	 * 
	 * @Description:����Mysql���ݿ�
	 * @param fileName ���ݱ���sql�ļ���
	 * @throws 
	 * @author fengxin
	 */
	public static void back(String fileName){
		StringBuilder sb=new StringBuilder();
		sb.append("mysqldump").append(" --opt").append(" -h").append(address);
		sb.append(" --user=").append(username).append(" --password=").append(password).append(" --lock-all-tables=true");
		sb.append(" --result-file=").append(sqlpath).append(fileName).append(" --default-character-set=utf8 ").append(databaseName);
		Runtime cmd = Runtime.getRuntime();
		try {
			Process p = cmd.exec("cmd /c "+sb.toString());
			p.waitFor();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * @Description:��ԭmysql���ݿ�
	 * @param fileName ��ԭmysql����sql�ļ�����
	 * @throws 
	 * @author Administrator
	 */
	public static void load(String fileName){
		StringBuilder cmd=new StringBuilder();
		cmd.append("mysql").append(" -h ").append("localhost");
		cmd.append(" -u").append("root").append(" -p").append("root");
		cmd.append(" ").append("podms");
		cmd.append(" <").append(sqlpath).append(fileName);
		Runtime runtime=Runtime.getRuntime();
		Process process=null;
		try {
			process=runtime.exec("cmd /c "+cmd);
			process.waitFor();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
