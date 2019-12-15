package sms.bean;

public class Course {
	
	//�γ̺�
	private String cno;
	
	//�γ�����
	private String cname;
	
	//�γ�ѧ��
	private String credit;
	
	//��ʦ����
	private String teacher;
	
	//��ʦ����ѧԺ
	private String tdepartment;
	
	//�γ̳ɼ�
	private String score;
	
	//��ʦ
	private String room;
	
	//�γ̹�ģ(ѡ������)
	private String scale;
	
	//Ŀǰѡ������
	private String number;
	
	public Course(String cno, String cname, String credit, String teacher, String tdepartment) {
		this.cno = cno;
		this.cname= cname;
		this.credit = credit;
		this.teacher = teacher;
		this.tdepartment = tdepartment;
	}
	
	//Ϊ�˴ﵽ���췽���ع���Ҫ��,���Զ����һ��boolean���͵Ĳ���,��ʵ��û���õ�
	public Course(String cno, String cname, String teacher, String credit, String score, boolean b) {
		this.cno = cno;
		this.cname = cname;
		this.teacher = teacher;
		this.credit = credit;
		this.score = score;
	}
	
	//Ϊ�˴ﵽ���췽���ع���Ҫ��,���Զ����һ��int���͵Ĳ���,��ʵ����û���õ�
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
