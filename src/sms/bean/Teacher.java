package sms.bean;

public class Teacher {
	
	private String name;
	
	private String id;
	
	private String title;
	
	private String tdepartment;
	
	public Teacher(String name, String id) {
		this.name = name;
		this.id = id;
	}
	
	public Teacher(String id, String name, String title, String tdepartment) {
		this.id = id;
		this.name = name;
		this.title = title;
		this.tdepartment = tdepartment;
	}
	
	public String getName() {
		return name;
	}
	
	public String getId() {
		return id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getTdepartment() {
		return tdepartment;
	}

}
