package kr.co.goyang.user.vo;

import java.sql.Date;

public class TourReviewVO {
	private int tourNum, commendNum, reviewNum;
	private String tourName, title, reviewImg, comContent, revContent, id, listSearch, textSearch, comDelFlag;
	private Date comWriteDate, revWriteDate;

	public TourReviewVO() {

	}

	public TourReviewVO(int tourNum, int commendNum, int reviewNum, String tourName, String title, String reviewImg,
			String comContent, String revContent, String id, String listSearch, String textSearch, String comDelFlag,
			Date comWriteDate, Date revWriteDate) {
		super();
		this.tourNum = tourNum;
		this.commendNum = commendNum;
		this.reviewNum = reviewNum;
		this.tourName = tourName;
		this.title = title;
		this.reviewImg = reviewImg;
		this.comContent = comContent;
		this.revContent = revContent;
		this.id = id;
		this.listSearch = listSearch;
		this.textSearch = textSearch;
		this.comDelFlag = comDelFlag;
		this.comWriteDate = comWriteDate;
		this.revWriteDate = revWriteDate;
	}

	public int getTourNum() {
		return tourNum;
	}

	public void setTourNum(int tourNum) {
		this.tourNum = tourNum;
	}

	public int getCommendNum() {
		return commendNum;
	}

	public void setCommendNum(int commendNum) {
		this.commendNum = commendNum;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getReviewImg() {
		return reviewImg;
	}

	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}

	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getListSearch() {
		return listSearch;
	}

	public void setListSearch(String listSearch) {
		this.listSearch = listSearch;
	}

	public String getTextSearch() {
		return textSearch;
	}

	public void setTextSearch(String textSearch) {
		this.textSearch = textSearch;
	}

	public String getComDelFlag() {
		return comDelFlag;
	}

	public void setComDelFlag(String comDelFlag) {
		this.comDelFlag = comDelFlag;
	}

	public Date getComWriteDate() {
		return comWriteDate;
	}

	public void setComWriteDate(Date comWriteDate) {
		this.comWriteDate = comWriteDate;
	}

	public Date getRevWriteDate() {
		return revWriteDate;
	}

	public void setRevWriteDate(Date revWriteDate) {
		this.revWriteDate = revWriteDate;
	}

	@Override
	public String toString() {
		return "TourReviewVO [tourNum=" + tourNum + ", commendNum=" + commendNum + ", reviewNum=" + reviewNum
				+ ", tourName=" + tourName + ", title=" + title + ", reviewImg=" + reviewImg + ", comContent="
				+ comContent + ", revContent=" + revContent + ", id=" + id + ", listSearch=" + listSearch
				+ ", textSearch=" + textSearch + ", comDelFlag=" + comDelFlag + ", comWriteDate=" + comWriteDate
				+ ", revWriteDate=" + revWriteDate + "]";
	}

}// class
