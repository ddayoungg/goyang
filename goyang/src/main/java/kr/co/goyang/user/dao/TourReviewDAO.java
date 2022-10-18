package kr.co.goyang.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.user.vo.TourReviewVO;
import kr.co.goyang.dbConnection.DbConnection;
import kr.co.goyang.manager.vo.UserManagerVO;

public class TourReviewDAO {

	private static TourReviewDAO instance = null;

	private TourReviewDAO() {
	}

	public static TourReviewDAO getInstance() {
		if (instance == null) {
			synchronized (TourReviewDAO.class) {
				instance = new TourReviewDAO();
			}
		}
		return instance;
	}

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

			selectTourNames.append("	select tour_name	")
			.append("	from tour	")
			.append("	order by tour_num	");

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

	@SuppressWarnings("resource")
	public void insertReview(TourReviewVO trVO) throws SQLException { // 후기 작성
		// 1. 드라이버 로딩
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 2. connection 얻기
			con = dc.getConn();

			// 3. 쿼리문 생성 객체 얻기
			StringBuilder selectRevMax = new StringBuilder();
			selectRevMax
			.append("	select max(review_num)	")
			.append("	from tour_review	");
			pstmt = con.prepareStatement(selectRevMax.toString());
			rs = pstmt.executeQuery();
			
			int reviewNumber = 1;
			if(rs.next()) {
				reviewNumber = rs.getInt(1)+1;
			}
			////////////////////////////////////////////////////////////////////////
			StringBuilder insertReview = new StringBuilder();
			insertReview
			.append("	insert into tour_review(review_num, title, rev_content, review_img, rev_write_date, id, tour_num)	")
			.append("	values(?, ?, ?, ?, sysdate, ?, ?)	");
			pstmt = con.prepareStatement(insertReview.toString());
			
			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, reviewNumber);
			pstmt.setString(2, trVO.getTitle());
			pstmt.setString(3, trVO.getRevContent());
			pstmt.setString(4, trVO.getReviewImg());
			pstmt.setString(5, trVO.getId());
			pstmt.setInt(6, trVO.getTourNum());

