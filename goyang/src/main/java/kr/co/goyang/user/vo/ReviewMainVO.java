package kr.co.goyang.user.vo;

import java.util.Date;

public class ReviewMainVO {
	public String title,id,tourName,revDate;
	public int reviewNum;
	
	
	public ReviewMainVO() {
		super();
	}


	public ReviewMainVO(String title, String id, String tourName, int reviewNum, String revDate) {
		super();
		this.title = title;
		this.id = id;
		this.tourName = tourName;
		this.reviewNum = reviewNum;
		this.revDate = revDate;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getTourName() {
		return tourName;
	}


	public void setTourName(String tourName) {
		this.tourName = tourName;
	}


	public int getReviewNum() {
		return reviewNum;
	}


	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}


	public String getRevDate() {
		return revDate;
	}


	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}


	@Override
	public String toString() {
		return "ReviewMainVO [title=" + title + ", id=" + id + ", tourName=" + tourName + ", reviewNum=" + reviewNum
				+ ", revDate=" + revDate + "]";
	}
	
	
	
	
	
	
	
	
	
}//VO
