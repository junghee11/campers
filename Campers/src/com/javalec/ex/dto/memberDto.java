package com.javalec.ex.dto;

import java.sql.Timestamp;

public class memberDto {
	
	private String id;
	private String pw;
	private String name;
	private String addr;
	private String phone;
	Timestamp date;
	
	public memberDto() {}
	
	public memberDto(String id, String name, String addr, String phone, Timestamp date) {
		super();
		this.id = id;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.date = date;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public void setDate(Timestamp date) {
		this.date = date;
	}

	public Timestamp getDate() {
		return date;
	}	
	
}
