package kr.co.goyang.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.dbConnection.DbConnection;
import kr.co.goyang.user.vo.TourListVO;

public class TourListDAO {
	private static TourListDAO toliDAO;
	
	public TourListDAO() {
	}  
	
	public static TourListDAO getInstance() {
		if( toliDAO ==null ) {
			toliDAO =new TourListDAO();
			 
		}//if
		return toliDAO;
	}//getInstance
	
	/*
	 * + selectAllTour() : list<TourListVO> // 전체 투어 리스트 
	 * + selectTourSpots(int) : TourListVO // 선택한 투어 관광지 리스트 
	 * + selectTourCouse(int) : List<TourListVO> // 선택한투어 관광지 리스트
	 * + selectSpots(TourListVO) : TourListVO // 관광지 상세보기
	 */	
	public List<TourListVO> selectAllTour(){
		List<TourListVO> list = new ArrayList<TourListVO>();
		return list;
	}// 전체 투어 리스트 
	
	public TourListVO selectTourSpots() {
		TourListVO toli = new TourListVO();
		return toli;
	}// 선택한 투어 관광지 리스트 
	
	public List<TourListVO> selectTourCouse(int tournum){
		List<TourListVO> list = new ArrayList<TourListVO>();
		return list;
	}// 선택한투어 관광지 리스트
	
	public TourListVO selectSpots() {
		TourListVO toli = new TourListVO();
		return toli;
	}// 관광지 상세보기
	
	
	public TourListVO selectCenterSpotMap(int tournum)throws SQLException{
		TourListVO cenVO = new TourListVO();

		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbCon.getConn();
		
			StringBuilder selectCenterMap = new StringBuilder();
			selectCenterMap
			.append("	select map_cen_lati,map_cen_long ")
			.append("	from tour")
			.append("	where tour_num=?");
			pstmt = conn.prepareStatement(selectCenterMap.toString());
			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, tournum);
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.

			while (rs.next()) {
				cenVO.setMapCenLati(rs.getDouble("map_cen_lati"));
				cenVO.setMapCenLong(rs.getDouble("map_cen_long"));
				
			}
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}
		
		return cenVO;
	}//관광지 중심위도경도 가져오기
	
	public List<TourListVO> selectSpotMap(int tournum)throws SQLException{
		List<TourListVO> list = new ArrayList<TourListVO>();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbCon.getConn();
		
			StringBuilder selectMap = new StringBuilder();
			selectMap
			.append("	select spots_name,map_spo_lati,map_spo_long ")
			.append("	from tour_spots")
			.append("	where tour_num=?");
			pstmt = conn.prepareStatement(selectMap.toString());
			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, tournum);
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.

			while (rs.next()) {
				TourListVO tlVO=new TourListVO();
				tlVO.setSpotsName(rs.getString("spots_name"));
				tlVO.setMapSpoLati(rs.getDouble("map_spo_lati"));
				tlVO.setMapSpoLong(rs.getDouble("map_spo_long"));
				list.add(tlVO);
			}
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}//관광지 관광지별위도경도 가져오기
	
}
