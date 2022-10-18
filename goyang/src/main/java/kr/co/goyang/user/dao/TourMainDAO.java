package kr.co.goyang.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.dbConnection.DbConnection;
import kr.co.goyang.user.vo.ReviewMainVO;
import kr.co.goyang.user.vo.TourMainVO;

public class TourMainDAO {
	private static TourMainDAO tourDao;
	
	private TourMainDAO() {
		
	}
	
	public static TourMainDAO getInstance() {
		if ( tourDao == null ) {
			tourDao = new TourMainDAO();
		}
		return tourDao;
	}//getInstance
	
	public List<TourMainVO> selectMainTour () throws SQLException{
		List<TourMainVO> mainList = new ArrayList<TourMainVO>();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 

		try {
			conn = dbCon.getConn();
			
			StringBuilder selectAllTour = new StringBuilder();
			selectAllTour
			.append("	select tour_name,explain,thum_img,tour_num ")
			.append("	from tour")
			.append("	where run_flag=1");
			pstmt = conn.prepareStatement(selectAllTour.toString());
			// 4. 바인드 변수에 값 설정
			// pstmt.setString(1, dong+"%");
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.
			
			TourMainVO tmVO=null;

			while (rs.next()) {
				tmVO=new TourMainVO();
				tmVO.setTourName(rs.getString("tour_name"));
				tmVO.setExplain(rs.getString("explain"));
				tmVO.setThum_img(rs.getString("thum_img"));
				tmVO.setTourNum(rs.getInt("tour_num"));
				mainList.add(tmVO);
			}
			return mainList;
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}

	}//list
	
	public List<ReviewMainVO> selectMainReivew () throws SQLException{
		List<ReviewMainVO> reviewList = new ArrayList<ReviewMainVO>();

		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbCon.getConn();
			
			StringBuilder selectReview = new StringBuilder();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			selectReview
			.append("	select tour_name,review_num,title,id,rev_write_date")
			.append("	from tour,tour_review")
			.append("	where tour.tour_num=tour_review.tour_num and rownum<6")
			.append("	order by review_num desc");
			pstmt = conn.prepareStatement(selectReview.toString());
			// 4. 바인드 변수에 값 설정
			// pstmt.setString(1, dong+"%");
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.
			
			ReviewMainVO rvVO=null;

			while (rs.next()) {
				rvVO=new ReviewMainVO();
				rvVO.setTourName(rs.getString("tour_name"));
				rvVO.setReviewNum(rs.getInt("review_num"));
				rvVO.setTitle(rs.getString("title"));
				rvVO.setId(rs.getString("id"));
				rvVO.setRevDate(sdf.format(rs.getDate("rev_write_date")));
				reviewList.add(rvVO);
			}
			return reviewList;
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}
		
	}//list
	
	public static void main(String[] args) {
		TourMainDAO tmDAO=TourMainDAO.getInstance();
		try {
			List<TourMainVO> mainList=tmDAO.selectMainTour();
			List<ReviewMainVO> reviewList=tmDAO.selectMainReivew();
			for(TourMainVO tmVO : mainList) {
				System.out.println("투어제목: "+tmVO.getTourName()+" 내용: "+tmVO.getExplain()+" 사진파일명: "+tmVO.getThum_img());
			}
			System.out.println("---------------------------------------------------------");
			for(ReviewMainVO rvVO : reviewList) {
				System.out.println("후기번호: "+rvVO.getReviewNum()+" 제목: "+rvVO.getTitle()+" ID: "+rvVO.getId());
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}//DAO
