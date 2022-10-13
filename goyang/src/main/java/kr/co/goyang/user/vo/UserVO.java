package kr.co.goyang.user.vo;

import java.util.Date;

public class UserVO {
	public String id, password, newPassword, email, name, addr, deAddr, phone, tourName, outReas,zipcode;
	public int tourNum, outFlag;
	public Date joinDate, outDate;
	
	public UserVO() {
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
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

	public String getOutReas() {
		return outReas;
	}

	public void setOutReas(String outReas) {
		this.outReas = outReas;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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

	public UserVO(String id, String password, String newPassword, String email, String name, String addr,
			String deAddr, String phone, String tourName, String outReas, String zipcode, int tourNum, int outFlag,
			Date joinDate, Date outDate) {
		super();
		this.id = id;
		this.password = password;
		this.newPassword = newPassword;
		this.email = email;
		this.name = name;
		this.addr = addr;
		this.deAddr = deAddr;
		this.phone = phone;
		this.tourName = tourName;
		this.outReas = outReas;
		this.zipcode = zipcode;
		this.tourNum = tourNum;
		this.outFlag = outFlag;
		this.joinDate = joinDate;
		this.outDate = outDate;
	}

	@Override
	public String toString() {
		return "TourUserVO [id=" + id + ", password=" + password + ", newPassword=" + newPassword + ", email=" + email
				+ ", name=" + name + ", addr=" + addr + ", deAddr=" + deAddr + ", phone=" + phone + ", tourName="
				+ tourName + ", outReas=" + outReas + ", zipcode=" + zipcode + ", tourNum=" + tourNum + ", outFlag="
				+ outFlag + ", joinDate=" + joinDate + ", outDate=" + outDate + "]";
	}
	
	
}//VO
