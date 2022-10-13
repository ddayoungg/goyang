package kr.co.goyang.manager.vo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class SpotListVO {
	private String tourName, spotsName, spoContent, spotsImg;
	private int tourNum, runFlag, tourOrder;
	private Date tourResist, spotsResist;
	
	public SpotListVO() {
	}

	public SpotListVO(String tourName, String spotsName, String spoContent, String spotsImg, int tourNum, int runFlag,
			int tourOrder, Date tourResist, Date spotsResist) {
		super();
		this.tourName = tourName;
		this.spotsName = spotsName;
		this.spoContent = spoContent;
		this.spotsImg = spotsImg;
		this.tourNum = tourNum;
		this.runFlag = runFlag;
		this.tourOrder = tourOrder;
		this.tourResist = tourResist;
		this.spotsResist = spotsResist;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public String getSpotsName() {
		return spotsName;
	}

	public void setSpotsName(String spotsName) {
		this.spotsName = spotsName;
	}

	public String getSpoContent() {
		return spoContent;
	}

	public void setSpoContent(String spoContent) {
		this.spoContent = spoContent;
	}

	public String getSpotsImg() {
		return spotsImg;
	}

	public void setSpotsImg(String spotsImg) {
		this.spotsImg = spotsImg;
	}

	public int getTourNum() {
		return tourNum;
	}

	public void setTourNum(int tourNum) {
		this.tourNum = tourNum;
	}

	public int getRunFlag() {
		return runFlag;
	}

	public void setRunFlag(int runFlag) {
		this.runFlag = runFlag;
	}

	public int getTourOrder() {
		return tourOrder;
	}

	public void setTourOrder(int tourOrder) {
		this.tourOrder = tourOrder;
	}

	public Date getTourResist() {
		return tourResist;
	}

	public void setTourResist(Date tourResist) {
		this.tourResist = tourResist;
	}

	public Date getSpotsResist() {
		return spotsResist;
	}

	public void setSpotsResist(Date spotsResist) {
		this.spotsResist = spotsResist;
	}

	@Override
	public String toString() {
		return "SpotListVO [tourName=" + tourName + ", spotsName=" + spotsName + ", spoContent=" + spoContent
				+ ", spotsImg=" + spotsImg + ", tourNum=" + tourNum + ", runFlag=" + runFlag + ", tourOrder="
				+ tourOrder + ", tourResist=" + tourResist + ", spotsResist=" + spotsResist + "]";
	}
	
}