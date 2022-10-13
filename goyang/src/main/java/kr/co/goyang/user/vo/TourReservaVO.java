package kr.co.goyang.user.vo;

import java.util.Arrays;
import java.sql.Date;

public class TourReservaVO {

	private int tourNum, adultFee, otherFee, tourOrder, adultCnt, otherCnt, reserNum, totalSeatCnt, runFlag; 
	private int[] seatNum, seatNumIn;
	private String id, name, tourName, explain, thumImg, cosContent, startHour, endHour, reserDate;
	private Date reserRegist;
	
	public TourReservaVO() {
		super();
	}//TourReservaVO

	

	public TourReservaVO(int tourNum, int adultFee, int otherFee, int tourOrder, int adultCnt, int otherCnt,
			int reserNum, int totalSeatCnt, int runFlag, int[] seatNum, int[] seatNumIn, String id, String name, String tourName,
			String explain, String thumImg, String cosContent, String startHour, String endHour, String reserDate,
			Date reserRegist) {
		super();
		this.tourNum = tourNum;
		this.adultFee = adultFee;
		this.otherFee = otherFee;
		this.tourOrder = tourOrder;
		this.adultCnt = adultCnt;
		this.otherCnt = otherCnt;
		this.reserNum = reserNum;
		this.totalSeatCnt = totalSeatCnt;
		this.runFlag = runFlag;
		this.seatNum = seatNum;
		this.seatNumIn = seatNumIn;
		this.id = id;
		this.name = name;
		this.tourName = tourName;
		this.explain = explain;
		this.thumImg = thumImg;
		this.cosContent = cosContent;
		this.startHour = startHour;
		this.endHour = endHour;
		this.reserDate = reserDate;
		this.reserRegist = reserRegist;
	}



	public int getTourNum() {
		return tourNum;
	}



	public void setTourNum(int tourNum) {
		this.tourNum = tourNum;
	}



	public int getAdultFee() {
		return adultFee;
	}



	public void setAdultFee(int adultFee) {
		this.adultFee = adultFee;
	}



	public int getOtherFee() {
		return otherFee;
	}



	public void setOtherFee(int otherFee) {
		this.otherFee = otherFee;
	}



	public int getTourOrder() {
		return tourOrder;
	}



	public void setTourOrder(int tourOrder) {
		this.tourOrder = tourOrder;
	}



	public int getAdultCnt() {
		return adultCnt;
	}



	public void setAdultCnt(int adultCnt) {
		this.adultCnt = adultCnt;
	}



	public int getOtherCnt() {
		return otherCnt;
	}



	public void setOtherCnt(int otherCnt) {
		this.otherCnt = otherCnt;
	}



	public int getReserNum() {
		return reserNum;
	}



	public void setReserNum(int reserNum) {
		this.reserNum = reserNum;
	}



	public int getTotalSeatCnt() {
		return totalSeatCnt;
	}



	public void setTotalSeatCnt(int totalSeatCnt) {
		this.totalSeatCnt = totalSeatCnt;
	}



	public int getRunFlag() {
		return runFlag;
	}



	public void setRunFlag(int runFlag) {
		this.runFlag = runFlag;
	}



	public int[] getSeatNum() {
		return seatNum;
	}



	public void setSeatNum(int[] seatNum) {
		this.seatNum = seatNum;
	}
	
	public int[] getSeatNumIn() {
		return seatNumIn;
	}

	public void setSeatNumIn(int[] seatNumIn) {
		this.seatNumIn = seatNumIn;
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



	public String getTourName() {
		return tourName;
	}



	public void setTourName(String tourName) {
		this.tourName = tourName;
	}



	public String getExplain() {
		return explain;
	}



	public void setExplain(String explain) {
		this.explain = explain;
	}



	public String getThumImg() {
		return thumImg;
	}



	public void setThumImg(String thumImg) {
		this.thumImg = thumImg;
	}



	public String getCosContent() {
		return cosContent;
	}



	public void setCosContent(String cosContent) {
		this.cosContent = cosContent;
	}



	public String getStartHour() {
		return startHour;
	}



	public void setStartHour(String startHour) {
		this.startHour = startHour;
	}



	public String getEndHour() {
		return endHour;
	}



	public void setEndHour(String endHour) {
		this.endHour = endHour;
	}



	public String getReserDate() {
		return reserDate;
	}



	public void setReserDate(String reserDate) {
		this.reserDate = reserDate;
	}



	public Date getReserRegist() {
		return reserRegist;
	}



	public void setReserRegist(Date reserRegist) {
		this.reserRegist = reserRegist;
	}



	@Override
	public String toString() {
		return "TourReservaVO [tourNum=" + tourNum + ", adultFee=" + adultFee + ", otherFee=" + otherFee
				+ ", tourOrder=" + tourOrder + ", adultCnt=" + adultCnt + ", otherCnt=" + otherCnt + ", reserNum="
				+ reserNum + ", totalSeatCnt=" + totalSeatCnt + ", runFlag=" + runFlag + ", seatNum="
				+ Arrays.toString(seatNum) + ", seatNumIn=" + Arrays.toString(seatNumIn) + ", id=" + id + ", name="
				+ name + ", tourName=" + tourName + ", explain=" + explain + ", thumImg=" + thumImg + ", cosContent="
				+ cosContent + ", startHour=" + startHour + ", endHour=" + endHour + ", reserDate=" + reserDate
				+ ", reserRegist=" + reserRegist + "]";
	}
	
}//class
