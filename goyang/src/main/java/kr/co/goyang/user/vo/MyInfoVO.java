package kr.co.goyang.user.vo;

import java.sql.Date;
import java.util.Arrays;

public class MyInfoVO {

	 int commendNum, reviewNum, tourNum, reserNum, spotsNum,
	 	adultCnt, otherCnt, adultFee, otherFee, reserFlag;
	 int[] seatNum;
	 String id, name, password, email, phone, addr,deAddr, tourName, 
	 	cancelReas, title, revContent,zipcode,reviewImg,reserDate;
	 Date writeDate;
	 
	public MyInfoVO() {
		super();
	}

	public MyInfoVO(int commendNum, int reviewNum, int tourNum, int reserNum, int spotsNum, int adultCnt, int otherCnt,
			int adultFee, int otherFee, int reserFlag, int[] seatNum, String id, String name, String password,
			String email, String phone, String addr, String deAddr, String tourName, String cancelReas, String title,
			String revContent, String zipcode, String reviewImg, String reserDate, Date writeDate) {
		super();
		this.commendNum = commendNum;
		this.reviewNum = reviewNum;
		this.tourNum = tourNum;
		this.reserNum = reserNum;
		this.spotsNum = spotsNum;
		this.adultCnt = adultCnt;
		this.otherCnt = otherCnt;
		this.adultFee = adultFee;
		this.otherFee = otherFee;
		this.reserFlag = reserFlag;
		this.seatNum = seatNum;
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.addr = addr;
		this.deAddr = deAddr;
		this.tourName = tourName;
		this.cancelReas = cancelReas;
		this.title = title;
		this.revContent = revContent;
		this.zipcode = zipcode;
		this.reviewImg = reviewImg;
		this.reserDate = reserDate;
		this.writeDate = writeDate;
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

	public int getTourNum() {
		return tourNum;
	}

	public void setTourNum(int tourNum) {
		this.tourNum = tourNum;
	}

	public int getReserNum() {
		return reserNum;
	}

	public void setReserNum(int reserNum) {
		this.reserNum = reserNum;
	}

	public int getSpotsNum() {
		return spotsNum;
	}

	public void setSpotsNum(int spotsNum) {
		this.spotsNum = spotsNum;
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

	public int getReserFlag() {
		return reserFlag;
	}

	public void setReserFlag(int reserFlag) {
		this.reserFlag = reserFlag;
	}

	public int[] getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(int[] seatNum) {
		this.seatNum = seatNum;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDeAddr() {
		return deAddr;
	}

	public void setDeAddr(String deAddr) {
		this.deAddr = deAddr;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public String getCancelReas() {
		return cancelReas;
	}

	public void setCancelReas(String cancelReas) {
		this.cancelReas = cancelReas;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getReviewImg() {
		return reviewImg;
	}

	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}

	public String getReserDate() {
		return reserDate;
	}

	public void setReserDate(String reserDate) {
		this.reserDate = reserDate;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "MyInfoVO [commendNum=" + commendNum + ", reviewNum=" + reviewNum + ", tourNum=" + tourNum
				+ ", reserNum=" + reserNum + ", spotsNum=" + spotsNum + ", adultCnt=" + adultCnt + ", otherCnt="
				+ otherCnt + ", adultFee=" + adultFee + ", otherFee=" + otherFee + ", reserFlag=" + reserFlag
				+ ", seatNum=" + Arrays.toString(seatNum) + ", id=" + id + ", name=" + name + ", password=" + password
				+ ", email=" + email + ", phone=" + phone + ", addr=" + addr + ", deAddr=" + deAddr + ", tourName="
				+ tourName + ", cancelReas=" + cancelReas + ", title=" + title + ", revContent=" + revContent
				+ ", zipcode=" + zipcode + ", reviewImg=" + reviewImg + ", reserDate=" + reserDate + ", writeDate="
				+ writeDate + "]";
	}
	 
}//class
