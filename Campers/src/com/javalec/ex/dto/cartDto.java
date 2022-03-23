package com.javalec.ex.dto;

public class cartDto {
	private int cart_idx;
	private String mem_id;
	private int item_idx;
	private String pName;
	private int amount;
	private int price;
	private String imgLink;
	

	public cartDto(int item_idx, String pName, int amount, int price, String imgLink) {
		super();
		this.item_idx = item_idx;
		this.pName = pName;
		this.amount = amount;
		this.price = price;
		this.imgLink = imgLink;
	}
	
	public cartDto(int cart_idx, String mem_id, int item_idx, int amount) {
		super();
		this.cart_idx = cart_idx;
		this.mem_id = mem_id;
		this.item_idx = item_idx;
		this.amount = amount;
	}
	public int getCart_idx() {
		return cart_idx;
	}
	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
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
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImgLink() {
		return imgLink;
	}
	public void setImgLink(String imgLink) {
		this.imgLink = imgLink;
	}
	
	
}
