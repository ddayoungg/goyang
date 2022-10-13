package kr.co.goyang.user.dao;

import kr.co.goyang.user.vo.UserVO;

public class UserDAO {
	public static UserDAO tourDao;
	
	private UserDAO() {
		
	}
	
	public static UserDAO getInstance() {
		if ( tourDao == null ) {
			tourDao = new UserDAO();
		}
		return tourDao;
	}//getInstance
	
	public void insertUser(UserVO tourVo) {
		
	}//void
	
	public int updateUser ( UserVO tourVo) {
		return 0;
		
	}//int
	
	public String selectUser (UserVO tourVo) {
		return toString();
		
	}//String
	
	public String deleteUser (UserVO tourVo) {
		return toString();
		
	}//String
	
	public int selectLogin (UserVO tourVo) {
		return 0;
		
	}//int
	
	public String selectFindId (UserVO tourVo) {
		return toString();
		
	}//String
	
	public String selectConfirm (UserVO tourVo) {
		return toString();
		
	}//String
	
	public int updateFindPass (UserVO tourVo) {
		return 0;
		
	}//int
	
}//DAO
