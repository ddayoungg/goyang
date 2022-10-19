package kr.co.goyang.manager.dao;

import java.lang.reflect.Array;


import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import kr.co.goyang.dbConnection.DbConnection;
import kr.co.goyang.manager.vo.ReservaManagerVO;
//import org.apache.commons.lang3.StringUtils;




public class ReservaManagerDAO {
	private static ReservaManagerDAO reserDAO;
	
	public ReservaManagerDAO() {
		
	}
	
	
	/*
	 * private ReservaManagerDAO() { try {
	 * Class.forName("oracle.jdbc.driver.OracleDriver"); } catch
	 * (ClassNotFoundException e) { e.printStackTrace();
	 * System.out.println("드라이브 호출 에러"); } }
	 */

	 public static ReservaManagerDAO getInstance() 
	 { if (reserDAO == null) {
	 reserDAO = new ReservaManagerDAO(); 
	 } return reserDAO; 
	 }
	
	/*
	 * private String url = "jdbc:oracle:thin:@211.63.89.140:1521:orcl"; private
	 * String uid = "goyang"; private String upw = "tour";
	 * 
	 * private Connection conn= null; private PreparedStatement pstmt = null;
	 * private ResultSet rs = null; private Statement stmt = null;
	 */
	
	/**검색 결과, 전체 리스트
	 * @param reserVO
	 * @return
	 * @throws SQLException 
	 */
	/**
	 * @return
	 * @throws SQLException
	 */
	public ArrayList <ReservaManagerVO> selectSearchReserva( ) {
		ArrayList <ReservaManagerVO> list = new ArrayList<ReservaManagerVO>();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			/* conn=DriverManager.getConnection(url, uid, upw); */
			conn = dbCon.getConn();
		
			
			  pstmt = conn.
			  prepareStatement("select distinct r.reser_num, u.name, r.reser_date, r.reser_regist, t.tour_name, r.adult_cnt, t.adult_fee, r.other_cnt, t.other_fee, r.reser_flag,"
			  + "c.cancel_reas " +
			  " from tour_user u, tour_reserva r, bus_seat b, tour t, reserva_cancel c" +
			  " where r.reser_num is not null " + " and u.id = r.id (+)" +
			  " and r.reser_num = b.reser_num (+)" + " and r.tour_num = t.tour_num (+)" +
			  " and r.reser_num = c.reser_num (+)" + "order by r.reser_num desc ");
			 
			 
			rs = pstmt.executeQuery();
			while ( rs.next()) {
				ReservaManagerVO reserVO = new ReservaManagerVO ();
				reserVO.setReserNum(rs.getInt("reser_num"));
				reserVO.setName(rs.getString("name")); 
				reserVO.setReserDate(rs.getString("reser_date"));
				reserVO.setReserRegist(rs.getDate("reser_regist"));
				reserVO.setTourName(rs.getString("tour_name"));
				reserVO.setAdultCnt(rs.getInt("adult_cnt"));
				reserVO.setAdultFee(rs.getInt("adult_fee"));
				reserVO.setOtherCnt(rs.getInt("other_cnt"));
				reserVO.setOtherFee(rs.getInt("other_fee"));
				reserVO.setReserFlag(rs.getInt("reser_flag"));
				reserVO.setCancelReas(rs.getString("cancel_reas"));
				
				
				list.add(reserVO);
			}
		} catch( Exception e ) {
			e.printStackTrace();
		}finally {
			try { rs.close(); } catch (SQLException s) {}
			try { pstmt.close(); } catch (SQLException s) {}
			try { conn.close(); } catch (SQLException s) {}
		}
		return list;
	}//selectSearchReserva

	/**예약 상세
	 * @param i 
	 * @return
	 */
	
	public ReservaManagerVO selectReserva (int num  )  {
		ReservaManagerVO reserVO = new ReservaManagerVO(); 
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbCon.getConn();
			
			/* conn=DriverManager.getConnection(url, uid, upw); */
			
			String sql = "select r.reser_num, u.name, u.email, u.phone, r.reser_date, r.reser_regist, r.reser_flag,"
					+ "t.tour_name, r.adult_cnt, r.other_cnt,"
					+ "t.adult_fee, t.other_fee"
					+ " from tour_user u, tour_reserva r, bus_seat b, tour t"
					+ " where r.reser_num=?"
					//+ " and r.reser_num = b.reser_num"
					+ " and u.id=r.id"
					+ " and r.tour_num = t.tour_num";
			pstmt = conn.prepareStatement( sql );
			pstmt.setInt(1,num);
			
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {

				reserVO.setReserNum(rs.getInt("reser_num"));
				reserVO.setName(rs.getString("name"));
				reserVO.setEmail(rs.getString("email"));
				reserVO.setPhone(rs.getString("phone"));
				reserVO.setReserDate(rs.getString("reser_date"));
				reserVO.setReserRegist(rs.getDate("reser_regist"));
				reserVO.setReserFlag(rs.getInt("reser_flag"));
				reserVO.setTourName(rs.getString("tour_name"));
				reserVO.setAdultCnt(rs.getInt("adult_cnt"));
				reserVO.setOtherCnt(rs.getInt("other_cnt"));
				//reserVO.setSeatNum(rs.getInt("seat_num"));
				reserVO.setAdultFee(rs.getInt("adult_fee"));
				reserVO.setOtherFee(rs.getInt("other_fee"));
				
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try { rs.close(); } catch (SQLException s) {}
			try { pstmt.close(); } catch (SQLException s) {}
			try { conn.close(); } catch (SQLException s) {}
		}
		return reserVO;
	}
				
				
	
	/**예약 확정
	 * @param i
	 * @return
	 * @throws SQLException 
	 */
	/*public int updateReserva(ReservaManagerVO reserVO) throws SQLException {*/
	public ReservaManagerVO  updateReserva(int upFlag) throws SQLException {
		ReservaManagerVO reserVO = new ReservaManagerVO();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		/* ResultSet rs = null; */
		try {
			
		conn = dbCon.getConn();	
			/* conn = DriverManager.getConnection(url, uid, upw ); */
		String sql = "update tour_reserva"
				+ " set reser_flag=2 "
				+ " where reser_num = ? ";
		
		pstmt = conn.prepareStatement(sql);
			
		pstmt .setInt(1, upFlag);		
		
		pstmt.executeUpdate();		
	
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		/* try {rs.close();}catch(SQLException s) {} */
		try {pstmt.close();}catch(SQLException s) {}
		try {conn.close();}catch(SQLException s) {}
	}
	return reserVO;
}
		
	
	
	/**취소 사유 상세
	 * @param i
	 * @return
	 */
	public ReservaManagerVO selectDelReserva(int cancel) {
	
		ReservaManagerVO reserVO = new ReservaManagerVO();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
		conn = dbCon.getConn();	
			/* conn=DriverManager.getConnection(url, uid, upw); */
		String sql = "select r.reser_num, u.name, u.email, u.phone, r.reser_date, r.reser_regist, r.reser_flag, t.tour_name, r.adult_cnt, r.other_cnt, b.seat_num , t.adult_fee, t.other_fee, c.cancel_reas"
				+ " from tour_user u, tour_reserva r, bus_seat b, tour t, reserva_cancel c"
				+ " where r.reser_num = ?"
				/* + " and r.reser_num = b.reser_num" */
				+ " and r.reser_num = c.reser_num"
				+ " and u.id=r.id"
				+ " and r.tour_num = t.tour_num";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cancel);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
			 //  reserVO.setReserNum(rs.getInt(i));
				reserVO.setReserNum(rs.getInt("reser_num"));
				reserVO.setName(rs.getString("name"));
				reserVO.setEmail(rs.getString("email"));
				reserVO.setPhone(rs.getString("phone"));
				reserVO.setReserDate(rs.getString("reser_date"));
				reserVO.setReserRegist(rs.getDate("reser_regist"));
				reserVO.setReserFlag(rs.getInt("reser_flag"));
				reserVO.setTourName(rs.getString("tour_name"));
				reserVO.setAdultCnt(rs.getInt("adult_cnt"));
				reserVO.setOtherCnt(rs.getInt("other_cnt"));
				reserVO.setSeatNum(rs.getInt("seat_num"));
				reserVO.setAdultFee(rs.getInt("adult_fee"));
				reserVO.setOtherFee(rs.getInt("other_fee"));
				reserVO.setCancelReas(rs.getString("cancel_reas"));
			}
			/* System.out.println("DAO : 정보 저장 완료"); */

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try { rs.close(); } catch (SQLException s) {}
			try { pstmt.close(); } catch (SQLException s) {}
			try { conn.close(); } catch (SQLException s) {}
		}
		return reserVO;
	}
	
	/**취소 확정
	 * @param reserVO
	 * @return
	 */
	/* public int updateDelReserva(ReservaManagerVO reserVO) { */
	public ReservaManagerVO updateDelReserva(int num) { 
		//int flag=0;
		ReservaManagerVO reserVO = new ReservaManagerVO();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		/* ResultSet rs = null; */
		
		String sql = " update tour_reserva set reser_flag =4 where reser_num= ? ";
			/*	+ " delete from bus_seat where reser_num= ? ";	*/	
		try { 
			conn = dbCon.getConn();
			/* conn = DriverManager.getConnection(url, uid, upw ); */
			
			pstmt = conn.prepareStatement(sql);
			pstmt .setInt(1, num);
			/*pstmt .setInt(2, num); */
			pstmt.executeUpdate();
			
		} catch ( Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch( Exception e) {
				e.printStackTrace();
			}
		}
		return reserVO;
	}
	
	//좌석 넘버 삭제
	public ReservaManagerVO updateDelSeatNum(int num) { 
		//int flag=0;
		ReservaManagerVO reserVO = new ReservaManagerVO();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		/* ResultSet rs = null; */
		
		String sql = " delete from bus_seat where reser_num= ? ";
			/*	+ " delete from bus_seat where reser_num= ? ";	*/	
		try { 
			conn = dbCon.getConn();
			/* conn = DriverManager.getConnection(url, uid, upw ); */
			
			pstmt = conn.prepareStatement(sql);
			pstmt .setInt(1, num);
			/*pstmt .setInt(2, num); */
			pstmt.executeUpdate();
			
		} catch ( Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch( Exception e) {
				e.printStackTrace();
			}
		}
		return reserVO;
	}
	//특정 사람 찾기
	public List<ReservaManagerVO> Listmembers(ReservaManagerVO reserVO) {
		List <ReservaManagerVO> membersList = new ArrayList<ReservaManagerVO>();
		String name_1 = reserVO.getName();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dbCon.getConn();
			/* conn = DriverManager.getConnection(url, uid, upw ); */
			String sql = "select distinct r.reser_num, u.name, r.reser_date, r.reser_regist, t.tour_name, r.adult_cnt, t.adult_fee, r.other_cnt, t.other_fee, r.reser_flag,"
					+ "c.cancel_reas "
					+ " from tour_user u, tour_reserva r, bus_seat b, tour t, reserva_cancel c"
					+ " where u.id = r.id (+)"
					+ " and r.reser_num = b.reser_num (+)"
					+ " and r.tour_num = t.tour_num (+)"
					+ " and r.reser_num = c.reser_num (+)"
					+ "order by r.reser_num desc ";
			if ((name_1 != null && name_1.length() != 0 )) {
				sql ="select distinct r.reser_num, u.name, r.reser_date, r.reser_regist, t.tour_name, r.adult_cnt, t.adult_fee, r.other_cnt, t.other_fee, r.reser_flag,"
						+ "c.cancel_reas "
						+ " from tour_user u, tour_reserva r, bus_seat b, tour t, reserva_cancel c"
						+" where u.name=? "
						+ " and u.id = r.id (+)"
						+ " and r.reser_num = b.reser_num (+)"
						+ " and r.tour_num = t.tour_num (+)"
						+ " and r.reser_num = c.reser_num (+)"
						+ "order by r.reser_num desc ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name_1);
			} else {
				pstmt = conn.prepareStatement(sql);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				  int reserNum = rs.getInt("reser_num"); 
				  String name = rs.getString("name");
				  String reserDate = rs.getString("reser_date");
				  Date reserRegist = rs.getDate("reser_regist");
				  String tourName = rs.getString("tour_name");
				  int adultCnt = rs.getInt("adult_cnt");
				  int adultFee = rs.getInt("adult_fee");
				  int otherCnt = rs.getInt("other_cnt");
				  int otherFee = rs.getInt("other_fee");
				  int reserFlag = rs.getInt("reser_flag");
				  String cancelReas = rs.getString("cancel_reas");
				
				  ReservaManagerVO reVO = new ReservaManagerVO();
				  reVO.setReserNum(reserNum);
					  reVO.setName(name);
					  reVO.setReserDate(reserDate);
					  reVO.setReserRegist(reserRegist);
					  reVO.setTourName( tourName);
					 reVO.setAdultCnt(adultCnt);
					reVO.setAdultFee(adultFee);
					 reVO.setOtherCnt(otherCnt);
					  reVO.setOtherFee(otherFee);
					  reVO.setReserFlag(reserFlag);
					  reVO.setCancelReas(cancelReas);
				
				membersList.add(reVO);
		}
			rs.close();
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return membersList;
}
	
