package kr.co.goyang.manager.vo;

import java.util.Arrays;
import java.util.List;

public class TourManagerVO {
	private String tourName, explain, thumImg, mapImg, spotName, startHour, endHour, listSearch, textSearch;
	private String[] spotNameIn, startHourIn, endHourIn;
	
	public TourManagerVO() {
		// TODO Auto-generated constructor stub
	}

	public TourManagerVO(String tourName, String explain, String thumImg, String mapImg, String spotName,
			String startHour, String endHour, String listSearch, String textSearch, String[] spotNameIn,
			String[] startHourIn, String[] endHourIn) {
		super();
		this.tourName = tourName;
		this.explain = explain;
		this.thumImg = thumImg;
		this.mapImg = mapImg;
		this.spotName = spotName;
		this.startHour = startHour;
		this.endHour = endHour;
		this.listSearch = listSearch;
		this.textSearch = textSearch;
		this.spotNameIn = spotNameIn;
		this.startHourIn = startHourIn;
		this.endHourIn = endHourIn;
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

	@Override
	public String toString() {
		return "TourManageVO [tourName=" + tourName + ", explain=" + explain + ", thumImg=" + thumImg + ", mapImg="
				+ mapImg + ", spotName=" + spotName + ", startHour=" + startHour + ", endHour=" + endHour
				+ ", listSearch=" + listSearch + ", textSearch=" + textSearch + ", spotNameIn="
				+ Arrays.toString(spotNameIn) + ", startHourIn=" + Arrays.toString(startHourIn) + ", endHourIn="
				+ Arrays.toString(endHourIn) + "]";
	}
	
}