			// 5. 쿼리문 수행 결과 얻기
			pstmt.executeUpdate();

		} finally {
			// 6. 연결 끊기
			dc.dbClose(rs, pstmt, con);
		}
	}// insertReview

	public int updateReview(TourReviewVO trVO) throws SQLException { // 후기 수정
		int upCnt = 0;

		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			// 1.드라이버 로딩
			// 2.connection 얻기
			con = dc.getConn();

			// 3.쿼리문 생성 객체 얻기
			StringBuilder updateReview = new StringBuilder();
			updateReview.append("	update	tour_review	")
					.append("	set		title=?, rev_content=?, review_img=?, rev_write_date=sysdate, tour_num=?	")
					.append("	where	review_num=?	");

			pstmt = con.prepareStatement(updateReview.toString());

			// 4.바인드 변수에 값 설정
			pstmt.setString(1, trVO.getTitle());
			pstmt.setString(2, trVO.getRevContent());
			pstmt.setString(3, trVO.getReviewImg());
			pstmt.setInt(4, trVO.getTourNum());
			pstmt.setInt(5, trVO.getReviewNum());

			// 5.쿼리문 수행 결과 얻기
			upCnt = pstmt.executeUpdate();

		} finally {
			// 6.연결 끊기
			dc.dbClose(null, pstmt, con);
		}

		return upCnt;
	}// updateReview

	@SuppressWarnings("resource")
	public void insertCommend(TourReviewVO trVO) throws SQLException { // 댓글 작성
		// 1. 드라이버 로딩
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 2. connection 얻기
			con = dc.getConn();
			
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder selectComCnt = new StringBuilder();
			selectComCnt
			.append("	select max(commend_num)	")
			.append("	from tour_commend	");
			
			pstmt = con.prepareStatement(selectComCnt.toString());
			rs = pstmt.executeQuery();
			
			int commendNumber = 1;
			if(rs.next()) {
				commendNumber = rs.getInt(1)+1;
			}
			////////////////////////////////////////////////////////////////////////

			// 3. 쿼리문 생성 객체 얻기
			StringBuilder insertComm = new StringBuilder();
			insertComm
			.append("	insert into tour_commend(commend_num, com_content, com_write_date, review_num, id)	")
			.append("	values(?,?,sysdate,?,?)	");

			pstmt = con.prepareStatement(insertComm.toString());// 쿼리문을 넣어 쿼리문 실행 객체를 얻는다.

			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, commendNumber);
			pstmt.setString(2, trVO.getComContent());
			pstmt.setInt(3, trVO.getReviewNum());
			pstmt.setString(4, trVO.getId());
			// 5. 쿼리문 수행 결과 얻기
			pstmt.executeUpdate();

		} finally {
			// 6. 연결 끊기
			dc.dbClose(null, pstmt, con);
		}
	}// insertCommend

	public int updateCommend(TourReviewVO trVO) throws SQLException { // 댓글 수정
		int upCnt = 0;
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			// 1.드라이버 로딩
			// 2.connection 얻기
			con = dc.getConn();

			// 3.쿼리문 생성 객체 얻기
			StringBuilder updateComm = new StringBuilder();
			updateComm
			.append("	update	tour_commend	")
			.append("	set		com_content=?, com_write_date=?	")
			.append("	where	commend_num=?	");

			pstmt = con.prepareStatement(updateComm.toString());

			// 4.바인드 변수에 값 설정
			pstmt.setString(1, trVO.getComContent());
			pstmt.setDate(2, trVO.getComWriteDate());
			pstmt.setInt(3, trVO.getCommendNum());

			// 5.쿼리문 수행 결과 얻기
			upCnt = pstmt.executeUpdate();

		} finally {
			// 6.연결 끊기
			dc.dbClose(null, pstmt, con);
		}

		return upCnt;
	}// updateCommend

	public TourReviewVO selectReview(int reviewNum) throws SQLException { // 후기 상세 보기
		TourReviewVO trVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();
		try {
			// 1. 드라이버 로딩
			// 2. 커넥션 얻기
			con = db.getConn();

			// 3. 쿼리문 생성 객체 얻기
			StringBuilder selectReview = new StringBuilder();
			
			selectReview.append("	select	review_num, title, rev_content, review_img, rev_write_date, id, tour_num	")
			.append("	from	tour_review		")
			.append("	where	review_num=?	");

			pstmt = con.prepareStatement(selectReview.toString());

			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, reviewNum);

			// 5. 쿼리문 수행 결과 얻기
			rs = pstmt.executeQuery();

			if (rs.next()) {// 조회된 레코드가 있음
				// 조회 컬럼 값을 저장하기 위해 VO를 생성
				trVO = new TourReviewVO();
				// setter method를 호출하여 값을 설정 => 필요한 값만 넣을 수 있고 어떤 값을 넣는지 알 수 있음
				/*
				 * //review_num, title, rev_content, review_img, rev_write_date, id, tour_num
				 */				
				trVO.setReviewNum(rs.getInt("review_num"));
				trVO.setTitle(rs.getString("title"));
				trVO.setRevContent(rs.getString("rev_content"));
				trVO.setReviewImg(rs.getString("review_img"));
				trVO.setRevWriteDate(rs.getDate("rev_write_date"));
				trVO.setId(rs.getString("id"));
			}
		} finally {
			// 6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		return trVO;
	}// selectReview

	public List<TourReviewVO> selectCommend(int reviewNum) throws SQLException { // 댓글보기
		List<TourReviewVO> commList = new ArrayList<TourReviewVO>();

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
			.append("	select commend_num, com_content, com_write_date, review_num, id	")
			.append("	from	tour_commend	")
			.append("	where	review_num=?	")
			.append("	order by commend_num	");

			pstmt = con.prepareStatement(selectCommend.toString());

			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, reviewNum);

			// 5. 쿼리문 수행 결과 얻기
			rs = pstmt.executeQuery();

			while (rs.next()) {// 조회된 레코드가 있음
				// 조회 컬럼 값을 저장하기 위해 VO를 생성
				TourReviewVO trVO = new TourReviewVO();
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

	public List<TourReviewVO> selectSearchReview(TourReviewVO trVO) throws SQLException { // 후기 검색
		List<TourReviewVO> reviewList = new ArrayList<TourReviewVO>();

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

			if(trVO.getTourNum() != 0 || (trVO.getTextSearch() != null && trVO.getTextSearch() != "")) {
				if (trVO.getTourNum() != 0) {
					selectReview.append("	where tour_num=?	");
					cnt++;
				}
				
				if (trVO.getTextSearch() != null && trVO.getTextSearch() != "" ) {
					if(cnt==0) {
						selectReview.append("	where title like ?	");
					}else {
						selectReview.append("	and title like ?	");
					}
					cnt++;
				}
			}
			selectReview.append("	order by review_num desc	");
			
			pstmt = con.prepareStatement(selectReview.toString());

			// 4. 바인드 변수에 값 설정
			if(cnt == 2) {
				pstmt.setInt(1, trVO.getTourNum());
				pstmt.setString(2, '%'+trVO.getTextSearch()+'%');
			}else {
				if (trVO.getTourNum() != 0) {
					pstmt.setInt(1, trVO.getTourNum());
				}
				
				if (trVO.getTextSearch() != null && trVO.getTextSearch() != "") {
					pstmt.setString(1, '%'+trVO.getTextSearch()+'%');
				}
			}
			
			// 5. 쿼리문 수행 결과 얻기
			rs = pstmt.executeQuery();

			while (rs.next()) {// 조회된 레코드가 있음
				trVO = new TourReviewVO();
				// setter method를 호출하여 값을 설정 => 필요한 값만 넣을 수 있고 어떤 값을 넣는지 알 수 있음
				trVO.setReviewNum(rs.getInt("review_num"));
				trVO.setTitle(rs.getString("title"));
				trVO.setRevContent(rs.getString("rev_content"));
				trVO.setReviewImg(rs.getString("review_img"));
				trVO.setRevWriteDate(rs.getDate("rev_write_date"));
				trVO.setId(rs.getString("id"));
				trVO.setTourNum(rs.getInt("tour_num"));

				reviewList.add(trVO);
			}
		} finally {
			// 6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		// return trVO1;

		return reviewList;
	}// selectSearchReview

	public int deleteReview(int reviewNum, Connection con) throws SQLException { // 후기 삭제
		int delCnt = 0;
		PreparedStatement pstmt = null;
		
		// 1. 드라이버 로딩
		// 2. connection 얻기

		// 3. 쿼리문 생성 객체 얻기
		String deleteReview = "delete from tour_review where review_num=?";
		pstmt = con.prepareStatement(deleteReview);

		// 4. 바인드 변수에 값 설정
		pstmt.setInt(1, reviewNum);

		// 5. 쿼리문 수행 결과 얻기
		delCnt = pstmt.executeUpdate(); // 리턴되는 값 : 0(사원번호가 없음, 삭제된 행 없음) 또는 1(삭제된 행이 1개)

		// 연결 끊기
		if(pstmt!=null) { pstmt.close(); };
				
		return delCnt;
	}// deleteReview
	
	public int deleteComm(int commendNum) throws SQLException { // 댓글 삭제
		int delCnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			// 1. 드라이버 로딩
			// 2. connection 얻기
			con = db.getConn();
			
			// 3. 쿼리문 생성 객체 얻기
			String deleteComm = "delete from tour_commend where commend_num=?";
			pstmt = con.prepareStatement(deleteComm);
			
			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, commendNum);
			
			// 5. 쿼리문 수행 결과 얻기
			delCnt = pstmt.executeUpdate(); // 리턴되는 값 : 0(사원번호가 없음, 삭제된 행 없음) 또는 1(삭제된 행이 1개)
			
		} finally {
			// 6. 연결 끊기
			db.dbClose(null, pstmt, con);
		}
		
		return delCnt;
	}// deleteReview
	
	public int deleteCommRev(int reviewNum, Connection con) throws SQLException { // 댓글 삭제
		System.out.println("aa");
		int delCnt = 0;
		PreparedStatement pstmt = null;
		
		// 1. 드라이버 로딩
		// 2. connection 얻기
		
		// 3. 쿼리문 생성 객체 얻기
		System.out.println("b");
		String deleteComm = "delete from tour_commend where review_num=?";
		pstmt = con.prepareStatement(deleteComm);
		System.out.println("c");
		
		// 4. 바인드 변수에 값 설정
		pstmt.setInt(1, reviewNum);
		System.out.println("d");
		
		// 5. 쿼리문 수행 결과 얻기
		delCnt = pstmt.executeUpdate(); // 리턴되는 값 : 0(사원번호가 없음, 삭제된 행 없음) 또는 1(삭제된 행이 1개)
		System.out.println(delCnt);
			
		// 연결 끊기
		if(pstmt!=null) { pstmt.close(); };
		System.out.println("f");
				
		return delCnt;
	}// deleteReview
	
	
	public void tranReview(int reviewNum) { // 트랜잭션 처리
		System.out.println("3");
		DbConnection dc=DbConnection.getInstance();
		
		Connection con=null;
		try {
			con=dc.getConn();
			con.setAutoCommit(false);
			
			System.out.println("4");
			deleteCommRev(reviewNum, con);
			System.out.println("5");
			deleteReview(reviewNum, con);
			System.out.println("6");
			
			con.commit();
			System.out.println("commit 성공");
		} catch (SQLException e) {
			try {
				System.out.println("트랜잭션 실패");
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			} // end catch
			e.printStackTrace();
		}finally {
			try {//6.연결 끊기
				con.setAutoCommit(true);//오토커밋 설정
				if(con!=null) {con.close();}//end if
			} catch (SQLException e) {
				e.printStackTrace();
			}//end catch
		}//end finally
	}//tranUser

}// class
