package kr.co.goyang.manager.vo;

import java.util.Date;

public class ReviewManagerVO {
	private int tourNum, commendNum, reviewNum, outFlag;
	private String  tourName, title, reviewImg, comContent, revContent,id, outReas,
	ListSearch,textSearch;
	private Date comWriteDate, revWriteDate;
	
	public ReviewManagerVO() {
		
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

	public int getOutFlag() {
		return outFlag;
	}

	public void setOutFlag(int outFlag) {
		this.outFlag = outFlag;
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

	public String getOutReas() {
		return outReas;
	}

	public void setOutReas(String outReas) {
		this.outReas = outReas;
	}

	public String getListSearch() {
		return ListSearch;
	}

	public void setListSearch(String listSearch) {
		ListSearch = listSearch;
	}

	public String getTextSearch() {
		return textSearch;
	}

	public void setTextSearch(String textSearch) {
		this.textSearch = textSearch;
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

	public ReviewManagerVO(int tourNum, int commendNum, int reviewNum, int outFlag, String tourName, String title,
			String reviewImg, String comContent, String revContent, String id, String outReas, String listSearch,
			String textSearch, Date comWriteDate, Date revWriteDate) {
		super();
		this.tourNum = tourNum;
		this.commendNum = commendNum;
		this.reviewNum = reviewNum;
		this.outFlag = outFlag;
		this.tourName = tourName;
		this.title = title;
		this.reviewImg = reviewImg;
		this.comContent = comContent;
		this.revContent = revContent;
		this.id = id;
		this.outReas = outReas;
		ListSearch = listSearch;
		this.textSearch = textSearch;
		this.comWriteDate = comWriteDate;
		this.revWriteDate = revWriteDate;
	}

	@Override
	public String toString() {
		return "ReviewManagerVO [tourNum=" + tourNum + ", commendNum=" + commendNum + ", reviewNum=" + reviewNum
				+ ", outFlag=" + outFlag + ", tourName=" + tourName + ", title=" + title + ", reviewImg=" + reviewImg
				+ ", comContent=" + comContent + ", revContent=" + revContent + ", id=" + id + ", outReas=" + outReas
				+ ", ListSearch=" + ListSearch + ", textSearch=" + textSearch + ", comWriteDate=" + comWriteDate
				+ ", revWriteDate=" + revWriteDate + "]";
	}
	
	
}//VO
