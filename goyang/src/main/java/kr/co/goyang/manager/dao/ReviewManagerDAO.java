package kr.co.goyang.manager.dao;
import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.manager.vo.ReviewManagerVO;

public class ReviewManagerDAO {
	private static ReviewManagerDAO tourDao;
	
	private ReviewManagerDAO() {
		
	}
	
	public static ReviewManagerDAO getInstance() {
		if ( tourDao == null ) {
			tourDao = new ReviewManagerDAO();
		}
		return tourDao;
	}//gerInstance
	
	public int selectUserM(ReviewManagerVO tourVo) {
		return 0;
		
	}//int
	
	public List<ReviewManagerVO> selectSearchReviewM( ReviewManagerVO tourVo){
		List<ReviewManagerVO> list = new ArrayList<ReviewManagerVO>();
		return list;
	}//list
	
	public int deleteReviewM( ReviewManagerVO touVo) {
		return 0;
		
	}//int
	
}//DAO
