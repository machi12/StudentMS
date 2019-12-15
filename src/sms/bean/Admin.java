package sms.bean;

public class Admin {
	
	private String aname;
	
	private String ano;
	
	public Admin(String ano, String aname) {
		this.ano = ano;
		this.aname = aname;
	}
	
	public String getAno() {
		return ano;
	}
	
	public String getAname() {
		return aname;
	}

}
