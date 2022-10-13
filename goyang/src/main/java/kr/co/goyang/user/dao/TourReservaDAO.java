package kr.co.goyang.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.dbConnection.DbConnection;
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
	
	
	public List<TourReservaVO> selectTourList() throws SQLException {//정기 코스
		List<TourReservaVO> list = new ArrayList<TourReservaVO>();
		
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
			.append("	SELECT TOUR_NUM, TOUR_NAME, EXPLAIN, THUM_IMG, ADULT_FEE, OTHER_FEE	")
			.append(" 	FROM tour	")
			.append(" 	WHERE RUN_FLAG=1	")
			.append(" 	ORDER BY TOUR_NUM	");
			
			pstmt=con.prepareStatement(selectTour.toString());
			//4.바운드 값 설정
			
			//5. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();//rs는 CURSOR의 제어권을 가지고 있다.
			
			TourReservaVO trVO=null;//레코드 하나의 값을 저장할 VO
			while (rs.next()) {//검색된 레코드의 수를 모르지만 모든 레코드를 저장하기위해
				trVO=new TourReservaVO();
				trVO.setTourNum(rs.getInt("TOUR_NUM"));
				trVO.setTourName(rs.getString("TOUR_NAME"));
				trVO.setExplain(rs.getString("EXPLAIN"));
				trVO.setThumImg(rs.getString("THUM_IMG"));
				trVO.setAdultFee(rs.getInt("ADULT_FEE"));
				trVO.setOtherFee(rs.getInt("OTHER_FEE"));
				//생성된 VO를 list에 저장
				list.add(trVO);
			}//end while
			
		}finally {
			//6. 연결 끊기
			dbConn.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectTourList
	
	public TourReservaVO selectTourInfo(int tourNum) throws SQLException {//정기 코스
		TourReservaVO trVO = new TourReservaVO();
		
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
			.append("	SELECT TOUR_NUM, TOUR_NAME, EXPLAIN, THUM_IMG, ADULT_FEE, OTHER_FEE, RUN_FLAG	")
			.append(" 	FROM TOUR	")
			.append(" 	WHERE TOUR_NUM=?	");
			
			pstmt=con.prepareStatement(selectTour.toString());
			//4.바운드 값 설정
			pstmt.setInt(1, tourNum);
			//5. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();//rs는 CURSOR의 제어권을 가지고 있다.
			
			trVO=null;//레코드 하나의 값을 저장할 VO
			if (rs.next()) {
				trVO=new TourReservaVO();
				trVO.setTourNum(rs.getInt("TOUR_NUM"));
				trVO.setTourName(rs.getString("TOUR_NAME"));
				trVO.setExplain(rs.getString("EXPLAIN"));
				trVO.setThumImg(rs.getString("THUM_IMG"));
				trVO.setAdultFee(rs.getInt("ADULT_FEE"));
				trVO.setOtherFee(rs.getInt("OTHER_FEE"));
				trVO.setRunFlag(rs.getInt("RUN_FLAG"));
			}//end if
			
		}finally {
			//6. 연결 끊기
			dbConn.dbClose(rs, pstmt, con);
		}//end finally
		
		return trVO;
	}//selectTourList
	
	public int[] selectSeatNum(TourReservaVO trVO) throws SQLException {//좌석 번호
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
			.append("	SELECT 	BS.SEAT_NUM	")
			.append(" 	FROM 	TOUR_RESERVA TR, BUS_SEAT BS	")
			.append(" 	WHERE	TR.RESER_NUM=BS.RESER_NUM and	")
			.append(" 		  	BS.RESER_DATE = ? AND BS.TOUR_NUM = ?	");
			
			pstmt=con.prepareStatement(selectTour.toString(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			//4.바운드 값 설정
			pstmt.setString(1, trVO.getReserDate());
			pstmt.setInt(2, trVO.getTourNum());
			
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
	
	
	public int tranReser(TourReservaVO trVO) {
		int reserNum=0;
		
		DbConnection dc=DbConnection.getInstance();
		
		Connection con=null;
		try {
			con=dc.getConn();
			con.setAutoCommit(false);
			
			reserNum=insertTourReser(trVO, con);
			trVO.setReserNum(reserNum);
			insertSeatReser(trVO, con);
			
			con.commit();
			System.out.println("commit 성공");
		} catch (SQLException e) {
			try {
				System.out.println("트랜잭션 실패");
				reserNum=0;
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
		
		return reserNum;
	}//transactionReser
	
	public int insertTourReser(TourReservaVO trVO, Connection con) throws SQLException {
		int reserNum=0;
		
		PreparedStatement pstmt=null;
		
		//1.드라이버 로딩
		//2.커넥션 연결
		//3.쿼리문생성객체 얻기
		StringBuilder insertTour=new StringBuilder();
		insertTour
		.append("	INSERT	INTO TOUR_RESERVA(RESER_NUM, RESER_DATE, ADULT_CNT, OTHER_CNT, RESER_FLAG, RESER_REGIST, ID, TOUR_NUM)			 ")
		.append("	VALUES(?, ?, ?, ?, 1, SYSDATE, ?, ?)	");
		
		pstmt=con.prepareStatement(insertTour.toString());//쿼리문을 넣어 쿼리문 실행객체를 얻는다.
		//4.바인드변수에 값 설정
		reserNum=selectNextNum();//마지막 예약 번호+1 구하는 메소드
		pstmt.setInt(1, reserNum);
		pstmt.setString(2, trVO.getReserDate());
		pstmt.setInt(3, trVO.getAdultCnt());
		pstmt.setInt(4, trVO.getOtherCnt());
		pstmt.setString(5, trVO.getId());
		pstmt.setInt(6, trVO.getTourNum());
		
		pstmt.executeUpdate();
		//5.쿼리문 수행 후 결과 얻기
		
		//연결 끊기
		if(pstmt!=null) { pstmt.close(); } 
		
		return reserNum;
	}// 결제하기(투어예약)
	
	public void insertSeatReser(TourReservaVO trVO, Connection con) throws SQLException {
		
		PreparedStatement pstmt=null;
		
		//1.드라이버 로딩
		//2.커넥션 연결
		//3.쿼리문생성객체 얻기
		StringBuilder insertSeat=new StringBuilder();
		insertSeat
		.append("	INSERT	INTO BUS_SEAT(SEAT_NUM, TOUR_NUM, RESER_DATE, RESER_NUM)			 ")
		.append("	VALUES(?, ?, ?, ?)	");
		pstmt=con.prepareStatement(insertSeat.toString());//쿼리문을 넣어 쿼리문 실행객체를 얻는다.
		for(int i=0;i<trVO.getSeatNumIn().length;i++) {
			//4.바인드변수에 값 설정
			pstmt.setInt(1, trVO.getSeatNumIn()[i]);
			pstmt.setInt(2, trVO.getTourNum());
			pstmt.setString(3, trVO.getReserDate());
			pstmt.setInt(4, trVO.getReserNum());
			
			//5.쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
		}//end for
		//연결 끊기
		if(pstmt!=null) { pstmt.close(); }
		
	}//insertSeatReser
	
	public int selectNextNum() throws SQLException { // 마지막 예약 번호 구하기
		int selectNum=1;//첫번째면 1번
		
		DbConnection dc=DbConnection.getInstance();
		
		String selectNextNum = "SELECT RESER_NUM FROM TOUR_RESERVA ORDER BY RESER_NUM DESC";
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try {
			con = dc.getConn();// DB 연결
		} catch (SQLException e) {
			e.printStackTrace();
		} // catch
		
		try {
			pstmt = con.prepareStatement(selectNextNum);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				selectNum=rs.getInt(1) + 1; // 게시판 마지막 번호에 다음 번호
			}//end if
		} finally {
			dc.dbClose(rs, pstmt, con);
		}//end finally
		return selectNum;
	}// selectNextNum
	
	
	public TourReservaVO selectReserConfirm(TourReservaVO trVO) throws SQLException {//결제한 후 예약 내용 최종 확인
		
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
			.append("	SELECT	TR.RESER_NUM, TR.RESER_DATE, TR.ADULT_CNT, TR.OTHER_CNT, ")
			.append("			T.TOUR_NAME, T.ADULT_FEE, T.OTHER_FEE, TU.NAME	")
			.append(" 	FROM	TOUR_RESERVA TR, TOUR T, TOUR_USER TU	")
			.append(" 	WHERE	T.TOUR_NUM=TR.TOUR_NUM AND TU.ID=TR.ID ")
			.append("			AND TR.ID=? AND TR.RESER_NUM=?	");
			
			pstmt=con.prepareStatement(selectTour.toString());
			//4.바운드 값 설정
			pstmt.setString(1, trVO.getId());
			pstmt.setInt(2, trVO.getReserNum());
			//5. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();//rs는 CURSOR의 제어권을 가지고 있다.
			
			trVO=null;//레코드 하나의 값을 저장할 VO
			if (rs.next()) {
				trVO=new TourReservaVO();
				trVO.setReserNum(rs.getInt("RESER_NUM"));
				trVO.setReserDate(rs.getString("RESER_DATE"));
				trVO.setAdultCnt(rs.getInt("ADULT_CNT"));
				trVO.setOtherCnt(rs.getInt("OTHER_CNT"));
				trVO.setTourName(rs.getString("TOUR_NAME"));
				trVO.setAdultFee(rs.getInt("ADULT_FEE"));
				trVO.setOtherFee(rs.getInt("OTHER_FEE"));
				trVO.setName(rs.getString("NAME"));
			}//end if
			
		}finally {
			//6. 연결 끊기
			dbConn.dbClose(rs, pstmt, con);
		}//end finally
		
		return trVO;
	}// 결제 확인
	
}//class
