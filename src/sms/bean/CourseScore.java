package sms.bean;

public class CourseScore {
	
	private Integer value;
	
	private String name;
	
	public CourseScore(Integer value, String name) {
		this.value = value;
		this.name = name;
	}
	
	public Integer getValue() {
		return value;
	}
	
	public String getName() {
		return name;
	}
	
	public void setValue(Integer value) {
		this.value = value;
	}
	
	public void setName(String name) {
		this.name = name;
	}

}
