package kr.co.goyang.user.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.user.vo.TourReservaVO;

public class TourReservaDAO {
	private static TourReservaDAO toreDAO;
	
	public TourReservaDAO() {
	}
	
	public static TourReservaDAO getInstance() {
		if( toreDAO ==null ) {
			toreDAO =new TourReservaDAO();
			
		}//if
		return toreDAO;
	}//getInstance
	
	/*
	 * + selectTour(TourReservaVO) : int // 메인 투어 검색 
	 * + selectTourList() : List<TourReservaVO> // 정기코스 리스트 목록 
	 * + selectSeatNum(TourReservaVO) : int[] //버스좌석번호 
	 * + insertTourReser(TourReservaVO) : void // 결제하기(투어예약) 
	 * + insertSeatReser(TourReservaVO) : void // 결제하기(좌석예약) 
	 * + selectReserConfirm(TourReservaVO) : TourReservaVO // 결제 확인
	 */	
	
	public int selectTour() {
		return 0 ;
	
	}// 메인 투어 검색
	
	
	public List<TourReservaVO> selectTourList(){
		List<TourReservaVO> list = new ArrayList<TourReservaVO>();
		return list;
	}// 정기코스 리스트 목록 
	
	
	public int selectSeatNum() {
		int i=0;
		return i;
	}//버스좌석번호
	
	
	public void insertTourReser() {
		
	}// 결제하기(투어예약)
	
	
	public void insertSeatReser() {
		
	}// 결제하기(좌석예약)
	
	
	public TourReservaVO selectReserConfirm() {
		TourReservaVO tore = new TourReservaVO();
		return tore;
	}// 결제 확인
	
	
	
	
	
	
	
	
	
	
	
	
	
}
