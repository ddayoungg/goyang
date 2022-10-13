package kr.co.goyang.manager.vo;

import java.sql.Array;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class ReservaManagerVO {
	private String tourName, email, name, phone, outReas, cancelReas,clientName,reserDate,reser;
	String id;
	private int tourNum, adultFee, otherFee, runFlag, reserNum, adultCnt, otherCnt;
	int reserFlag;
	private int seatNum;
	private Date tourRist, cancelDate, reserRegist;
	public String getReserFlag;
	public String getCancelReas;
	
	public ReservaManagerVO() {

	}

	public ReservaManagerVO(String tourName, String email, String name, String phone, String outReas, String cancelReas,
			String clientName, String reserDate, String reser, String id, int tourNum, int adultFee, int otherFee,
			int runFlag, int reserNum, int adultCnt, int otherCnt, int reserFlag, int seatNum, Date tourRist,
			Date cancelDate, Date reserRegist, String getCancelReas) {
		super();
		this.tourName = tourName;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.outReas = outReas;
		this.cancelReas = cancelReas;
		this.clientName = clientName;
		this.reserDate = reserDate;
		this.reser = reser;
		this.id = id;
		this.tourNum = tourNum;
		this.adultFee = adultFee;
		this.otherFee = otherFee;
		this.runFlag = runFlag;
		this.reserNum = reserNum;
		this.adultCnt = adultCnt;
		this.otherCnt = otherCnt;
		this.reserFlag = reserFlag;
		this.seatNum = seatNum;
		this.tourRist = tourRist;
		this.cancelDate = cancelDate;
		this.reserRegist = reserRegist;
		this.getCancelReas = getCancelReas;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
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

	public String getReser() {
		return reser;
	}

	public void setReser(String reser) {
		this.reser = reser;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
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

	public String getGetCancelReas() {
		return getCancelReas;
	}

	public void setGetCancelReas(String getCancelReas) {
		this.getCancelReas = getCancelReas;
	}

	@Override
	public String toString() {
		return "ReservaManagerVO [tourName=" + tourName + ", email=" + email + ", name=" + name + ", phone=" + phone
				+ ", outReas=" + outReas + ", cancelReas=" + cancelReas + ", clientName=" + clientName + ", reserDate="
				+ reserDate + ", reser=" + reser + ", id=" + id + ", tourNum=" + tourNum + ", adultFee=" + adultFee
				+ ", otherFee=" + otherFee + ", runFlag=" + runFlag + ", reserNum=" + reserNum + ", adultCnt="
				+ adultCnt + ", otherCnt=" + otherCnt + ", reserFlag=" + reserFlag + ", seatNum=" + seatNum
				+ ", tourRist=" + tourRist + ", cancelDate=" + cancelDate + ", reserRegist=" + reserRegist
				+ ", getCancelReas=" + getCancelReas + "]";
	}
    
	

	
	
}
