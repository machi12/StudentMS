package sms.bean;

public class CourseNumber {
	
	private String course;
	
	private int num;
	
	public CourseNumber(String course, int num) {
		this.course = course;
		this.num = num;
	}
	
	public String getCourse(){
		return course;
	}
	
	public int getNum() {
		return num;
	}
	
}
