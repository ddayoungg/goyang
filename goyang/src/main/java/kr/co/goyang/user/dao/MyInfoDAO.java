package kr.co.goyang.user.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.user.vo.MyInfoVO;

public class MyInfoDAO {

	public boolean selectMyPassConfirm(MyInfoVO miVO) { // 비밀번호 확인
		boolean flag=true;
		
		return flag;
	}//selectMyPassConfirm
	
	public MyInfoVO selectMyUesrInfo(String id) { // 내 정보
		MyInfoVO miVO=new MyInfoVO();
		
		return miVO;
	}//selectMyUesrInfo
	
	public List<MyInfoVO> selectMyReserList(String id) { // 내 예약관리 리스트
		List<MyInfoVO> list =new ArrayList<MyInfoVO>();
		
		return list;
	}//selectMyReserList
	
	public MyInfoVO selectReserDetail(MyInfoVO miVO) { // 예약관리 상세보기 (id,resNum)
		MyInfoVO miResultVO=new MyInfoVO();
		
		return miResultVO;
	}//selectReserDetail
	
	public int updateReserCancel(MyInfoVO miVO) { // 예약 취소
		int upCnt=0;
		
		return upCnt;
	}//updateReserCancel
	
	public int deleteUser(MyInfoVO miVO) { // 회원탈퇴
		int delCnt=0;
		
		return delCnt;
	}//deleteUser
	
	public List<MyInfoVO> selectMyReviewList(String id) { // 내 후기 리스트
		List<MyInfoVO> list =new ArrayList<MyInfoVO>();
		
		return list;
	}//selectMyReviewList
	
	public MyInfoVO selectReviewDetail(int reviewNum) { // 후기 상세보기
		MyInfoVO miVO=new MyInfoVO();
		
		return miVO;
	}//selectReviewDetail
	
	public int updateReviewChange(MyInfoVO miVO) { // 후기 수정
		int upCnt=0;
		
		return upCnt;
	}//updateReviewChange

	public List<MyInfoVO> selectMyCommList(String id) { // 내 댓글 리스트
		List<MyInfoVO> list =new ArrayList<MyInfoVO>();
		
		return list;
	}//selectMyCommList
	
	public int updateCommChange(MyInfoVO miVO) { // 댓글 수정
		int upCnt=0;
		
		return upCnt;
	}//updateCommChange
	
}//class
