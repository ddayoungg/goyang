package kr.co.goyang.manager.vo;

import java.util.Date;

public class ManagerVO {
	private String id, password;
	private Date managerRegist=new Date();
	
	public ManagerVO() {
		
	}

	public ManagerVO(String id, String password, Date managerRegist) {
		super();
		this.id = id;
		this.password = password;
		this.managerRegist = managerRegist;
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

	public Date getManagerRegist() {
		return managerRegist;
	}

	public void setManagerRegist(Date managerRegist) {
		this.managerRegist = managerRegist;
	}

	@Override
	public String toString() {
		return "TourManagerVO [id=" + id + ", password=" + password + ", managerRegist=" + managerRegist + "]";
	}
	
	
}
