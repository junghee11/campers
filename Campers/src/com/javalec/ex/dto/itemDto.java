package com.javalec.ex.dto;

public class itemDto {
	
	private int item_idx;
	private String category;
	private String pName;
	private String pContent;
	int price;
	int sellCount;
	int pickCount;
	private String imgLink;
	
	public itemDto() {
		
	}
	
	public itemDto(int item_idx, String pName, int price, String imgLink) {
		super();
		this.item_idx = item_idx;
		this.pName = pName;
		this.price = price;
		this.imgLink = imgLink;
	}

	public itemDto(int item_idx, String category, String pName, String pContent, int price, int sellCount,
			int pickCount, String imgLink) {
		super();
		this.item_idx = item_idx;
		this.category = category;
		this.pName = pName;
		this.pContent = pContent;
		this.price = price;
		this.sellCount = sellCount;
		this.pickCount = pickCount;
		this.imgLink = imgLink;
	}
	public int getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSellCount() {
		return sellCount;
	}
	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}
	public int getPickCount() {
		return pickCount;
	}
	public void setPickCount(int pickCount) {
		this.pickCount = pickCount;
	}

	public String getImgLink() {
		return imgLink;
	}

	public void setImgLink(String imgLink) {
		this.imgLink = imgLink;
	}
	
	

}
