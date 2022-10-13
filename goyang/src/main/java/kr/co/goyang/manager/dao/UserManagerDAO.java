package kr.co.goyang.manager.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.manager.vo.UserManagerVO;

public class UserManagerDAO {

	private static UserManagerDAO tourDAO;
	private UserManagerDAO() {
		
	}
	
	public static UserManagerDAO getInstance() {
		if(tourDAO==null) {
			tourDAO=new UserManagerDAO();
		}
		
		return tourDAO;
		
	}
	
	public String selectUser(UserManagerVO tourDAO){
		
		return null;		
	}
	
	public List<UserManagerVO> selectSearchUser(UserManagerVO tourVO){
		
		List<UserManagerVO> list=new ArrayList<UserManagerVO>();
		return list;
	}
	
	public int updateDelReasUser(UserManagerVO tourDAO) {
		return 0;
	}
}
