package kr.co.goyang.manager.dao;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.dbConnection.DbConnection;
import kr.co.goyang.manager.vo.ReviewManagerVO;
import kr.co.goyang.user.vo.UserVO;

public class ReviewManagerDAO {
	private static ReviewManagerDAO tourDao;
	
	public ReviewManagerDAO() {
		
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
	
	public String getDate() {
		String SQL="select sysdate from tour_review";
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		try {
		//1.드라이버 로딩
		//2.커넥션 얻기
			con=db.getConn();
		//3.쿼리문 생성객체 얻기
			pstmt=con.prepareStatement(SQL);//쿼리문을 넣어 쿼리문 실행 객체를 얻는다.

		//4.바인드변수 값 설정
		//5.쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {//조회된 레코드가 있음
				return rs.getString(1);
			}
			}catch(Exception e) {
				e.printStackTrace();
		}
		return SQL;
		
	}
	
	public int getNext() {
		String SQL="select review_num from tour_review order by review_num desc";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DbConnection db=DbConnection.getInstance();
		
		try {
			con=db.getConn();
			pstmt=con.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; //첫번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<ReviewManagerVO> getList(int pageNumber){
		String SQL="select * from tour_review where rownum <=10 and REVIEW_NUM < ? order by REVIEW_NUM DESC";
		ArrayList<ReviewManagerVO> list=new ArrayList<ReviewManagerVO>();

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		try {
		//1.드라이버 로딩
		//2.커넥션 얻기
			con=db.getConn();
		//3.쿼리문 생성객체 얻기
			pstmt=con.prepareStatement(SQL);//쿼리문을 넣어 쿼리문 실행 객체를 얻는다.
			pstmt.setInt(1, getNext() - (pageNumber -1)*10);
		//4.바인드변수 값 설정
			
		//5.쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ReviewManagerVO rv=new ReviewManagerVO();
				rv.setReviewNum(rs.getInt(1));
				rv.setTitle(rs.getString(2));
				rv.setRevContent(rs.getString(3));
				rv.setReviewImg(rs.getString(4));
				rv.setRevWriteDate(rs.getDate(5));
				rv.setId(rs.getString(6));
				rv.setTourNum(rs.getInt(7));
				list.add(rv);
			}
			}catch(Exception e) {
				e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL="select * from tour_review where review_num < ?";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		try {
		//1.드라이버 로딩
		//2.커넥션 얻기
			con=db.getConn();
		//3.쿼리문 생성객체 얻기
			pstmt=con.prepareStatement(SQL);//쿼리문을 넣어 쿼리문 실행 객체를 얻는다.
			pstmt.setInt(1, getNext() - (pageNumber -1)*10);
		//4.바인드변수 값 설정
			
		//5.쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			}catch(Exception e) {
				e.printStackTrace();
		}
		return false;
	}
	/* 다영수정 */
	public List<ReviewManagerVO> selectTourNameNum() throws SQLException { // 투어이름,넘버가져오기
		List<ReviewManagerVO> tourNames = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();
		try {
			// 1. 드라이버 로딩
			// 2. 커넥션 얻기
			con = db.getConn();

			// 3. 쿼리문 생성 객체 얻기
			StringBuilder selectTourNames = new StringBuilder();

			selectTourNames.append("	select tour.tour_name,tour_review.tour_num	")
			.append("	from tour,tour_review	")
			.append("	where tour.tour_num=tour_review.tour_num	")
			.append("	order by REVIEW_NUM DESC	");

			pstmt = con.prepareStatement(selectTourNames.toString());
			
			// 5. 쿼리문 수행 결과 얻기
			rs = pstmt.executeQuery();
			tourNames = new ArrayList<ReviewManagerVO>();

			while (rs.next()) {// 조회된 레코드가 있음
				ReviewManagerVO uVO=new ReviewManagerVO();
				uVO.setTourNum(rs.getInt("tour_num"));
				uVO.setTourName(rs.getString("tour_name"));
				tourNames.add(uVO);
			}
		} finally {
			// 6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		return tourNames;
	}
	/* 다영수정 */
}//DAO
