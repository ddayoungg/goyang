package kr.co.goyang.manager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.dbConnection.DbConnection;
import kr.co.goyang.manager.vo.TourManagerVO;


public class TourManagerDAO {
	private static TourManagerDAO tourDAO;
	
	private TourManagerDAO() {
		
	}
	
	public static TourManagerDAO getInstance() {
		if (tourDAO == null) {
			tourDAO = new TourManagerDAO();
		}
		return tourDAO;
	}
	
	public List<TourManagerVO> selectTourList(TourManagerVO tmVO) throws SQLException {//투어 관리 리스트
		List<TourManagerVO> list = new ArrayList<TourManagerVO>();
		
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
			
			System.out.println(tmVO.getTextSearch());
			System.out.println(tmVO.getListSearch());
			
			if(tmVO.getTextSearch()==null) {//검색 내용이 없을 경우 null 대신 ""으로 변경
				tmVO.setTextSearch("");
			}//end if
			
			selectTour
			.append("	SELECT TOUR_NUM, TOUR_NAME, ADULT_FEE, OTHER_FEE	")
			.append(" 	FROM TOUR	");
			if( tmVO.getTextSearch().trim()!="" && tmVO.getListSearch().equals("tourName") ) {//투어이름으로 검색할 경우
				selectTour.append(" 	WHERE TOUR_NAME LIKE '%'||?||'%' ");
			}else if(tmVO.getTextSearch().trim()!="" && tmVO.getListSearch().equals("tourNum")) {//투어번호로 검색할 경우
				selectTour.append(" 	WHERE TOUR_NUM= ? ");
			}//end else
			selectTour
			.append(" 	ORDER BY TOUR_NUM	");
			
			pstmt=con.prepareStatement(selectTour.toString());
			//4.바운드 값 설정
			if( tmVO.getTextSearch().trim()!="") {
				pstmt.setString(1, tmVO.getTextSearch());
			}//end if
			//5. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();//rs는 CURSOR의 제어권을 가지고 있다.
			
			tmVO=null;//레코드 하나의 값을 저장할 VO
			while (rs.next()) {//검색된 레코드의 수를 모르지만 모든 레코드를 저장하기위해
				tmVO=new TourManagerVO();
				tmVO.setTourNum(rs.getInt("TOUR_NUM"));
				tmVO.setTourName(rs.getString("TOUR_NAME"));
				tmVO.setAdultFee(rs.getInt("ADULT_FEE"));
				tmVO.setOtherFee(rs.getInt("OTHER_FEE"));
				//생성된 VO를 list에 저장
				list.add(tmVO);
			}//end while
			
		}finally {
			//6. 연결 끊기
			dbConn.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectSearchTour
	
	public TourManagerVO selectTourDetail(int tourNum) throws SQLException {//투어별 상세보기
		TourManagerVO tmVO;
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
			.append("	SELECT	TOUR_NUM, TOUR_NAME, EXPLAIN, THUM_IMG, MAP_CEN_LATI, MAP_CEN_LONG, ADULT_FEE, OTHER_FEE, RUN_FLAG	")
			.append(" 	FROM	TOUR	")
			.append(" 	WHERE	TOUR_NUM= ?	");
			
			pstmt=con.prepareStatement(selectTour.toString());
			//4.바운드 값 설정
			pstmt.setInt(1, tourNum);
			//5. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();//rs는 CURSOR의 제어권을 가지고 있다.
			
			tmVO=null;//레코드 하나의 값을 저장할 VO
			if (rs.next()) {//하나의 레코드 값을 저장
				tmVO=new TourManagerVO();
				tmVO.setTourNum(rs.getInt("TOUR_NUM"));
				tmVO.setTourName(rs.getString("TOUR_NAME"));
				tmVO.setExplain(rs.getString("EXPLAIN"));
				tmVO.setThumImg(rs.getString("THUM_IMG"));
				tmVO.setMapCenLati(rs.getDouble("MAP_CEN_LATI"));
				tmVO.setMapCenLong(rs.getDouble("MAP_CEN_LONG"));
				tmVO.setAdultFee(rs.getInt("ADULT_FEE"));
				tmVO.setOtherFee(rs.getInt("OTHER_FEE"));
				tmVO.setRunFlag(rs.getInt("RUN_FLAG"));
			}//end if
			
		}finally {
			//6. 연결 끊기
			dbConn.dbClose(rs, pstmt, con);
		}//end finally
		
		return tmVO;
	}//selectTour
	
