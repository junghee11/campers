package com.javalec.ex.dto;

import java.sql.Timestamp;

public class reviewDto {
	
	private int review_idx;
	private String rName;
	private String rTitle;
	private String rContent;
	Timestamp rDate;
	int rHit;
	int rGroup;
	int rStep;
	int rIndent;
	
	public reviewDto() {}
	
	public reviewDto(int review_idx, String rName, String rTitle, String rContent, Timestamp rDate, int rHit, int rGroup,
			int rStep, int rIndent) {
		super();
		this.review_idx = review_idx;
		this.rName = rName;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rDate = rDate;
		this.rHit = rHit;
		this.rGroup = rGroup;
		this.rStep = rStep;
		this.rIndent = rIndent;
	}
	
	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getrTitle() {
		return rTitle;
	}
	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public Timestamp getrDate() {
		return rDate;
	}
	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}
	public int getrHit() {
		return rHit;
	}
	public void setrHit(int rHit) {
		this.rHit = rHit;
	}
	public int getrGroup() {
		return rGroup;
	}
	public void setrGroup(int rGroup) {
		this.rGroup = rGroup;
	}
	public int getrStep() {
		return rStep;
	}
	public void setrStep(int rStep) {
		this.rStep = rStep;
	}
	public int getrIndent() {
		return rIndent;
	}
	public void setrIndent(int rIndent) {
		this.rIndent = rIndent;
	}
	
	

}
