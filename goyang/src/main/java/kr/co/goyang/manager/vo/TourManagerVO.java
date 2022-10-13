package kr.co.goyang.manager.vo;

import java.sql.Date;
import java.util.Arrays;

public class TourManagerVO {

	private String tourName, explain, thumImg, spotName, startHour, endHour, listSearch, textSearch;
	private String[] spotNameIn, startHourIn, endHourIn;
	private int tourNum, adultFee, otherFee, runFlag, tourOrder;
	private int[] tourOrderIn;
	private double mapCenLati, mapCenLong, mapSpoLati, mapSpoLong;
	private double[] mapSpoLatiIn, mapSpoLongIn;
	private Date tourResist;
	
	public TourManagerVO() {
		super();
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

	public String getSpotName() {
		return spotName;
	}

	public void setSpotName(String spotName) {
		this.spotName = spotName;
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

	public String[] getSpotNameIn() {
		return spotNameIn;
	}

	public void setSpotNameIn(String[] spotNameIn) {
		this.spotNameIn = spotNameIn;
	}

	public String[] getStartHourIn() {
		return startHourIn;
	}

	public void setStartHourIn(String[] startHourIn) {
		this.startHourIn = startHourIn;
	}

	public String[] getEndHourIn() {
		return endHourIn;
	}

	public void setEndHourIn(String[] endHourIn) {
		this.endHourIn = endHourIn;
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

	public int[] getTourOrderIn() {
		return tourOrderIn;
	}

	public void setTourOrderIn(int[] tourOrderIn) {
		this.tourOrderIn = tourOrderIn;
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

	public double[] getMapSpoLatiIn() {
		return mapSpoLatiIn;
	}

	public void setMapSpoLatiIn(double[] mapSpoLatiIn) {
		this.mapSpoLatiIn = mapSpoLatiIn;
	}

	public double[] getMapSpoLongIn() {
		return mapSpoLongIn;
	}

	public void setMapSpoLongIn(double[] mapSpoLongIn) {
		this.mapSpoLongIn = mapSpoLongIn;
	}

	public Date getTourResist() {
		return tourResist;
	}

	public void setTourResist(Date tourResist) {
		this.tourResist = tourResist;
	}

	@Override
	public String toString() {
		return "TourManagerVO [tourName=" + tourName + ", explain=" + explain + ", thumImg=" + thumImg + ", spotName="
				+ spotName + ", startHour=" + startHour + ", endHour=" + endHour + ", listSearch=" + listSearch
				+ ", textSearch=" + textSearch + ", spotNameIn=" + Arrays.toString(spotNameIn) + ", startHourIn="
				+ Arrays.toString(startHourIn) + ", endHourIn=" + Arrays.toString(endHourIn) + ", tourNum=" + tourNum
				+ ", adultFee=" + adultFee + ", otherFee=" + otherFee + ", runFlag=" + runFlag + ", tourOrder="
				+ tourOrder + ", tourOrderIn=" + Arrays.toString(tourOrderIn) + ", mapCenLati=" + mapCenLati
				+ ", mapCenLong=" + mapCenLong + ", mapSpoLati=" + mapSpoLati + ", mapSpoLong=" + mapSpoLong
				+ ", mapSpoLatiIn=" + Arrays.toString(mapSpoLatiIn) + ", mapSpoLongIn=" + Arrays.toString(mapSpoLongIn)
				+ ", tourResist=" + tourResist + "]";
	}

	

}//class
