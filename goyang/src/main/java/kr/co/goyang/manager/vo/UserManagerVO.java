package kr.co.goyang.manager.vo;

import java.util.Date;

public class UserManagerVO {
	private String id, email, name, addr, deaddr, phone, courseName;
	private int zipcode, tournum, outflag;
	private Date joindate=new Date();
	private Date outdate=new Date();
	
	public UserManagerVO() {
		
	}

	public UserManagerVO(String id, String email, String name, String addr, String deaddr, String phone,
			String courseName, int zipcode, int tournum, int outflag, Date joindate, Date outdate) {
		super();
		this.id = id;
		this.email = email;
		this.name = name;
		this.addr = addr;
		this.deaddr = deaddr;
		this.phone = phone;
		this.courseName = courseName;
		this.zipcode = zipcode;
		this.tournum = tournum;
		this.outflag = outflag;
		this.joindate = joindate;
		this.outdate = outdate;
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

	public String getDeaddr() {
		return deaddr;
	}

	public void setDeaddr(String deaddr) {
		this.deaddr = deaddr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public int getTournum() {
		return tournum;
	}

	public void setTournum(int tournum) {
		this.tournum = tournum;
	}

	public int getOutflag() {
		return outflag;
	}

	public void setOutflag(int outflag) {
		this.outflag = outflag;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public Date getOutdate() {
		return outdate;
	}

	public void setOutdate(Date outdate) {
		this.outdate = outdate;
	}
	@Override
	public String toString() {
		return "UserManagerVO [id=" + id + ", email=" + email + ", name=" + name + ", addr=" + addr + ", deaddr="
				+ deaddr + ", phone=" + phone + ", courseName=" + courseName + ", zipcode=" + zipcode + ", tournum="
				+ tournum + ", outflag=" + outflag + ", joindate=" + joindate + ", outdate=" + outdate + "]";
	}
}
