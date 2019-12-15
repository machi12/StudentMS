package sms.bean;

public class Course {
	
	//课程号
	private String cno;
	
	//课程名称
	private String cname;
	
	//课程学分
	private String credit;
	
	//教师名称
	private String teacher;
	
	//教师所在学院
	private String tdepartment;
	
	//课程成绩
	private String score;
	
	//教师
	private String room;
	
	//课程规模(选课上限)
	private String scale;
	
	//目前选课人数
	private String number;
	
	public Course(String cno, String cname, String credit, String teacher, String tdepartment) {
		this.cno = cno;
		this.cname= cname;
		this.credit = credit;
		this.teacher = teacher;
		this.tdepartment = tdepartment;
	}
	
	//为了达到构造方法重构的要求,所以多加了一个boolean类型的参数,但实际没有用到
	public Course(String cno, String cname, String teacher, String credit, String score, boolean b) {
		this.cno = cno;
		this.cname = cname;
		this.teacher = teacher;
		this.credit = credit;
		this.score = score;
	}
	
	//为了达到构造方法重构的要求,所以多加了一个int类型的参数,但实际上没有用到
	public Course(String cno, String cname, String scale, String number, String credit, String room) {
		this.cno = cno;
		this.cname = cname;
		this.scale = scale;
		this.number = number;
		this.credit = credit;
		this.room = room;
	}
	
	public String getCno() {
		return cno;
	}
	
	public String getCname() {
		return cname;
	}
	
	public String getCredit() {
		return credit;
	}
	
	public String getTeacher() {
		return teacher;
	}
	
	public String getTdepartment() {
		return tdepartment;
	}
	
	public String getScore() {
		return score;
	}
	
	public String getRoom() {
		return room;
	}
	
	public String getScale() {
		return scale;
	}
	
	public String getNumber() {
		return number;
	}

}
