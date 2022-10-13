package kr.co.goyang.user.vo;

public class TourMainVO {
	private String tourName, explain, thum_img;
	private int tourNum;
	
	public TourMainVO() {
		
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

	public String getThum_img() {
		return thum_img;
	}

	public void setThum_img(String thum_img) {
		this.thum_img = thum_img;
	}

	public int getTourNum() {
		return tourNum;
	}

	public void setTourNum(int tourNum) {
		this.tourNum = tourNum;
	}

	public TourMainVO(String tourName, String explain, String thum_img, int tourNum) {
		super();
		this.tourName = tourName;
		this.explain = explain;
		this.thum_img = thum_img;
		this.tourNum = tourNum;
	}

	@Override
	public String toString() {
		return "TourMainVO [tourName=" + tourName + ", explain=" + explain + ", thum_img=" + thum_img + ", tourNum="
				+ tourNum + "]";
	}
	
	
}//VO
