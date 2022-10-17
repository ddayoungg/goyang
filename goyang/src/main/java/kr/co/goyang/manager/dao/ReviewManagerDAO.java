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
import kr.co.goyang.user.vo.TourReviewVO;

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
	
	public ReviewManagerVO getreviewDetail(int reviewNum) {
		String SQL="select review_num, title, rev_content, review_img, rev_write_date, id, tour_num FROM TOUR_REVIEW WHERE review_num=?";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ReviewManagerVO rv=null;
		DbConnection db=DbConnection.getInstance();
		try {
		//1.드라이버 로딩
		//2.커넥션 얻기
			con=db.getConn();
		//3.쿼리문 생성객체 얻기
			pstmt=con.prepareStatement(SQL);//쿼리문을 넣어 쿼리문 실행 객체를 얻는다.
		//4.바인드변수 값 설정
			pstmt.setInt(1, reviewNum);
			
		//5.쿼리문 수행 후 결과 얻기
			rs= pstmt.executeQuery();
			if(rs.next()) {
				rv=new ReviewManagerVO();
				rv.setReviewNum(rs.getInt(1));
				rv.setTitle(rs.getString(2));
				rv.setRevContent(rs.getString(3));
				rv.setReviewImg(rs.getString(4));
				rv.setRevWriteDate(rs.getDate(5));
				rv.setId(rs.getString(6));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return rv; //db오류
	}
	
	public List<ReviewManagerVO> selectSearchReview(ReviewManagerVO rmVO) throws SQLException { // 후기 검색
		List<ReviewManagerVO> reviewList = new ArrayList<ReviewManagerVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;

		DbConnection db = DbConnection.getInstance();
		try {
			// 1. 드라이버 로딩
			// 2. 커넥션 얻기
			con = db.getConn();

			// 3. 쿼리문 생성 객체 얻기
			StringBuilder selectReview = new StringBuilder();
			selectReview
			.append("	select	review_num, title, rev_content, review_img, rev_write_date, id, tour_num	")
			.append("	from	tour_review	");

			if(rmVO.getTourNum() != 0 || (rmVO.getTextSearch() != null && rmVO.getTextSearch() != "")) {
				if (rmVO.getTourNum() != 0) {
					selectReview.append("	where tour_num=?	");
					cnt++;
				}
				
				if (rmVO.getTextSearch() != null && rmVO.getTextSearch() != "") {
					selectReview.append("	where title like ?	");
					cnt++;
				}
			}
			selectReview.append("	order by review_num	");
			
			pstmt = con.prepareStatement(selectReview.toString());

			// 4. 바인드 변수에 값 설정
			if(cnt == 2) {
				pstmt.setInt(1, rmVO.getTourNum());
				pstmt.setString(2, '%'+rmVO.getTextSearch()+'%');
			}else {
				if (rmVO.getTourNum() != 0) {
					pstmt.setInt(1, rmVO.getTourNum());
				}
				
				if (rmVO.getTextSearch() != null && rmVO.getTextSearch() != "") {
					pstmt.setString(1, '%'+rmVO.getTextSearch()+'%');
				}
			}
			
			// 5. 쿼리문 수행 결과 얻기
			rs = pstmt.executeQuery();

			while (rs.next()) {// 조회된 레코드가 있음
				rmVO = new ReviewManagerVO();
				// setter method를 호출하여 값을 설정 => 필요한 값만 넣을 수 있고 어떤 값을 넣는지 알 수 있음
				rmVO.setReviewNum(rs.getInt("review_num"));
				rmVO.setTitle(rs.getString("title"));
				rmVO.setRevContent(rs.getString("rev_content"));
				rmVO.setReviewImg(rs.getString("review_img"));
				rmVO.setRevWriteDate(rs.getDate("rev_write_date"));
				rmVO.setId(rs.getString("id"));
				rmVO.setTourNum(rs.getInt("tour_num"));

				reviewList.add(rmVO);
			}
		} finally {
			// 6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}

		return reviewList;
	}// selectSearchReview
	
	public int deleteReview(int reviewNum) throws SQLException  { // 후기 삭제
		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection db = DbConnection.getInstance();

		try {
			// 1. 드라이버 로딩
			// 2. connection 얻기
			con = db.getConn();

			// 3. 쿼리문 생성 객체 얻기
			String deleteReview = "delete from tour_review where review_num=?";
			pstmt = con.prepareStatement(deleteReview);

			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, reviewNum);

			// 5. 쿼리문 수행 결과 얻기
			return pstmt.executeUpdate(); // 리턴되는 값 : 0(사원번호가 없음, 삭제된 행 없음) 또는 1(삭제된 행이 1개)
		} catch(Exception ne	) {
			ne.printStackTrace();
		} finally {
			// 6. 연결 끊기
			db.dbClose(null, pstmt, con);
		}

		return -1;
	}// deleteReview
	
	public List<String> selectTourName() throws SQLException { // 투어이름
		List<String> tourNames = null;

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

			selectTourNames.append("	select tour_num,tour_name	")
			.append("	from tour	")
			.append("	where run_flag=1 order by tour_num	");

			pstmt = con.prepareStatement(selectTourNames.toString());
			
			// 5. 쿼리문 수행 결과 얻기
			rs = pstmt.executeQuery();
			tourNames = new ArrayList<String>();

			while (rs.next()) {// 조회된 레코드가 있음
				tourNames.add(rs.getString("tour_name"));
			}
		} finally {
			// 6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		return tourNames;
	}
	
	
	public List<ReviewManagerVO> selectCommend(int reviewNum) throws SQLException { // 댓글보기
		List<ReviewManagerVO> commList = new ArrayList<ReviewManagerVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();
		try {
			// 1. 드라이버 로딩
			// 2. 커넥션 얻기
			con = db.getConn();
			
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder selectCommend = new StringBuilder();

			selectCommend
			.append("	select commend_num, com_content, com_write_date,  review_num, id	")
			.append("	from	tour_commend	")
			.append("	where	com_del_flag=1 and review_num=?	")
			.append("	order by commend_num	");

			pstmt = con.prepareStatement(selectCommend.toString());

			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, reviewNum);

			// 5. 쿼리문 수행 결과 얻기
			rs = pstmt.executeQuery();

			while (rs.next()) {// 조회된 레코드가 있음
				// 조회 컬럼 값을 저장하기 위해 VO를 생성
				ReviewManagerVO trVO = new ReviewManagerVO();
				// setter method를 호출하여 값을 설정 => 필요한 값만 넣을 수 있고 어떤 값을 넣는지 알 수 있음
				trVO.setCommendNum(rs.getInt("commend_num"));
				trVO.setComContent(rs.getString("com_content"));
				trVO.setComWriteDate(rs.getDate("com_write_date"));
				trVO.setReviewNum(rs.getInt("review_num"));
				trVO.setId(rs.getString("id"));

				commList.add(trVO);
			}
		} finally {
			// 6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		// return trVO1;

		return commList;

	}// selectCommend


}//DAO