//카테고리 찾기
public List<ReservaManagerVO> ListReserFlags(int flag){
	List <ReservaManagerVO> reserFlagsList = new ArrayList<ReservaManagerVO>();
	/* int flag = reserVO.getReserFlag(); */
	
	DbConnection dbCon = DbConnection.getInstance();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		conn = dbCon.getConn();
		/* conn= DriverManager.getConnection(url,uid,upw); */
	String sql = " select distinct r.reser_num, u.name, r.reser_date, r.reser_regist, t.tour_name, r.adult_cnt, t.adult_fee, r.other_cnt, t.other_fee, r.reser_flag,"
			+ " c.cancel_reas "
			+ "	from tour_user u, tour_reserva r, bus_seat b, tour t, reserva_cancel c"
			+ "	where  r.reser_flag=? "
			+ "	and u.id = r.id (+) "
			+ "	and r.reser_num = b.reser_num (+) "
			+ "	and r.tour_num = t.tour_num (+) "
			+ "	and r.reser_num = c.reser_num(+) "
			+ "	order by r.reser_num desc ";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,flag);
	
	
	rs = pstmt.executeQuery();
	while(rs.next()) {
		
		 int reserNum = rs.getInt("reser_num"); 
		  String name = rs.getString("name");
		  String reserDate = rs.getString("reser_date");
		  Date reserRegist = rs.getDate("reser_regist");
		  String tourName = rs.getString("tour_name");
		  int adultCnt = rs.getInt("adult_cnt");
		  int adultFee = rs.getInt("adult_fee");
		  int otherCnt = rs.getInt("other_cnt");
		  int otherFee = rs.getInt("other_fee");
		  int reserFlag = rs.getInt("reser_flag");
		  String cancelReas = rs.getString("cancel_reas");
		
		  ReservaManagerVO reVO = new ReservaManagerVO();
		  reVO.setReserNum(reserNum);
			  reVO.setName(name);
			  reVO.setReserDate(reserDate);
			  reVO.setReserRegist(reserRegist);
			  reVO.setTourName( tourName);
			 reVO.setAdultCnt(adultCnt);
			reVO.setAdultFee(adultFee);
			 reVO.setOtherCnt(otherCnt);
			  reVO.setOtherFee(otherFee);
			  reVO.setReserFlag(reserFlag);
			  reVO.setCancelReas(cancelReas);

		reserFlagsList.add(reVO);
	}
		rs.close();
		pstmt.close();
		conn.close();
}catch (Exception e) {
	e.printStackTrace();
}
	return reserFlagsList;
}

