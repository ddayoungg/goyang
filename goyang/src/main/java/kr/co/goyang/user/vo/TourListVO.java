package kr.co.goyang.user.vo;

public class TourListVO {
	private String tourName, explain, thumImg, mapImg, spotsName, startHour, endHour, spoContent, spotsImg;
	private int tourNum, adultFee, otherFee, runFlag, tourOrder, spotsNum, tousResist, spotsResist;
	private double mapCenLati,mapCenLong,mapSpoLati,mapSpoLong;
	public TourListVO() {
		super();
	}
	public TourListVO(String tourName, String explain, String thumImg, String mapImg, String spotsName,
			String startHour, String endHour, String spoContent, String spotsImg, int tourNum, int adultFee,
			int otherFee, int runFlag, int tourOrder, int spotsNum, int tousResist, int spotsResist, double mapCenLati,
			double mapCenLong, double mapSpoLati, double mapSpoLong) {
		super();
		this.tourName = tourName;
		this.explain = explain;
		this.thumImg = thumImg;
		this.mapImg = mapImg;
		this.spotsName = spotsName;
		this.startHour = startHour;
		this.endHour = endHour;
		this.spoContent = spoContent;
		this.spotsImg = spotsImg;
		this.tourNum = tourNum;
		this.adultFee = adultFee;
		this.otherFee = otherFee;
		this.runFlag = runFlag;
		this.tourOrder = tourOrder;
		this.spotsNum = spotsNum;
		this.tousResist = tousResist;
		this.spotsResist = spotsResist;
		this.mapCenLati = mapCenLati;
		this.mapCenLong = mapCenLong;
		this.mapSpoLati = mapSpoLati;
		this.mapSpoLong = mapSpoLong;
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
	public String getMapImg() {
		return mapImg;
	}
	public void setMapImg(String mapImg) {
		this.mapImg = mapImg;
	}
	public String getSpotsName() {
		return spotsName;
	}
	public void setSpotsName(String spotsName) {
		this.spotsName = spotsName;
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
	public int getSpotsNum() {
		return spotsNum;
	}
	public void setSpotsNum(int spotsNum) {
		this.spotsNum = spotsNum;
	}
	public int getTousResist() {
		return tousResist;
	}
	public void setTousResist(int tousResist) {
		this.tousResist = tousResist;
	}
	public int getSpotsResist() {
		return spotsResist;
	}
	public void setSpotsResist(int spotsResist) {
		this.spotsResist = spotsResist;
	}
	public double getMapCenLati() {
		return mapCenLati;
	}
	public void setMapCenLati(double mapCenLati) {
		this.mapCenLati = mapCenLati;
	}
	public double getMapCenLong() {
		return mapCenLong;
	}
	public void setMapCenLong(double mapCenLong) {
		this.mapCenLong = mapCenLong;
	}
	public double getMapSpoLati() {
		return mapSpoLati;
	}
	public void setMapSpoLati(double mapSpoLati) {
		this.mapSpoLati = mapSpoLati;
	}
	public double getMapSpoLong() {
		return mapSpoLong;
	}
	public void setMapSpoLong(double mapSpoLong) {
		this.mapSpoLong = mapSpoLong;
	}
	@Override
	public String toString() {
		return "TourListVO [tourName=" + tourName + ", explain=" + explain + ", thumImg=" + thumImg + ", mapImg="
				+ mapImg + ", spotsName=" + spotsName + ", startHour=" + startHour + ", endHour=" + endHour
				+ ", spoContent=" + spoContent + ", spotsImg=" + spotsImg + ", tourNum=" + tourNum + ", adultFee="
				+ adultFee + ", otherFee=" + otherFee + ", runFlag=" + runFlag + ", tourOrder=" + tourOrder
				+ ", spotsNum=" + spotsNum + ", tousResist=" + tousResist + ", spotsResist=" + spotsResist
				+ ", mapCenLati=" + mapCenLati + ", mapCenLong=" + mapCenLong + ", mapSpoLati=" + mapSpoLati
				+ ", mapSpoLong=" + mapSpoLong + "]";
	}
	
	
	
	
	
	
	
	
}//class
