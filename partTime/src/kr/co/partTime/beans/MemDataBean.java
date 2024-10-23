package kr.co.partTime.beans;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.context.annotation.RequestScope;

@ComponentScan("kr.co.partTime.beans")
@RequestScope
public class MemDataBean {

	private String id;
	private String name;
	private String pw;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	

	
}