//리스트 개수 파악
public int searchReserTotal (ReservaManagerVO reserVO) throws SQLException {
	int total=0;
	
	DbConnection dbCon = DbConnection.getInstance();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		conn = dbCon.getConn();
		/* conn=DriverManager.getConnection(url, uid, upw); */
		String sql =" select count(reser_num) from tour_reserva ";
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			total = rs.getInt("count(reser_num)");
		}
	}finally {
		try {
			if(conn != null)conn.close();
			if(pstmt != null)pstmt.close();
		} catch ( Exception e) {
			e.printStackTrace();
		}
	}
	return total;
}

//좌석 번호 배열로 얻기
public int[] searchSeatNum(ReservaManagerVO reserVO ) {
	int[] seatNums=null;
	
	DbConnection dbCon = DbConnection.getInstance();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		conn = dbCon.getConn();
		/* conn=DriverManager.getConnection(url,uid,upw); */
		String sql = " select b.seat_num"
				+ " from tour_user u, tour_reserva r, bus_seat b, tour t"
				+ " where r.reser_num like ?"
				+ " and u.id = r.id (+)"
				+ " and r.reser_num = b.reser_num (+)"
				+ " and r.tour_num = t.tour_num (+)"
				+ " order by  b.seat_num";
		pstmt=conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		pstmt.setInt(1,reserVO.getReserNum());
		rs=pstmt.executeQuery();
		int rowcount=0;
		if(rs.last()) {
			rowcount = rs.getRow();
			rs.beforeFirst();
		}
		seatNums=new int[rowcount];
		int idx=0;
		while (rs.next()) {
			seatNums[idx++]=rs.getInt("seat_num");
		}
		rs.close();
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return seatNums;	
}

	
}