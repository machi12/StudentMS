package sms.bean;

public class Student {
	
	private String name;
	
	private String id;
	
	private String sdepartment;
	
	private String score;
	
	private String state;
	
	//构造方法的重构
	public Student(String name, String id) {
		this.name = name;
		this.id = id;
	}
	
	public Student(String id, String name, String sdepartment) {
		this.name = name;
		this.id = id;
		this.sdepartment = sdepartment;
	}
	
	public Student(String id, String name, String sdepartment, String score) {
		this.name = name;
		this.id = id;
		this.sdepartment = sdepartment;
		this.score = score;
	}
	
	public Student(String id, String name, String sdepartment, String state, int a) {
		this.name = name;
		this.id = id;
		this.sdepartment = sdepartment;
		this.state = state;
	}
	
	public String getName() {
		return name;
	}
	
	public String getId() {
		return id;
	}
	
	public String getSdepartment() {
		return sdepartment;
	}
	
	public String getScore() {
		return score;
	}
	
	public String getState() {
		return state;
	}

}
