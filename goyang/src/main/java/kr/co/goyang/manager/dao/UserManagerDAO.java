package kr.co.goyang.manager.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.dbConnection.DbConnection;
import kr.co.goyang.manager.vo.UserManagerVO;

public class UserManagerDAO {

	private static UserManagerDAO tourDAO;
	private UserManagerDAO() {
		
	}
	
	public static UserManagerDAO getInstance() {
		if(tourDAO==null) {
			tourDAO=new UserManagerDAO();
		}
		
		return tourDAO;
		
	}
	
	@SuppressWarnings("resource")
	public UserManagerVO selectUser(String id) throws SQLException{ // 상세보기
		UserManagerVO umVO = new UserManagerVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();
		try {
			// 1. 드라이버 로딩
			// 2. 커넥션 얻기
			con = db.getConn();
			///////////////////////////////////////////////////////////////
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder selectUser = new StringBuilder();
			selectUser
			.append("	select name, email, id, join_date, phone, zipcode, addr, tour_num	")
			.append("	from tour_user	")
			.append("	where id=?	");

			pstmt = con.prepareStatement(selectUser.toString());

			// 4. 바인드 변수에 값 설정
			pstmt.setString(1, id);

			// 5. 쿼리문 수행 결과 얻기
			rs = pstmt.executeQuery();

			if (rs.next()) {// 조회된 레코드가 있음
				// 조회 컬럼 값을 저장하기 위해 VO를 생성
				umVO.setName(rs.getString("name"));
				umVO.setEmail(rs.getString("email"));
				umVO.setId(rs.getString("id"));
				umVO.setJoinDate(rs.getDate("join_date"));
				umVO.setPhone(rs.getString("phone"));
				umVO.setZipcode(rs.getString("zipcode"));
				umVO.setAddr(rs.getString("addr"));
				umVO.setTourNum(rs.getInt("tour_num"));
			}
			////////////////////////////////////////////////////
			StringBuilder tourName = new StringBuilder();
			tourName
			.append("	select tour_name	")
			.append("	from tour			")
			.append("	where tour_num=?	");
			
			pstmt = con.prepareStatement(tourName.toString());
			
			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, umVO.getTourNum());
			
			// 5. 쿼리문 수행 결과 얻기
			rs = pstmt.executeQuery();
			
			if (rs.next()) {// 조회된 레코드가 있음
				umVO.setTourName(rs.getString("tour_name"));
			}
			
		} finally {
			// 6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		return umVO;		
	}
	
	public List<UserManagerVO> selectSearchUser(UserManagerVO umVO) throws SQLException{ // 회원 검색
		List<UserManagerVO> userList = new ArrayList<UserManagerVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();
		try {
			// 1. 드라이버 로딩
			// 2. 커넥션 얻기
			con = db.getConn();

			// 3. 쿼리문 생성 객체 얻기
			StringBuilder selectUserList = new StringBuilder();
			selectUserList
			.append("	select id, name, join_date, out_flag 	")
			.append("	from tour_user				");
			
			System.out.println("umVO.getListSearch() : "+umVO.getListSearch());
			if(umVO.getListSearch()==null) {
				umVO.setListSearch("선택");
			}
			if(umVO.getTextSearch() == null){
				umVO.setTextSearch("");
			}
			
			if(!umVO.getListSearch().equals("선택")) {
				if(umVO.getListSearch().equals("아이디")) {
					selectUserList.append("	where id like ?	");
				}else if(umVO.getListSearch().equals("이름")) {
					selectUserList.append("	where name like ?	");
				}else {
					selectUserList.append("	where join_date=?	");
				}
			}
			
			selectUserList.append("	order by out_flag desc, join_date	");
			pstmt = con.prepareStatement(selectUserList.toString());
			
			System.out.println("umVO.getTextSearch() : "+umVO.getTextSearch());
			if(!umVO.getListSearch().equals("선택")) {
				if(umVO.getListSearch().equals("가입일자")) {
					pstmt.setDate(1, Date.valueOf(umVO.getTextSearch()));
				}else{
					pstmt.setString(1, '%'+umVO.getTextSearch()+'%');
				}
			}
			
			// 5. 쿼리문 수행 결과 얻기
			rs = pstmt.executeQuery();

			while (rs.next()) {// 조회된 레코드가 있음
				umVO = new UserManagerVO();
				// setter method를 호출하여 값을 설정 => 필요한 값만 넣을 수 있고 어떤 값을 넣는지 알 수 있음
				umVO.setId(rs.getString("id"));
				umVO.setName(rs.getString("name"));
				umVO.setJoinDate(rs.getDate("join_date"));
				umVO.setOutFlag(rs.getInt("out_flag"));
  
				userList.add(umVO);
			}
 			
		} finally {
			// 6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		return userList;
	}
	
	public void insertDelReasUser(UserManagerVO umVO) throws SQLException { // 삭제 이유
		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			// 1.드라이버 로딩
			// 2.connection 얻기
			con = dc.getConn();

			// 3.쿼리문 생성 객체 얻기
			StringBuilder insertDelRea = new StringBuilder();
			insertDelRea
			.append("	insert into user_out(id, out_reas, out_date)	")
			.append("	values(?, ?, sysdate)	");

			pstmt = con.prepareStatement(insertDelRea.toString());

			// 4.바인드 변수에 값 설정
			pstmt.setString(1, umVO.getId());
			pstmt.setString(2, umVO.getOutReas());

			// 5.쿼리문 수행 결과 얻기
			pstmt.executeUpdate();

		} finally {
			// 6.연결 끊기
			dc.dbClose(null, pstmt, con);
		}

	}
}
