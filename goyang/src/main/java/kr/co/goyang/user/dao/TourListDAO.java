package kr.co.goyang.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.dbConnection.DbConnection;
import kr.co.goyang.manager.vo.ReservaManagerVO;
import kr.co.goyang.user.vo.TourListVO;

public class TourListDAO {
	private static TourListDAO toliDAO;

	public TourListDAO() {
	}

	public static TourListDAO getInstance() {
		if (toliDAO == null) {
			toliDAO = new TourListDAO();

		} // if
		return toliDAO;
	}// getInstance

	/*
	 * + selectAllTour() : list<TourListVO> // 전체 투어 리스트 + selectTourSpots(int) :
	 * TourListVO // 선택한 투어 관광지 리스트 + selectTourCourse(int) : List<TourListVO> //
	 * 선택한투어 관광지 리스트 + selectSpots(TourListVO) : TourListVO // 관광지 상세보기
	 */
	public List<TourListVO> selectAllTour(TourListVO tourVO) throws SQLException {
		List<TourListVO> list = new ArrayList<TourListVO>();

		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbCon.getConn();

			String sql = " select tour_num, thum_img, tour_name, explain, adult_fee, other_fee" + " from tour t"
					+ " order by tour_num";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				/* vo 2번 담아서 호출하는 방법 */
				  int tourNum = rs.getInt("tour_num");
				  String thumImg = rs.getString("thum_img"); 
				  String tourName=rs.getString("tour_name"); 
				  String explain = rs.getString("explain"); 
				  int adultFee = rs.getInt("adult_fee"); 
				  int otherFee = rs.getInt("other_fee");
				  
				  TourListVO toVO = new TourListVO(); 
				  toVO.setTourNum(tourNum);
				  toVO.setThumImg(thumImg);
				  toVO.setTourName(tourName); 
				  toVO.setExplain(explain);
				  toVO.setAdultFee(adultFee);
				  toVO.setOtherFee(otherFee);
				  
				  list.add(toVO);
				 
				
		 //System.out.println(toVO.getTourNum()+thumImg+tourName+ explain+adultFee+otherFee);
				 
				
				/*vo 1개에 담아서 호출하기*/
				/*
				 * tourVO.setThumImg(rs.getString("thum_img"));
				 * tourVO.setTourName(rs.getString("tour_name"));
				 * tourVO.setExplain(rs.getString("explain"));
				 * tourVO.setAdultFee(rs.getInt("adult_fee"));
				 * tourVO.setOtherFee(rs.getInt("other_fee")); list.add(tourVO);
				 * 
				 * System.out.println(tourVO.getThumImg()+tourVO.getTourName()+tourVO.getExplain
				 * ()+tourVO.getAdultFee()+tourVO.getOtherFee());
				 */				 				
			}
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}
		return list;
	}// 전체 투어 리스트

	public TourListVO selectTourSpots(int num) throws SQLException {
		TourListVO toli = new TourListVO();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbCon.getConn();
			
			String sql = " select t.tour_num, t.tour_name, t.thum_Img, s.spots_name, "
					+ " t.adult_fee, t.other_fee, s.start_hour, s.end_hour " 
					+ " from tour t, tour_spots s "
					+ " where t.tour_num like ? "
					+ " and t.tour_num = s.tour_num "
					+ " order by t.tour_num" ;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				toli.setTourNum(rs.getInt("tour_num"));
				toli.setTourName(rs.getString("tour_name"));
				toli.setThumImg(rs.getString("thum_Img"));
				toli.setSpotsName(rs.getString("spots_name"));
				toli.setAdultFee(rs.getInt("adult_fee"));
				toli.setOtherFee(rs.getInt("other_fee"));
				toli.setStartHour(rs.getString("start_hour"));
				toli.setEndHour(rs.getString("end_hour"));
				
				
				  System.out.println(toli.getTourNum()+toli.getTourName()+toli.getThumImg()+
				  toli.getSpotsName()+
				  toli.getAdultFee()+toli.getOtherFee()+toli.getStartHour()+toli.getEndHour());
				 
			}
		}finally {
			dbCon.dbClose(rs, pstmt, conn);
		}	
		return toli;
	}// 선택한 투어 관광지 리스트

	public List<TourListVO> selectTourCourse(int num) throws SQLException {
		List<TourListVO> spotList = new ArrayList<TourListVO>();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dbCon.getConn();
			
			String sql = " select t.tour_num, t.tour_name, t.thum_Img, s.tour_order, s.spots_name, "
					+ " t.adult_fee, t.other_fee, s.start_hour, s.end_hour " 
					+ " from tour t, tour_spots s "
					+ " where t.tour_num like ? "
					+ " and t.tour_num = s.tour_num "
					+ " order by t.tour_num" ;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int tourNum = rs.getInt("tour_num");
				String tourName = rs.getString("tour_name");
				String thumImg = rs.getString("thum_Img");
				int tourOrder = rs.getInt("tour_order");
				String spotsName = rs.getString("spots_name");
				int adultFee = rs.getInt("adult_fee");
				int otherFee = rs.getInt("other_fee");
				String startHour = rs.getString("start_hour");
				String endHour = rs.getString("end_hour");
				
				TourListVO spotVO = new TourListVO();
				
				spotVO.setTourNum(tourNum);
				spotVO.setTourName(tourName);
				spotVO.setThumImg(thumImg);
				spotVO.setTourOrder(tourOrder);
				spotVO.setSpotsName(spotsName);
				spotVO.setAdultFee(adultFee);
				spotVO.setOtherFee(otherFee);
				spotVO.setStartHour(startHour);
				spotVO.setEndHour(endHour);
				
				spotList.add(spotVO);
				
				//System.out.println(spotList);
				//System.out.println(tourNum+tourName+thumImg+spotsName+adultFee+otherFee+startHour+endHour);
//				spotList.add(tourVO);	
//				System.out.println(tourVO.getTourNum()+tourVO.getTourName()+tourVO.getThumImg()+tourVO.getSpotsName()+
//						tourVO.getAdultFee()+tourVO.getOtherFee()+tourVO.getStartHour()+tourVO.getEndHour());
				
			}
		}finally {
			dbCon.dbClose(rs, pstmt, conn);
		}	
		return spotList;
	}// 선택한투어 관광지 리스트

	public TourListVO selectSpots(String spot) throws SQLException {
		TourListVO spotTourVO = new TourListVO();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dbCon.getConn();
			
			String sql = " select t.tour_name, t.tour_num, s.spots_name, s.spots_img, s.spo_content"
					+ " from tour t, tour_spots s"
					+ " where s.spots_name =? "
					+ " and t.tour_num = s.tour_num";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, spot);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				spotTourVO.setTourName(rs.getString("tour_name"));
				spotTourVO.setTourNum(rs.getInt("tour_num"));
				spotTourVO.setSpotsName(rs.getString("spots_name"));
				spotTourVO.setSpotsImg(rs.getString("spots_img"));
				spotTourVO.setSpoContent(rs.getString("spo_content"));
				
				System.out.println(spotTourVO.getTourName()+spotTourVO.getSpotsName()+spotTourVO.getSpotsImg()+spotTourVO.getSpoContent());
			}
		}finally {
			dbCon.dbClose(rs, pstmt, conn);
		}		
		return spotTourVO;
	}// 관광지 상세보기

	public TourListVO selectCenterSpotMap(int tourNum) throws SQLException {
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
			//pstmt.setInt(1, tourNum);
			pstmt.setInt(1, tourNum);
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
	}// 관광지 중심위도경도 가져오기

	public List<TourListVO> selectSpotMap(int tourNum) throws SQLException {
		List<TourListVO> list = new ArrayList<TourListVO>();

		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbCon.getConn();

			StringBuilder selectMap = new StringBuilder();
			selectMap.append("	select spots_name,map_spo_lati,map_spo_long ").append("	from tour_spots")
					.append("	where tour_num=?");
			pstmt = conn.prepareStatement(selectMap.toString());
			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, tourNum);
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.

			while (rs.next()) {
				TourListVO tlVO = new TourListVO();
				tlVO.setSpotsName(rs.getString("spots_name"));
				tlVO.setMapSpoLati(rs.getDouble("map_spo_lati"));
				tlVO.setMapSpoLong(rs.getDouble("map_spo_long"));
				list.add(tlVO);
			}
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}

		return list;
	}// 관광지 관광지별위도경도 가져오기

	public static void main(String[] args) throws SQLException {
		//TourListVO tourVO = new TourListVO();
		TourListVO toli = new TourListVO();
		TourListDAO tourDAO = TourListDAO.getInstance();
		// 관광지 전체 리스트 조회
		//List<TourListVO> list = tourDAO.selectAllTour(tourVO);
		
		// 특정 관광지 내용 조회
		 toli =tourDAO.selectTourSpots(1);
		 
		//특정 관광지 코스 조회
		// List<TourListVO> spotList =tourDAO.selectTourCourse(1);
		
		//특정 관광지 상세 조회
		TourListVO spotTourVO = new TourListVO();
		 spotTourVO = tourDAO.selectSpots("중남미문화원");
	}
}