	public List<TourManagerVO> selectTourSpots(int tourNum) throws SQLException {//투어별 상세보기 관광지
		List<TourManagerVO> list = new ArrayList<TourManagerVO>();
		
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
			.append("	SELECT	T.TOUR_NUM,	")
			.append("			TS.TOUR_ORDER, TS.SPOTS_NAME, NVL(TS.START_HOUR, '') START_HOUR, NVL(TS.END_HOUR, '') END_HOUR,	")
			.append("			MAP_SPO_LATI, MAP_SPO_LONG	")
			.append(" 	FROM	TOUR T, TOUR_SPOTS TS	")
			.append(" 	WHERE	T.TOUR_NUM=TS.TOUR_NUM AND	")
			.append(" 			T.TOUR_NUM= ?	");
			
			pstmt=con.prepareStatement(selectTour.toString());
			//4.바운드 값 설정
			pstmt.setInt(1, tourNum);
			//5. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();//rs는 CURSOR의 제어권을 가지고 있다.
			
			TourManagerVO tmVO=null;//레코드 하나의 값을 저장할 VO
			while (rs.next()) {//검색된 레코드의 수를 모르지만 모든 레코드를 저장하기위해
				tmVO=new TourManagerVO();
				tmVO.setTourOrder(rs.getInt("TOUR_ORDER"));
				tmVO.setSpotName(rs.getString("SPOTS_NAME"));
				tmVO.setStartHour(rs.getString("START_HOUR"));
				tmVO.setEndHour(rs.getString("END_HOUR"));
				tmVO.setMapSpoLati(rs.getDouble("MAP_SPO_LATI"));
				tmVO.setMapSpoLong(rs.getDouble("MAP_SPO_LONG"));
				//생성된 VO를 list에 저장
				list.add(tmVO);
			}//end while
			
		}finally {
			//6. 연결 끊기
			dbConn.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectTourSpots
	
	public int insertTour(TourManagerVO tmVO, Connection con) throws SQLException{//투어 관리 추가- int tourNum 반환값: 관광지 추가 시 new tourNum 값이 필요
		int tourNum=tmVO.getTourNum();
		
		PreparedStatement pstmt=null;
		//1.드라이버 로딩
		try {
		//2.커넥션 연결
		//3.쿼리문생성객체 얻기
			StringBuilder insertTour=new StringBuilder();
			insertTour
			.append("	INSERT	INTO TOUR(TOUR_NUM, TOUR_NAME, EXPLAIN, THUM_IMG, MAP_CEN_LATI, MAP_CEN_LONG, ADULT_FEE, OTHER_FEE, TOUR_REGIST, RUN_FLAG)			 ")
			.append("	VALUES(?, ?, ?, ?, ?, ?, ?, ?, sysdate, 1)	");

				pstmt=con.prepareStatement(insertTour.toString());//쿼리문을 넣어 쿼리문 실행객체를 얻는다.
				//4.바인드변수에 값 설정
				tourNum=selectNextNum();//마지막 투어 번호+1 구하는 메소드
				pstmt.setInt(1, tourNum);
				pstmt.setString(2, tmVO.getTourName());
				pstmt.setString(3, tmVO.getExplain());
				pstmt.setString(4, tmVO.getThumImg());
				pstmt.setDouble(5, tmVO.getMapCenLati());
				pstmt.setDouble(6, tmVO.getMapCenLong());
				pstmt.setInt(7, tmVO.getAdultFee());
				pstmt.setInt(8, tmVO.getOtherFee());
				
				//5.쿼리문 수행 후 결과 얻기
				pstmt.executeUpdate();
		}finally {
			//6.연결 끊기
			if(pstmt!=null) { pstmt.close(); }
		}//end finally
		
		return tourNum;
	}//insertTour
	
	public int selectNextNum() throws SQLException { // 마지막 투어 번호 구하기
		int selectNum=1;//첫번째면 1번
		
		DbConnection dc=DbConnection.getInstance();
		
		String selectNextNum = "SELECT TOUR_NUM FROM TOUR ORDER BY TOUR_NUM DESC";
		
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
	
	public int updateTour(TourManagerVO tmVO, Connection con) throws SQLException{//투어 정보 수정
		int updateCnt=0;
		
		PreparedStatement pstmt=null;
		
		try {
		//1.드라이버 로딩
		//2.커넥션 얻기
		//3.쿼리문 생성객체 얻기
			StringBuilder updateTour=new StringBuilder();
			updateTour
			.append("	update	TOUR			 ")
			.append("	set		TOUR_NAME=?, EXPLAIN=?, THUM_IMG=?, MAP_CEN_LATI=?, MAP_CEN_LONG=?, ADULT_FEE=?, OTHER_FEE=?	")
			.append("	where	TOUR_NUM=?			 ");
			
			pstmt=con.prepareStatement(updateTour.toString());
		//4.바인드 변수에 값 설정
			pstmt.setString(1, tmVO.getTourName());
			pstmt.setString(2, tmVO.getExplain());
			pstmt.setString(3, tmVO.getThumImg());
			pstmt.setDouble(4, tmVO.getMapCenLati());
			pstmt.setDouble(5, tmVO.getMapCenLong());
			pstmt.setInt(6, tmVO.getAdultFee());
			pstmt.setInt(7, tmVO.getOtherFee());
			pstmt.setInt(8, tmVO.getTourNum());
		//5.쿼리문 수행 후 결과 얻기
			updateCnt=pstmt.executeUpdate();
			
		}finally {
			//6.연결 끊기
			if(pstmt!=null) { pstmt.close(); }
		}//end finally
		
		return updateCnt;
	}//updateTour
	
	public int delecteTourSport(int tourNum, Connection con) throws SQLException {//투어 수정 할 경우 관광지 삭제 => 관광지 추가
		int deleteCnt=0;
		
		PreparedStatement pstmt=null;
		
		try {
			//1.드라이버로딩
			//2.커넥션 얻기
			//3.쿼리문 생성객체 얻기
			 String delecteTourSport="delete from TOUR_SPOTS where TOUR_NUM=?";
			 pstmt=con.prepareStatement(delecteTourSport);
			//4.바인드변수에 값 설정
			 pstmt.setInt(1, tourNum);
			//5.쿼리문 수행 후 결과 얻기
			 deleteCnt=pstmt.executeUpdate(); // 리턴되는 값:0 - 삭제된 행 없는 경우 
			 								//or 1 - 삭제된 행이 하나인 경우.
		}finally {
			//6.연결 끊기
			if(pstmt!=null) { pstmt.close(); }
		}
		
		return deleteCnt;
	}//delecteTourSport
	
	public void insertTourSport(TourManagerVO tmVO, Connection con) throws SQLException{//투어별 관광지 추가
		
		PreparedStatement pstmt=null;
		//1.드라이버 로딩
		try {
		//2.커넥션 연결
		//3.쿼리문생성객체 얻기
			String insertTourSport=
					"insert into TOUR_SPOTS(TOUR_NUM, TOUR_ORDER, SPOTS_NAME, START_HOUR, END_HOUR, MAP_SPO_LATI, MAP_SPO_LONG) values(?,?,?,?,?,?,?)";
			
			pstmt=con.prepareStatement(insertTourSport);//쿼리문을 넣어 쿼리문 실행객체를 얻는다.
			for(int i=0;i<tmVO.getTourOrderIn().length;i++) {
				//4.바인드변수에 값 설정
				pstmt.setInt(1, tmVO.getTourNum());
				pstmt.setInt(2, tmVO.getTourOrderIn()[i]);
				pstmt.setString(3, tmVO.getSpotNameIn()[i]);
				pstmt.setString(4, tmVO.getStartHourIn()[i]);
				pstmt.setString(5, tmVO.getEndHourIn()[i]);
				pstmt.setDouble(6, tmVO.getMapSpoLatiIn()[i]);
				pstmt.setDouble(7, tmVO.getMapSpoLongIn()[i]);
				//5.쿼리문 수행 후 결과 얻기
				pstmt.executeUpdate();
					
			}//end for
		}finally {
			//6.연결 끊기
			if(pstmt!=null) { pstmt.close(); }
		}//end finally
	}//insertTourSport
	
	public int updateTourDown(int tourNum) throws SQLException{//투어 종료
		int updateCnt=0;
		DbConnection dc = DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
		//1.드라이버 로딩
		//2.커넥션 얻기
			con=dc.getConn();
		//3.쿼리문 생성객체 얻기
			StringBuilder updateTourDown=new StringBuilder();
			updateTourDown
			.append("	update	TOUR			 ")
			.append("	set		RUN_FLAG=0	")
			.append("	where	TOUR_NUM=? AND RUN_FLAG=1	");
			
			pstmt=con.prepareStatement(updateTourDown.toString());
		//4.바인드 변수에 값 설정
			pstmt.setInt(1, tourNum);
		//5.쿼리문 수행 후 결과 얻기
			updateCnt=pstmt.executeUpdate();
			
		}finally {
			//6.연결 끊기
			dc.dbClose(null, pstmt, con);
		}//end finally
		
		return updateCnt;
	}//updateTourDown
	
}//class
