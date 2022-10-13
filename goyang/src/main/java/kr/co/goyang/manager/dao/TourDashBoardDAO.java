package kr.co.goyang.manager.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import kr.co.goyang.dbConnection.DbConnection;
import kr.co.goyang.manager.vo.TourDashBoardVO;

public class TourDashBoardDAO {

	private static TourDashBoardDAO tourDAO;

	private TourDashBoardDAO() {

	}
 
	public static TourDashBoardDAO getInstance() {
		if (tourDAO == null) {
			tourDAO = new TourDashBoardDAO();
		}
		return tourDAO;
	}

	// 회원통계 (총 회원수,최근회원,탈퇴회원)
	@SuppressWarnings("resource")
	public int[] selectStatiUser() throws SQLException {
		int[] userTotal = new int[2]; // 신규회원,탈퇴회원
		int cntRecent = 0;
		int cntOut = 0;

		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		try {
			conn = dbCon.getConn();
			/////////////////// 최근 가입회원조회/////////////////
			StringBuilder selectRecentUser = new StringBuilder();
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("MM");
			String nowMonth = sdf.format(now); // 현재 달 구하기
			selectRecentUser
			.append("	select join_date ")
			.append("	from tour_user");
			pstmt = conn.prepareStatement(selectRecentUser.toString());
			// 4. 바인드 변수에 값 설정
			// pstmt.setString(1, dong+"%");
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.

			while (rs.next()) {
				if (sdf.format(rs.getDate("join_date")).equals(nowMonth)) {
					cntRecent++;
				}
			}
			userTotal[0] = cntRecent;
			///////////////////// 최근 탈퇴회원조회//////////////////
			// pstmt.clearParameters();

			StringBuilder selectOutUser = new StringBuilder();
			selectOutUser
			.append("	select out_date ")
			.append("	from user_out");
			pstmt = conn.prepareStatement(selectOutUser.toString());
			// 4. 바인드 변수에 값 설정
			// pstmt.setString(1, dong+"%");
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.

			while (rs.next()) {
				if (sdf.format(rs.getDate("out_date")).equals(nowMonth)) {
					cntOut++;
				}
			}
			userTotal[1] = cntOut;

		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}

		return userTotal;

	}

	// 총 후기수
	public int selectStatiReview() throws SQLException {
		int reviewCnt = 0;

		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbCon.getConn();
			/////////////////// 전체 회원수/////////////////////
			StringBuilder selectAllReview = new StringBuilder();
			selectAllReview
			.append("	select review_num ")
			.append("	from tour_review");
			pstmt = conn.prepareStatement(selectAllReview.toString());
			// 4. 바인드 변수에 값 설정
			// pstmt.setString(1, dong+"%");
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.

			while (rs.next()) {
				rs.getString("review_num");
				reviewCnt++;
			}
			return reviewCnt;
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}

	}

	// 예약통계 (현재 달)
	public Map<String, Integer> selectStatiReserva() throws SQLException {
		Map<String, Integer> reserMap = new HashMap<String, Integer>();

		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbCon.getConn();
			/////////////////// 전체 회원수/////////////////////
			StringBuilder selectReserva = new StringBuilder();
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("MM");
			String nowMonth = sdf.format(now); // 현재 달 구하기
			selectReserva
			.append("	select tour.tour_name,tour_reserva.reser_date ")
			.append("	from tour,tour_reserva")
			.append("	where tour.tour_num=tour_reserva.tour_num");
			pstmt = conn.prepareStatement(selectReserva.toString());
			// 4. 바인드 변수에 값 설정
			// pstmt.setString(1, dong+"%");
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.

			while (rs.next()) {
				if (sdf.format(rs.getDate("reser_date")).equals(nowMonth)) {
					String reser = rs.getString("tour_name");
					if (reserMap.containsKey(reser)) {
						int cnt = reserMap.get(reser) + 1;
						reserMap.put(reser, cnt);
					} else {
						reserMap.put(reser, 1);
					}
				}

			}
			return reserMap;
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}

	}

	// 관광지 통계
	public Map<String, Integer> selectStatiSpots() throws SQLException {

		Map<String, Integer> spotsMap = new HashMap<String, Integer>();
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbCon.getConn();
			/////////////////// 전체 회원수/////////////////////
			StringBuilder selectSpots = new StringBuilder();
			selectSpots.append("	select tour.tour_name ").append("	from tour,tour_spots")
					.append("	where tour.tour_num=tour_spots.tour_num");
			pstmt = conn.prepareStatement(selectSpots.toString());
			// 4. 바인드 변수에 값 설정
			// pstmt.setString(1, dong+"%");
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.

			while (rs.next()) {
				String reser = rs.getString("tour_name");
				if (spotsMap.containsKey(reser)) {// 키가 있으면
					int cnt = spotsMap.get(reser) + 1; // + 1
					spotsMap.put(reser, cnt);
				} else {
					spotsMap.put(reser, 1); // 없으면 1
				}

			}
			return spotsMap;
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}
	}

	// 총 투어수
	public int selectStatiTour() throws SQLException {
		int tourCnt = 0;

		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbCon.getConn();
			/////////////////// 전체 회원수/////////////////////
			StringBuilder selectAllTour = new StringBuilder();
			selectAllTour.append("	select tour_num ").append("	from tour");
			pstmt = conn.prepareStatement(selectAllTour.toString());
			// 4. 바인드 변수에 값 설정
			// pstmt.setString(1, dong+"%");
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.

			while (rs.next()) {
				rs.getString("tour_num");
				tourCnt++;
			}
			return tourCnt;
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}
 
	}

	public static void main(String[] args) {
		TourDashBoardDAO tour = TourDashBoardDAO.getInstance();
		try {
			int[] get = tour.selectStatiUser();
			int reviewCnt = tour.selectStatiReview();
			int tourCnt = tour.selectStatiTour();
			Map<String, Integer> reserMap = tour.selectStatiReserva();
			Map<String, Integer> spotsMap = tour.selectStatiSpots();
			System.out.println("최근회원(9월):  " + get[0] + "명 탈퇴회원(9월):  " + get[1] + "명");
			System.out.println("총 리뷰수: " + reviewCnt + "건");
			System.out.println("총 투어수: " + tourCnt + "코스");
			for (String key : reserMap.keySet()) {
				int value = reserMap.get(key);
				System.out.println("투어이름 : " + key + ", 예약횟수 : " + value);
			}
			System.out.println("----------------------------------");
			for (String key : spotsMap.keySet()) {
				int value = spotsMap.get(key);
				System.out.println("투어이름 : " + key + ", 관광지개수 : " + value);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println();

	}

}
