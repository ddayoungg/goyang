package kr.co.goyang.manager.vo;

import java.util.Date;

public class TourDashBoardVO {
	private int tourNum, tourOrder, reviewNum;
	private String id, tourName;
	private Date joinDate, outDate=new Date();
	
	public TourDashBoardVO() {
		// TODO Auto-generated constructor stub
	}

	public TourDashBoardVO(int tourNum, int tourOrder, int reviewNum, String id, String tourName, Date joinDate,
			Date outDate) {
		super();
		this.tourNum = tourNum;
		this.tourOrder = tourOrder;
		this.reviewNum = reviewNum;
		this.id = id;
		this.tourName = tourName;
		this.joinDate = joinDate;
		this.outDate = outDate;
	}

	public int getTourNum() {
		return tourNum;
	}

	public void setTourNum(int tourNum) {
		this.tourNum = tourNum;
	}

	public int getTourOrder() {
		return tourOrder;
	}

	public void setTourOrder(int tourOrder) {
		this.tourOrder = tourOrder;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
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

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getOutDate() {
		return outDate;
	}

	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}

	@Override
	public String toString() {
		return "ManagerTourDachBoard [tourNum=" + tourNum + ", tourOrder=" + tourOrder + ", reviewNum=" + reviewNum
				+ ", id=" + id + ", tourName=" + tourName + ", joinDate=" + joinDate + ", outDate=" + outDate + "]";
	}
	
}
