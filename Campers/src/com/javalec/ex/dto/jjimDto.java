package com.javalec.ex.dto;

public class jjimDto {
	
	//jjim_idx, mem_id, item_idx, jjim
	private int jjim_idx;
	private String mem_id;
	private int item_idx;
	
	public jjimDto(int jjim_idx, String mem_id, int item_idx) {
		super();
		this.jjim_idx = jjim_idx;
		this.mem_id = mem_id;
		this.item_idx = item_idx;
	}
	
	public int getJjim_idx() {
		return jjim_idx;
	}
	public void setJjim_idx(int jjim_idx) {
		this.jjim_idx = jjim_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
	}
	
	
}
