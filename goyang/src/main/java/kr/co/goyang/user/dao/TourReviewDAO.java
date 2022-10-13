package kr.co.goyang.user.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.user.vo.TourReviewVO;

public class TourReviewDAO {
	public void insertReview(TourReviewVO trVO) { // 후기 작성
		
	}//insertReview
	
	public int updateReview(TourReviewVO trVO) { //후기 수정
		int upCnt=0;
		
		return upCnt;
	}//updateReview
	
	public void insertCommend(TourReviewVO trVO) { // 댓글 작성
		
	}//insertCommend
	
	public int updateCommend(TourReviewVO trVO) { // 댓글 수정
		int upCnt=0;
		
		return upCnt;
	}//updateCommend
	
	public TourReviewVO selectReview(int reviewNum) { // 후기글 보기
		TourReviewVO trVO = new TourReviewVO();
		
		return trVO;
	}//selectReview
	
	public List<TourReviewVO> selectCommend(int commendNum) { // 댓글보기
		List<TourReviewVO> list = new ArrayList<TourReviewVO>();
		
		return list;
	}//selectCommend
	
	public List<TourReviewVO> selectSearchReview(TourReviewVO trVO) { // 후기 검색
		List<TourReviewVO> list = new ArrayList<TourReviewVO>();
		
		return list;
	}//selectSearchReview
	
	public int deleteReview(int reviewNum) { // 후기 삭제
		int delCnt=0;
		
		return delCnt;
	}//deleteReview
	
	public int deleteCommend(int commendNum) { // 댓글 삭제
		int delCnt=0;
		
		return delCnt;
	}//deleteCommend

}//class
