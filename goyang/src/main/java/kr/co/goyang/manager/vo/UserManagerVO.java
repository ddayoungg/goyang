package kr.co.goyang.manager.vo;

import java.util.Date;

public class UserManagerVO {
	private String id, email, name, addr, deAddr, phone, tourName, zipcode, outReas, listSearch, textSearch;
	private int tourNum, outFlag;
	private Date joinDate, outDate;

	public UserManagerVO() {
	}

	public UserManagerVO(String id, String email, String name, String addr, String deAddr, String phone,
			String tourName, String zipcode, String outReas, String listSearch, String textSearch, int tourNum,
			int outFlag, Date joinDate, Date outDate) {
		super();
		this.id = id;
		this.email = email;
		this.name = name;
		this.addr = addr;
		this.deAddr = deAddr;
		this.phone = phone;
		this.tourName = tourName;
		this.zipcode = zipcode;
		this.outReas = outReas;
		this.listSearch = listSearch;
		this.textSearch = textSearch;
		this.tourNum = tourNum;
		this.outFlag = outFlag;
		this.joinDate = joinDate;
		this.outDate = outDate;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getOutReas() {
		return outReas;
	}

	public void setOutReas(String outReas) {
		this.outReas = outReas;
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

	public int getTourNum() {
		return tourNum;
	}

	public void setTourNum(int tourNum) {
		this.tourNum = tourNum;
	}

	public int getOutFlag() {
		return outFlag;
	}

	public void setOutFlag(int outFlag) {
		this.outFlag = outFlag;
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
		return "UserManagerVO [id=" + id + ", email=" + email + ", name=" + name + ", addr=" + addr + ", deAddr="
				+ deAddr + ", phone=" + phone + ", tourName=" + tourName + ", zipcode=" + zipcode + ", outReas="
				+ outReas + ", listSearch=" + listSearch + ", textSearch=" + textSearch + ", tourNum=" + tourNum
				+ ", outFlag=" + outFlag + ", joinDate=" + joinDate + ", outDate=" + outDate + "]";
	}

}