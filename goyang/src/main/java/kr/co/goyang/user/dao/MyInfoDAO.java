package kr.co.goyang.user.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.dbConnection.DbConnection;
import kr.co.goyang.user.vo.MyInfoVO;
import kr.co.sist.util.cipher.DataEncrypt;

public class MyInfoDAO {
	private static MyInfoDAO infoDao;

	private MyInfoDAO() {

	}// MyInfoDAO

	public static MyInfoDAO getInstance() {
		if (infoDao == null) {
			infoDao = new MyInfoDAO();
		}
		return infoDao;
	}

	public boolean selectMyPassConfirm(MyInfoVO miVO) throws SQLException, NoSuchAlgorithmException { // 비밀번호 확인

		boolean flag = false;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			conn = dc.getConn();

			StringBuilder selectMyPassConfirm = new StringBuilder();
			
			selectMyPassConfirm
			.append(" select ID ")
			.append(" from tour_user ")
			.append(" where ID=? AND password=? ");

			pstmt = conn.prepareStatement(selectMyPassConfirm.toString());

			pstmt.setString(1, miVO.getId());
			pstmt.setString(2, DataEncrypt.messageDigest("MD5", miVO.getPassword()));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {//결과값이 없으면 false. 있으면 true
				flag=true;
			}
			
		} finally {
			dc.dbClose(rs, pstmt, conn);
		}

