package kr.co.goyang.manager.vo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class ReservaManagerVO {
	private String tourName, id, email, name, phone, outReas, cancelReas,clientName,reserDate;
	private int tourNum, adultFee, otherFee, runFlag, reserNum, adultCnt, otherCnt, reserFlag;
	private int[] searNum;
	private Date tourRist, cancelDate, reserRegist;
	
	public ReservaManagerVO() {

	}

	public ReservaManagerVO(String tourName, String id, String email, String name, String phone, String outReas,
			String cancelReas, String clientName, String reserDate, int tourNum, int adultFee, int otherFee,
			int runFlag, int reserNum, int adultCnt, int otherCnt, int reserFlag, int[] searNum, Date tourRist,
			Date cancelDate, Date reserRegist) {
		super();
		this.tourName = tourName;
		this.id = id;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.outReas = outReas;
		this.cancelReas = cancelReas;
		this.clientName = clientName;
		this.reserDate = reserDate;
		this.tourNum = tourNum;
		this.adultFee = adultFee;
		this.otherFee = otherFee;
		this.runFlag = runFlag;
		this.reserNum = reserNum;
		this.adultCnt = adultCnt;
		this.otherCnt = otherCnt;
		this.reserFlag = reserFlag;
		this.searNum = searNum;
		this.tourRist = tourRist;
		this.cancelDate = cancelDate;
		this.reserRegist = reserRegist;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOutReas() {
		return outReas;
	}

	public void setOutReas(String outReas) {
		this.outReas = outReas;
	}

	public String getCancelReas() {
		return cancelReas;
	}

	public void setCancelReas(String cancelReas) {
		this.cancelReas = cancelReas;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getReserDate() {
		return reserDate;
	}

	public void setReserDate(String reserDate) {
		this.reserDate = reserDate;
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

	public int getReserNum() {
		return reserNum;
	}

	public void setReserNum(int reserNum) {
		this.reserNum = reserNum;
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

	public int getReserFlag() {
		return reserFlag;
	}

	public void setReserFlag(int reserFlag) {
		this.reserFlag = reserFlag;
	}

	public int[] getSearNum() {
		return searNum;
	}

	public void setSearNum(int[] searNum) {
		this.searNum = searNum;
	}

	public Date getTourRist() {
		return tourRist;
	}

	public void setTourRist(Date tourRist) {
		this.tourRist = tourRist;
	}

	public Date getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(Date cancelDate) {
		this.cancelDate = cancelDate;
	}

	public Date getReserRegist() {
		return reserRegist;
	}

	public void setReserRegist(Date reserRegist) {
		this.reserRegist = reserRegist;
	}

	@Override
	public String toString() {
		return "ReservaManageVO [tourName=" + tourName + ", id=" + id + ", email=" + email + ", name=" + name
				+ ", phone=" + phone + ", outReas=" + outReas + ", cancelReas=" + cancelReas + ", clientName="
				+ clientName + ", reserDate=" + reserDate + ", tourNum=" + tourNum + ", adultFee=" + adultFee
				+ ", otherFee=" + otherFee + ", runFlag=" + runFlag + ", reserNum=" + reserNum + ", adultCnt="
				+ adultCnt + ", otherCnt=" + otherCnt + ", reserFlag=" + reserFlag + ", searNum="
				+ Arrays.toString(searNum) + ", tourRist=" + tourRist + ", cancelDate=" + cancelDate + ", reserRegist="
				+ reserRegist + "]";
	}
	
}
