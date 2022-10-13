package kr.co.goyang.manager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.goyang.dbConnection.DbConnection;
import kr.co.goyang.manager.vo.ManagerVO;
import kr.co.goyang.user.vo.TourMainVO;

public class ManagerDAO {
	
	private static ManagerDAO tourDAO;
	
	private ManagerDAO() {
		
	}
	
	public static ManagerDAO getInstance() {
		if(tourDAO==null) {
			tourDAO = new ManagerDAO();
		}
		return tourDAO;
	}
	
	public boolean selectLoginManager(ManagerVO mVO) throws SQLException {
		boolean login=false;
		
		String mId=mVO.getId();
		String mPw=mVO.getPassword();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 

		try {
			conn = dbCon.getConn();
			
			StringBuilder selectAllTour = new StringBuilder();
			selectAllTour
			.append("	select id ")
			.append("	from manager")
			.append("	where id=? and password=?");
			pstmt = conn.prepareStatement(selectAllTour.toString());
			// 4. 바인드 변수에 값 설정
			pstmt.setString(1, mId);
			pstmt.setString(2, mPw);
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.
			

			while (rs.next()) {
				login=true;
			}
			return login;
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}
		
		
		
	}
	
	public static void main(String[] args) {
		ManagerVO mVO=new ManagerVO();
		mVO.setId("admin");
		mVO.setPassword("1111");
		ManagerDAO mDAO=ManagerDAO.getInstance();
		boolean login;
		try {
			login = mDAO.selectLoginManager(mVO);
			if(login) {
				System.out.println(mVO.getId()+"관리자님 로그인성공");
			}else {
				System.out.println(mVO.getId()+"는 관리자로 등록되어있지않습니다.");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