		return flag;

	}// selectMyPassConfirm

	public MyInfoVO selectMyUesrInfo(String id) throws SQLException { // 내 정보
		MyInfoVO miVO = new MyInfoVO();
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();
		try {
			conn = dc.getConn();
			StringBuilder selectMyUesrInfo = new StringBuilder();
			selectMyUesrInfo.append("	select 	ID,	 PASSWORD,	EMAIL, NAME, PHONE, ZIPCODE, ADDR, DE_ADDR, TOUR_NUM")
									.append("	from		TOUR_USER									")
									.append("	where			ID=?										");

			pstmt = conn.prepareStatement(selectMyUesrInfo.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				miVO=new MyInfoVO();
				miVO.setId(rs.getString("ID"));
				miVO.setPassword(rs.getString("PASSWORD"));
				miVO.setEmail(rs.getString("EMAIL"));
				miVO.setName(rs.getString("NAME"));
				miVO.setPhone(rs.getString("PHONE"));
				miVO.setZipcode(rs.getString("ZIPCODE"));
				miVO.setAddr(rs.getString("ADDR"));
				miVO.setDeAddr(rs.getString("DE_ADDR"));
				miVO.setTourNum(rs.getInt("TOUR_NUM"));
			}//if
			
		} finally {
			dc.dbClose(rs, pstmt, conn);
		} // end finally

		return miVO;

	}// selectMyUesrInfo
	
	public List<MyInfoVO> selectTourList() throws SQLException { // 투어 리스트
		List<MyInfoVO> list=new ArrayList<MyInfoVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc = DbConnection.getInstance();
		try {
			conn = dc.getConn();
			StringBuilder selectTourList = new StringBuilder();
			selectTourList
			.append("	SELECT 		TOUR_NUM, TOUR_NAME			")
			.append("	FROM		TOUR					")
			.append("	WHERE		RUN_FLAG=1				")
			.append("	ORDER BY	TOUR_NUM				");
			
			pstmt = conn.prepareStatement(selectTourList.toString());
			
			rs = pstmt.executeQuery();
			
			MyInfoVO miVO=null;
			while(rs.next()) {
				miVO=new MyInfoVO();
				miVO.setTourNum(rs.getInt("TOUR_NUM"));
				miVO.setTourName(rs.getString("TOUR_NAME"));
				
				list.add(miVO);
			}//if
			
		} finally {
			dc.dbClose(rs, pstmt, conn);
		} // end finally
		
		return list;
		
	}// selectTourList
	
	public int updateMyInfo(MyInfoVO miVO) throws SQLException { // 내 정보 수정

		int upCnt = 0;

		DbConnection dc = DbConnection.getInstance();

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dc.getConn();
			StringBuilder updateReserCancel = new StringBuilder();
			updateReserCancel
			.append("	update	TOUR_USER	")
			.append("	set		EMAIL=?, PHONE=?, ZIPCODE=?, ADDR=?, DE_ADDR=?, TOUR_NUM=?	")
			.append("	where 	ID=?		");
			
			
			pstmt = conn.prepareStatement( updateReserCancel.toString());

			pstmt.setString(1, miVO.getEmail());
			pstmt.setString(2, miVO.getPhone());
			pstmt.setString(3, miVO.getZipcode());
			pstmt.setString(4, miVO.getAddr());
			pstmt.setString(5, miVO.getDeAddr());
			pstmt.setInt(6, miVO.getTourNum());
			pstmt.setString(7, miVO.getId());

			upCnt = pstmt.executeUpdate();

		} finally {
			dc.dbClose(null, pstmt, conn);

		}

		return upCnt;
	}// updateReserCancel

	public List<MyInfoVO> selectMyReserList(MyInfoVO miVO) throws SQLException { // 내 예약관리 리스트
		List<MyInfoVO> list = new ArrayList<MyInfoVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
				conn=dc.getConn();
				
				StringBuilder TOUR_RESERVA=new StringBuilder();
				TOUR_RESERVA
				.append("	SELECT		*									")
				.append("	FROM		(SELECT		ROW_NUMBER() OVER (ORDER BY TR.RESER_NUM DESC) RNUM,	")
				.append(" 							TR.RESER_NUM, TR.RESER_DATE, TR.ADULT_CNT, TR.OTHER_CNT, TR.RESER_FLAG, TR.RESER_REGIST, TR.TOUR_NUM, TR.ID,	")
				.append("							T.TOUR_NAME, T.ADULT_FEE, T.OTHER_FEE	")
				.append("				FROM		TOUR_RESERVA TR, TOUR T	")
				.append("				WHERE		TR.TOUR_NUM=T.TOUR_NUM	")
				.append("							AND ID=?				")
				.append("				ORDER BY  	TR.RESER_NUM DESC		")
				.append("				)									")
				.append("	WHERE 		RNUM BETWEEN ? AND ?		");

				pstmt=conn.prepareStatement( TOUR_RESERVA.toString() );
				pstmt.setString(1, miVO.getId());
				pstmt.setInt(2, miVO.getStartPS()+1);
				pstmt.setInt(3, miVO.getStartPS()+miVO.getLenPS());
				rs=pstmt.executeQuery(); 
				
				MyInfoVO miSetVO=null;
				while(rs.next()) {
					miSetVO=new MyInfoVO();
					miSetVO.setReserNum(rs.getInt("RESER_NUM"));
					miSetVO.setReserDate(rs.getString("RESER_DATE"));
					miSetVO.setAdultCnt(rs.getInt("ADULT_CNT"));
					miSetVO.setOtherCnt(rs.getInt("OTHER_CNT"));
					miSetVO.setReserFlag(rs.getInt("RESER_FLAG"));
					miSetVO.setReserRegist(rs.getDate("RESER_REGIST"));
					miSetVO.setTourNum(rs.getInt("TOUR_NUM"));
					miSetVO.setTourName(rs.getString("TOUR_NAME"));
					miSetVO.setAdultFee(rs.getInt("ADULT_FEE"));
					miSetVO.setOtherFee(rs.getInt("OTHER_FEE"));
					
					list.add(miSetVO);
				}//end while
				
			}finally {
				dc.dbClose(rs, pstmt, conn);
			}//end finally
		
		return list;
	}// selectMyReserList
	
	public int selectMyReserTotal(String id) throws SQLException { // 내 예약 관리 전체 수
		int totalCnt=0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
				conn=dc.getConn();
				
				String selectMyReserTotal="SELECT COUNT(RESER_NUM) FROM TOUR_RESERVA WHERE ID=?";
				
				pstmt=conn.prepareStatement( selectMyReserTotal.toString() );
				
				pstmt.setString(1, id);
				
				rs=pstmt.executeQuery(); 
				
				if(rs.next()) {
					totalCnt=rs.getInt("COUNT(RESER_NUM)");
				}//end if
				
			}finally {
				dc.dbClose(rs, pstmt, conn);
			}//end finally

		return totalCnt;
	}//selectMyReviewTotal

	public MyInfoVO selectReserDetail(MyInfoVO miVO) throws SQLException { // 예약관리 상세보기 (id,resNum)

		MyInfoVO miResultVO = new MyInfoVO();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			conn = dc.getConn();

			StringBuilder TOUR_RESERVA = new StringBuilder();
			TOUR_RESERVA
			.append("	SELECT   	TU.NAME, TU.EMAIL, TU.PHONE,	")
			.append("			   	TR.RESER_NUM, TR.RESER_DATE, TR.RESER_REGIST, TR.ADULT_CNT, TR.OTHER_CNT,	")
			.append("			   	T.TOUR_NAME, ADULT_FEE, OTHER_FEE,  RC.CANCEL_REAS	")
			.append("	FROM		TOUR_USER TU, TOUR_RESERVA TR, TOUR T, RESERVA_CANCEL RC	")
			.append("	WHERE		TR.ID=TU.ID AND TR.TOUR_NUM=T.TOUR_NUM AND TR.RESER_NUM=RC.RESER_NUM(+)	")
			.append("				AND TR.ID=? AND TR.RESER_NUM=?	");

			pstmt = conn.prepareStatement(TOUR_RESERVA.toString());
			pstmt.setString(1, miVO.getId());
			pstmt.setInt(2, miVO.getReserNum());
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				miResultVO.setName(rs.getString("NAME"));
				miResultVO.setEmail(rs.getString("EMAIL"));
				miResultVO.setPhone(rs.getString("PHONE"));
				miResultVO.setReserNum(rs.getInt("RESER_NUM"));
				miResultVO.setReserDate(rs.getString("RESER_DATE"));
				miResultVO.setReserRegist(rs.getDate("RESER_REGIST"));
				miResultVO.setAdultCnt(rs.getInt("ADULT_CNT"));
				miResultVO.setOtherCnt(rs.getInt("OTHER_CNT"));
				miResultVO.setTourName(rs.getString("TOUR_NAME"));
				miResultVO.setAdultFee(rs.getInt("ADULT_FEE"));
				miResultVO.setOtherFee(rs.getInt("OTHER_FEE"));
				miResultVO.setCancelReas(rs.getString("CANCEL_REAS"));
			}//end if
			
		} finally {
			dc.dbClose(rs, pstmt, conn);
		} // end finally

		return miResultVO;
	}// selectReserDetail
	
	public int[] selectResSeatNum(int reserNum) throws SQLException {//좌석 번호
		int[] seatNum=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection dbConn=DbConnection.getInstance();
		
		try {
			//1.드라이버 로딩
			//2.커넥션 연결
			con=dbConn.getConn();
			//3.쿼리문 생성 객체 얻기
			StringBuilder selectTour=new StringBuilder();
			selectTour
			.append("	SELECT 		BS.SEAT_NUM	")
			.append(" 	FROM 		TOUR_RESERVA TR, BUS_SEAT BS	")
			.append(" 	WHERE		TR.RESER_NUM=BS.RESER_NUM AND	")
			.append(" 		  		TR.RESER_NUM=?	")
			.append(" 	ORDER BY  	BS.SEAT_NUM	");
			
			pstmt=con.prepareStatement(selectTour.toString(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			//4.바운드 값 설정
			pstmt.setInt(1, reserNum);
			
			//5. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();//rs는 CURSOR의 제어권을 가지고 있다.
			
			int rowcount = 0;//ResultSet의 row 크기
			if (rs.last()) {
			  rowcount = rs.getRow();
			  rs.beforeFirst();
			}
			
			seatNum=new int[rowcount];
			int idx=0;
			while (rs.next()) {//검색된 레코드의 수를 모르지만 모든 레코드를 저장하기위해
				//배열에 값을 넣어주기
				seatNum[idx++]=rs.getInt("SEAT_NUM");
			}//end while
			
		}finally {
			//6. 연결 끊기
			dbConn.dbClose(rs, pstmt, con);
		}//end finally
		
		return seatNum;
	}//selectSeatNum
	
	public void insertReserCancel(MyInfoVO miVO, Connection con) throws SQLException { // 예약 취소 - 예약 취소 테이블 추가
		PreparedStatement pstmt = null;

		try {
			StringBuilder insertReserCancel = new StringBuilder();
			insertReserCancel
			.append("	INSERT	INTO RESERVA_CANCEL(RESER_NUM, RESER_DATE, CANCEL_DATE, CANCEL_REAS)		")
			.append("	VALUES(?, ?, SYSDATE, ?)	");
			
			pstmt = con.prepareStatement( insertReserCancel.toString());

			pstmt.setInt(1, miVO.getReserNum());
			pstmt.setString(2, miVO.getReserDate());
			pstmt.setString(3, miVO.getCancelReas());

			pstmt.executeUpdate();

		} finally {
			//연결 끊기
			if(pstmt!=null) { pstmt.close(); }//end if
		}//end finally
	}// insertReserCancel
	
	public int updateCancelReas(MyInfoVO miVO, Connection con) throws SQLException { // 예약 취소 - 예약 취소 테이블 추가
		int upCnt=0;
		
		PreparedStatement pstmt = null;
		
		try {
			StringBuilder updateCancelReas = new StringBuilder();
			updateCancelReas
			.append("	UPDATE	RESERVA_CANCEL										")
			.append("	SET		CANCEL_REAS=?										")
			.append("	WHERE	RESER_NUM=(SELECT 	RESER_NUM						")
			.append("					   FROM		TOUR_RESERVA					")
			.append("					   WHERE	RESER_NUM=? AND RESER_FLAG=3)	");
			
			pstmt = con.prepareStatement( updateCancelReas.toString());
			
			pstmt.setString(1, miVO.getCancelReas());
			pstmt.setInt(2, miVO.getReserNum());
			
			upCnt=pstmt.executeUpdate();
			
		} finally {
			//연결 끊기
			if(pstmt!=null) { pstmt.close(); }//end if
		}//end finally
		
		return upCnt;
	}//updateCancelReas
	
	public int updateReserCancel(int reserNum, Connection con) throws SQLException { // 예약 취소-예약 상태
		int upCnt=0;

		PreparedStatement pstmt = null;

		try {
			StringBuilder updateReserCancel = new StringBuilder();
			updateReserCancel
			.append("	UPDATE	TOUR_RESERVA		")
			.append("	SET		RESER_FLAG=3		")
			.append("	WHERE	RESER_NUM=?			");
			
			pstmt = con.prepareStatement( updateReserCancel.toString());

			pstmt.setInt(1, reserNum);

			upCnt=pstmt.executeUpdate();

		} finally {
			//연결 끊기
			if(pstmt!=null) { pstmt.close(); }//end if
		}//end finally
		
		return upCnt;
	}// updateReserCancel

	public int insertUserOut(MyInfoVO miVO) throws SQLException { // 회원탈퇴
		int delCnt = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			conn = dc.getConn();
			StringBuilder insertUserOut = new StringBuilder();
			insertUserOut
			.append("	INSERT	INTO USER_OUT(ID, OUT_REAS, OUT_DATE)		")
			.append("	VALUES(?, ?, SYSDATE)	");
			
			pstmt = conn.prepareStatement(insertUserOut.toString());
			pstmt.setString(1, miVO.getId());
			pstmt.setString(2, miVO.getOutReas());	
			
			delCnt = pstmt.executeUpdate();
			
		} finally {
			dc.dbClose(null, pstmt, conn);
		} // end finally

		return delCnt;
	}// deleteUser

	public List<MyInfoVO> selectMyReviewList(MyInfoVO miVO) throws SQLException { // 내 후기 리스트
		List<MyInfoVO> list = new ArrayList<MyInfoVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
				conn=dc.getConn();
				
				StringBuilder TOUR_REVIEW=new StringBuilder();
				TOUR_REVIEW
				.append("	SELECT 	 	*									")
				.append("	FROM		(SELECT		ROW_NUMBER() OVER (ORDER BY TR.REVIEW_NUM DESC) RNUM, TR.REVIEW_NUM, T.TOUR_NAME, TR.TITLE, TR.REV_WRITE_DATE, TR.ID")
				.append("				FROM		TOUR_REVIEW TR, TOUR T	")
				.append("				WHERE		TR.TOUR_NUM=T.TOUR_NUM	")
				.append("							AND TR.ID=?				")
				.append("				ORDER BY	TR.REVIEW_NUM DESC		")
				.append("				)									")
				.append("	WHERE 		RNUM BETWEEN ? AND ?				");
				
				
				pstmt=conn.prepareStatement( TOUR_REVIEW.toString() );
				
				pstmt.setString(1, miVO.getId());
				pstmt.setInt(2, miVO.getStartPS()+1);
				pstmt.setInt(3, miVO.getStartPS()+miVO.getLenPS());
				
				rs=pstmt.executeQuery(); 
				
				MyInfoVO miSetVO=null;
				while(rs.next()) {
					miSetVO=new MyInfoVO();
					miSetVO.setReviewNum(rs.getInt("REVIEW_NUM"));
					miSetVO.setTourName(rs.getString("TOUR_NAME"));
					miSetVO.setTitle(rs.getString("TITLE"));
					miSetVO.setRevWriteDate(rs.getDate("REV_WRITE_DATE"));
					list.add(miSetVO);
				}//end while

			}finally {
				dc.dbClose(rs, pstmt, conn);
			}//end finally

		return list;
	}// selectMyReviewList
	
	public int selectMyReviewTotal(String id) throws SQLException { // 내 후기 게시한 전체 수
		int totalCnt=0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
				conn=dc.getConn();
				
				String selectMyReviewTotal="SELECT COUNT(REVIEW_NUM) FROM TOUR_REVIEW WHERE ID=?";
				
				pstmt=conn.prepareStatement( selectMyReviewTotal.toString() );
				
				pstmt.setString(1, id);
				
				rs=pstmt.executeQuery(); 
				
				if(rs.next()) {
					totalCnt=rs.getInt("COUNT(REVIEW_NUM)");
				}//end if
				
			}finally {
				dc.dbClose(rs, pstmt, conn);
			}//end finally

		return totalCnt;
	}//selectMyReviewTotal

	public List<MyInfoVO> selectMyCommList(MyInfoVO miVO) throws SQLException { // 내 댓글 리스트
		List<MyInfoVO> list = new ArrayList<MyInfoVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
				conn=dc.getConn();
				
				StringBuilder TOUR_COMMEND=new StringBuilder();
				TOUR_COMMEND
				.append("	SELECT		*													")
				.append("	FROM		(SELECT		ROW_NUMBER() OVER (ORDER BY TC.COMMEND_NUM DESC) RNUM,	")
				.append("							TC.COMMEND_NUM, TR.REV_CONTENT, TC.COM_WRITE_DATE, TC.COM_CONTENT, TC.ID, TC.REVIEW_NUM	")
				.append("				FROM		TOUR_COMMEND TC, TOUR_REVIEW TR			")
				.append("				WHERE 		TC.REVIEW_NUM = TR.REVIEW_NUM			")
				.append("							AND TC.ID=?								")
				.append("				ORDER BY	TC.COMMEND_NUM DESC						")
				.append("				)													")
				.append("	WHERE 		RNUM BETWEEN ? AND ?								");
				
				pstmt=conn.prepareStatement( TOUR_COMMEND.toString() );
				pstmt.setString(1, miVO.getId());
				pstmt.setInt(2, miVO.getStartPS()+1);
				pstmt.setInt(3, miVO.getStartPS()+miVO.getLenPS());
				rs=pstmt.executeQuery(); 
				
				MyInfoVO miSetVO=null;
				while(rs.next()) {
					miSetVO=new MyInfoVO();
					miSetVO.setCommendNum(rs.getInt("COMMEND_NUM"));
					miSetVO.setRevContent(rs.getString("REV_CONTENT"));
					miSetVO.setComContent(rs.getString("COM_CONTENT"));
					miSetVO.setComWriteDate(rs.getDate("COM_WRITE_DATE"));
					miSetVO.setReviewNum(rs.getInt("REVIEW_NUM"));
					list.add(miSetVO);
				}//

			}finally {
				dc.dbClose(rs, pstmt, conn);
			}//end finally

		return list;

	}// selectMyCommList
	
	public int selectMyCommTotal(String id) throws SQLException { // 내 댓글 전체 수
		int totalCnt=0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
				conn=dc.getConn();
				
				String selectMyCommTotal="SELECT COUNT(COMMEND_NUM) FROM TOUR_COMMEND WHERE ID=?";
				
				pstmt=conn.prepareStatement( selectMyCommTotal.toString() );
				
				pstmt.setString(1, id);
				
				rs=pstmt.executeQuery(); 
				
				if(rs.next()) {
					totalCnt=rs.getInt("COUNT(COMMEND_NUM)");
				}//end if
				
			}finally {
				dc.dbClose(rs, pstmt, conn);
			}//end finally

		return totalCnt;
	}//selectMyCommTotal
	
	public static void main(String[] args) {
		MyInfoDAO miDAO = MyInfoDAO.getInstance();
		MyInfoVO vo = new MyInfoVO();
		
		try {
			miDAO.selectMyReviewTotal("tester");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
//		try {
//			System.out.println(miDAO.selectMyUesrInfo("tester"));
//			
//		} catch (SQLException e1) {
//			e1.printStackTrace();
//		}
		
//		vo.setPassword("abc");
//		try {
//			String id = miDAO.selectMyPassConfirm(vo);
//			if (id.equals("abc")) {
//				System.out.println("비밀번호 확인 성공");
//			} else {
//				System.out.println("비밀번호 확인 실패");
//			}
			
			/*
			 * vo.setId("abc"); 
			 * try { String id = miDAO.selectMyUesrInfo(vo);
			 * 	if(id.equals("abc")) { 
			 * 		System.out.println("내 정보 확인"); } }
			 * finally {
			 *	 	System.out.println("내정보 확인 x"); }
			 */
			
		
		/*
			//후기 리스트
			List<MyInfoVO> list = miDAO.selectMyReviewList("abc");
			for(MyInfoVO mVO:list) {
				System.out.println("<후기 리스트>후기번호 : "+mVO.getReviewNum()+" 투어넘버 : "+mVO.getTourNum()+" 후기 제목 : "+mVO.getTitle()+" 후기 내용 : "+mVO.getRevContent());
			}
		*/

			/*
			//댓글 리스트
			List<MyInfoVO> list = miDAO.selectMyCommList("abc");
			for(MyInfoVO mVO:list) {
				System.out.println("<댓글 리스트>댓글번호 : "+mVO.getCommendNum()+ ", 후기 제목 : "+ mVO.getRevContent() + ", 댓글내용 : "+mVO.getComContent());
			} 
			*/
			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}

		
		
	}// main

}// class
