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


import kr.co.goyang.manager.vo.ReservaManagerVO;
//import org.apache.commons.lang3.StringUtils;




public class ReservaManagerDAO {
	private static ReservaManagerDAO reserDAO;
	
	private ReservaManagerDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("드라이브 호출 에러");
		}
	}
	
	public static ReservaManagerDAO getInstance() {
		if (reserDAO == null) {
			reserDAO = new ReservaManagerDAO();
		}
		return reserDAO;
	}
	
	private String url = "jdbc:oracle:thin:@211.63.89.140:1521:orcl";
	private String uid = "goyang";
	private String upw = "tour";
	
	private Connection conn= null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private Statement stmt = null;
	
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
		/*
		 * public List<ReservaManagerVO> selectSearchReserva( ) { List<ReservaManagerVO>
		 * list = new ArrayList<ReservaManagerVO>();
		 */		//return list;
		
		try {
			conn=DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement("select distinct r.reser_num, u.name, r.reser_regist, t.tour_name, r.adult_cnt, t.adult_fee, r.other_cnt, t.other_fee, r.reser_flag,"
					+ "c.cancel_reas "
					+ " from tour_user u, tour_reserva r, bus_seat b, tour t, reserva_cancel c"
					+ " where r.reser_num is not null "
					+ " and u.id = r.id (+)"
					+ " and r.reser_num = b.reser_num (+)"
					+ " and r.tour_num = t.tour_num (+)"
					+ " and r.reser_num = c.reser_num (+)"
					+ "order by r.reser_num");
			rs = pstmt.executeQuery();
			while ( rs.next()) {
				ReservaManagerVO reserVO = new ReservaManagerVO ();
				reserVO.setReserNum(rs.getInt("reser_num"));
				reserVO.setName(rs.getString("name")); 
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
		//i=1;
		ReservaManagerVO reserVO = new ReservaManagerVO(); 
		try {
			conn=DriverManager.getConnection(url, uid, upw);
			
			String sql = "select r.reser_num, u.name, u.email, u.phone, r.reser_regist, t.tour_name, r.adult_cnt, r.other_cnt, b.seat_num,"
					+ "t.adult_fee, t.other_fee"
					+ " from tour_user u, tour_reserva r, bus_seat b, tour t"
					+ " where r.reser_num=?"
					+ " and r.reser_num = b.reser_num"
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
				reserVO.setReserDate(rs.getString("reser_regist"));
				reserVO.setTourName(rs.getString("tour_name"));
				reserVO.setAdultCnt(rs.getInt("adult_cnt"));
				reserVO.setOtherCnt(rs.getInt("other_cnt"));
				reserVO.setSeatNum(rs.getInt("seat_num"));
				reserVO.setAdultFee(rs.getInt("adult_fee"));
				reserVO.setOtherFee(rs.getInt("other_fee"));

			}
			System.out.println("DAO : 정보 저장 완료");
//			System.out.println(reserVO.getName()+reserVO.getEmail()+reserVO.getPhone()+reserVO.getReserDate()+reserVO.getReserNum()+
//					reserVO.getTourName()+reserVO.getAdultCnt()+reserVO.getOtherCnt()+reserVO.getSeatNum());
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
		try {
		conn = DriverManager.getConnection(url, uid, upw );
		String sql = "update tour_reserva"
				+ " set reser_flag=2 "
				+ " where reser_num = ? ";
		
		pstmt = conn.prepareStatement(sql);
			
		pstmt .setInt(1, upFlag);		
		
		pstmt.executeUpdate();		
	
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {rs.close();}catch(SQLException s) {}
		try {pstmt.close();}catch(SQLException s) {}
		try {conn.close();}catch(SQLException s) {}
	}
	return reserVO;
}
	
//				//1.드라이버로딩
//					try {
//						Class.forName("oracle.jdbc.OracleDriver");
//					} catch (ClassNotFoundException e) {
//						e.printStackTrace();
//					}//end catch
//					
//					Connection con=null;
//					Statement stmt=null;
//					ResultSet rs=null;
//					try {
//					//2.커넥션얻기
//						String url="jdbc:oracle:thin:@211.63.89.140:1521:orcl";
//						String id="goyang";
//						String pass="tour";
//						
//						con=DriverManager.getConnection(url,id,pass);
//					//3.쿼리문 생성객체 얻기
//						stmt=con.createStatement();
//					try (//4.쿼리문 수행 후 결과 얻기
//						Scanner sc = new Scanner(System.in)) {
//							System.out.println(" 아이디 입력 ");
//							String idName =sc.nextLine();
//							System.out.println(" 예약확정=1 취소확정=2 ");
//							int num = sc.nextInt();
//							
//							String updateReserva="update tour_reserva "
//									+ "set reser_flag= '%" +num+ "%' "+ " where id = '%"+ idName+ " % ' ";
//							
//							rs=stmt.executeQuery(updateReserva);//커서의 제어권을 받는다.
//						}				
//					
//						reserVO=null; //조회된 레코드를 저장하기 위한 VO
//						while( rs.next() ) {
//							reserVO = new ReservaManagerVO();
//							//조회된 결과를 VO에 설정
//							reserVO.setReserNum(rs.getInt("reser_num"));
//							reserVO.setReserDate(rs.getString("reser_date")); 
//							reserVO.setAdultCnt(rs.getInt("adult_cnt"));
//							reserVO.setOtherCnt(rs.getInt("other_cnt"));
//							reserVO.setReserFlag(rs.getInt("reser_flag"));
//							reserVO.setReserRegist(rs.getDate("reser_regist"));
//							reserVO.setId(rs.getString("id"));
//							reserVO.setTourNum(rs.getInt("tour_num"));					
//						
//						System.out.printf(reserVO+"%n");
//						}
//
//					}finally {
//					//5.연결 끊기
//						if( rs != null ) { rs.close(); } //end if
//						if( stmt != null) { stmt.close(); }//end if
//						if( con != null) { con.close(); } //end if
//		}//end finally
//				return  i;
//			}//selectReserva
	
	
	
	/**취소 사유 상세
	 * @param i
	 * @return
	 */
	public ReservaManagerVO selectDelReserva(int cancel) {
	
		ReservaManagerVO reserVO = new ReservaManagerVO();
		
		try {
		conn=DriverManager.getConnection(url, uid, upw);
		String sql = "select r.reser_num, u.name, u.email, u.phone, r.reser_regist, t.tour_name, r.adult_cnt, r.other_cnt, b.seat_num , t.adult_fee, t.other_fee, c.cancel_reas"
				+ " from tour_user u, tour_reserva r, bus_seat b, tour t, reserva_cancel c"
				+ " where r.reser_num = ?"
				+ " and r.reser_num = b.reser_num"
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
				reserVO.setReserDate(rs.getString("reser_regist"));
				reserVO.setTourName(rs.getString("tour_name"));
				reserVO.setAdultCnt(rs.getInt("adult_cnt"));
				reserVO.setOtherCnt(rs.getInt("other_cnt"));
				reserVO.setSeatNum(rs.getInt("seat_num"));
				reserVO.setAdultFee(rs.getInt("adult_fee"));
				reserVO.setOtherFee(rs.getInt("other_fee"));
				reserVO.setCancelReas(rs.getString("cancel_reas"));
			}
			System.out.println("DAO : 정보 저장 완료");
//			System.out.println(reserVO.getName()+reserVO.getEmail()+reserVO.getPhone()+reserVO.getReserDate()+reserVO.getReserNum()+
//					reserVO.getTourName()+reserVO.getAdultCnt()+reserVO.getOtherCnt()+reserVO.getSeatNum()+reserVO.getCancelReas());
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
	public ReservaManagerVO updateDelReserva(int flag) { 
		//int flag=0;
		ReservaManagerVO reserVO = new ReservaManagerVO();
		String sql = "update tour_reserva set reser_flag =4 where reser_num= ? ";
		
		try { 
			conn = DriverManager.getConnection(url, uid, upw );
			
			pstmt = conn.prepareStatement(sql);
			pstmt .setInt(1, flag);
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
		try {
			conn = DriverManager.getConnection(url, uid, upw );
			String sql = "select distinct r.reser_num, u.name, r.reser_regist, t.tour_name, r.adult_cnt, t.adult_fee, r.other_cnt, t.other_fee, r.reser_flag,"
					+ "c.cancel_reas "
					+ " from tour_user u, tour_reserva r, bus_seat b, tour t, reserva_cancel c"
					+ " where u.id = r.id (+)"
					+ " and r.reser_num = b.reser_num (+)"
					+ " and r.tour_num = t.tour_num (+)"
					+ " and r.reser_num = c.reser_num (+)"
					+ "order by r.reser_num";
			if ((name_1 != null && name_1.length() != 0 )) {
				sql ="select distinct r.reser_num, u.name, r.reser_regist, t.tour_name, r.adult_cnt, t.adult_fee, r.other_cnt, t.other_fee, r.reser_flag,"
						+ "c.cancel_reas "
						+ " from tour_user u, tour_reserva r, bus_seat b, tour t, reserva_cancel c"
						+" where u.name=? "
						+ " and u.id = r.id (+)"
						+ " and r.reser_num = b.reser_num (+)"
						+ " and r.tour_num = t.tour_num (+)"
						+ " and r.reser_num = c.reser_num (+)"
						+ "order by r.reser_num";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name_1);
			} else {
				pstmt = conn.prepareStatement(sql);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				  int reserNum = rs.getInt("reser_num"); 
				  String name = rs.getString("name");
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
					  reVO.setReserRegist(reserRegist);
					  reVO.setTourName( tourName);
					 reVO.setAdultCnt(adultCnt);
					reVO.setAdultFee(adultFee);
					 reVO.setOtherCnt(otherCnt);
					  reVO.setOtherFee(otherFee);
					  reVO.setReserFlag(reserFlag);
					  reVO.setCancelReas(cancelReas);
				/*
				 * reserVO.setReserNum(rs.getInt("reser_num"));
				 * reserVO.setName(rs.getString("name"));
				 * reserVO.setReserRegist(rs.getDate("reser_regist"));
				 * reserVO.setTourName(rs.getString("tour_name"));
				 * reserVO.setAdultCnt(rs.getInt("adult_cnt"));
				 * reserVO.setAdultFee(rs.getInt("adult_fee"));
				 * reserVO.setOtherCnt(rs.getInt("other_cnt"));
				 * reserVO.setOtherFee(rs.getInt("other_fee"));
				 * reserVO.setReserFlag(rs.getInt("reser_flag"));
				 * reserVO.setCancelReas(rs.getString("cancel_reas"));
				 */
				 
				
				/* membersList.add(reserVO); */
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
public List<ReservaManagerVO> ListReserFlags(ReservaManagerVO reserVO){
	List <ReservaManagerVO> reserFlagsList = new ArrayList<ReservaManagerVO>();
	int flag = reserVO.getReserFlag();
	try {
	conn= DriverManager.getConnection(url,uid,upw);
	String sql = "select distinct r.reser_num, u.name, r.reser_regist, t.tour_name, r.adult_cnt, t.adult_fee, r.other_cnt, t.other_fee, r.reser_flag,"
			+ "c.cancel_reas"
			+ " from tour_user u, tour_reserva r, bus_seat b, tour t, reserva_cancel c"
			+ " where  r.reser_flag=?"
			+ " and u.id = r.id (+)"
			+ " and r.reser_num = b.reser_num (+)"
			+ " and r.tour_num = t.tour_num (+)"
			+ " and r.reser_num = c.reser_num(+)"
			+ " order by r.reser_num ";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, flag);
	
	
	rs = pstmt.executeQuery();
	while(rs.next()) {
		
		 int reserNum = rs.getInt("reser_num"); 
		  String name = rs.getString("name");
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
			  reVO.setReserRegist(reserRegist);
			  reVO.setTourName( tourName);
			 reVO.setAdultCnt(adultCnt);
			reVO.setAdultFee(adultFee);
			 reVO.setOtherCnt(otherCnt);
			  reVO.setOtherFee(otherFee);
			  reVO.setReserFlag(reserFlag);
			  reVO.setCancelReas(cancelReas);
		/*
		 * reserVO.setReserNum(rs.getInt("reser_num"));
		 * reserVO.setName(rs.getString("name"));
		 * reserVO.setReserDate(rs.getString("reser_regist"));
		 * reserVO.setTourName(rs.getString("tour_name"));
		 * reserVO.setAdultCnt(rs.getInt("adult_cnt"));
		 * reserVO.setAdultFee(rs.getInt("adult_fee"));
		 * reserVO.setOtherCnt(rs.getInt("other_cnt"));
		 * reserVO.setOtherFee(rs.getInt("other_fee"));
		 * reserVO.setReserFlag(rs.getInt("reser_flag"));
		 * reserVO.setCancelReas(rs.getString("cancel_reas"));
		 * 
		 * reserFlagsList.add(reserVO);
		 */
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
//public int searchReserTotal (ReservaManagerVO reserVO) {
//	int total=0;
//	
//	try {
//		conn=DriverManager.getConnection(url, uid, upw);
//		String sql =" select count(reser_num) from tour_reserva ";
//		pstmt = conn.prepareStatement(sql);
//		rs=pstmt.executeQuery();
//		
//		if(rs.next()) {
//			total = rs.getInt("count(reser_num)");
//		}
//	}finally {
//		try {
//			if(conn != null)conn.close();
//			if(pstmt != null)pstmt.close();
//		} catch ( Exception e) {
//			e.printStackTrace();
//		}
//	}
//	return total;
//}

public static void main(String [] args) throws SQLException {
	//ReservaManagerVO reserVO = new ReservaManagerVO();
	//예약 리스트 조회
//	ReservaManagerDAO reserDAO = ReservaManagerDAO.getInstance();
//	
//	ArrayList <ReservaManagerVO> list = reserDAO.selectSearchReserva();
//	ReservaManagerVO reVO =new ReservaManagerVO();
//	
//	for ( ReservaManagerVO reserVO : list ){
//		reVO=reserVO;
//	if ( reVO.getReserFlag() == 1 ) {
//		 reVO.getReserFlag="예약대기";
//	} else if ( reVO.getReserFlag() == 2 ) {
//		reVO.getReserFlag="예약확정";
//	} else if ( reVO.getReserFlag() == 3) {
//		reVO.getReserFlag="취소요청"; 
//	} else if ( reVO.getReserFlag() == 4) {
//		reVO.getReserFlag="취소확정";
//	}
//	
//	String cancelReas = reVO.getCancelReas();
//	if ( reVO.getCancelReas() == null ) {
//		cancelReas=" ";
//	} else {
//		cancelReas="취소사유";
//	}	
//	
//	System.out.println(reVO.getReserNum()+", "+reVO.getName()+", "+reVO.getReserDate()+", "+reVO.getTourName()+
//			", "+(reVO.getAdultCnt()*reVO.getAdultFee()+reVO.getOtherCnt()*reVO.getOtherFee())+", "+
//			reVO.getReserFlag+", "+cancelReas+"\n" );
//	}//selectSearchReserva
	
	//예약 상세
	ReservaManagerDAO reserDAO = ReservaManagerDAO.getInstance();
	ReservaManagerVO reVO =new ReservaManagerVO();
	ReservaManagerVO reserVO = reserDAO.selectReserva(reVO.getReserNum());
	
	System.out.println(reserVO.getName()+reserVO.getEmail()+reserVO.getPhone()+reserVO.getReserDate()+reserVO.getReserNum()+
			reserVO.getTourName()+reserVO.getAdultCnt()+reserVO.getOtherCnt()+reserVO.getSeatNum());
	
	//예약 확정1
//	ReservaManagerDAO reserDAO = ReservaManagerDAO.getInstance();
//	ReservaManagerVO reVO =new ReservaManagerVO();
//	int reserVO = reserDAO.updateReserva(reVO.getReserNum()) ;
//	System.out.println(reserVO);
//	reserDAO.updateDelReserva(reVO);
//	System.out.println(reVO);
	//취소 상세
//	ReservaManagerVO reserVO = reserDAO.selectDelReserva(reVO.getReserNum());
//	System.out.println(reserVO.getReserNum()+reserVO.getName()+reserVO.getEmail()+reserVO.getPhone()+reserVO.getReserDate()+reserVO.getReserNum()+
//			reserVO.getTourName()+reserVO.getAdultCnt()+reserVO.getOtherCnt()+reserVO.getSeatNum()+reserVO.getCancelReas());
//	
	

}//콘솔 창
	
}