package kr.co.goyang.user.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.goyang.dbConnection.DbConnection;
import kr.co.goyang.user.vo.UserVO;

public class UserDAO {
	public static UserDAO userDao;
	
	public UserDAO() { 
		
	}
	
	public static UserDAO getInstance() {
		if ( userDao == null ) {
			userDao = new UserDAO();
		}
		return userDao;
	}//getInstance
	
	/*-다영수정-*/
	public List<UserVO> selectTourNameNum() throws SQLException { // 투어이름,넘버가져오기
		List<UserVO> tourNames = null;

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
			tourNames = new ArrayList<UserVO>();

			while (rs.next()) {// 조회된 레코드가 있음
				UserVO uVO=new UserVO();
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
	
	//회원가입
	public int insertUser(UserVO userVo) throws SQLException  {
		
		int chk=-1;
		System.out.println(userVo);
		DbConnection dc=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		//1.드라이버 로딩
		try {
			//2.커넥션 얻기
			con=dc.getConn();
			
			//자동커밋 false
			con.setAutoCommit(false);
			
			//3.쿼리문 생성객체 얻기
			String insertUser="insert into TOUR_USER(id,password,email,name,phone,zipcode,addr,de_addr,join_date,tour_num)"
					+ " values(?,?,?,?,?,?,?,?,sysdate,?)";
			pstmt=con.prepareStatement(insertUser);//쿼리문을 넣어 쿼리문 실행 객체를 얻는다.
			//4.바인드 변수에 값 설정
			pstmt.setString(1, userVo.getId());
			pstmt.setString(2, userVo.getPassword());
			pstmt.setString(3, userVo.getEmail());
			pstmt.setString(4, userVo.getName());
			pstmt.setString(5, userVo.getPhone());
			pstmt.setString(6, userVo.getZipcode());
			pstmt.setString(7, userVo.getAddr());
			pstmt.setString(8, userVo.getDeAddr());
			pstmt.setInt(9, userVo.getTourNum());
			//5.쿼리문 수행 후 결과 얻기
			chk=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			//6.연결 끊기
			dc.dbClose(null, pstmt, con);
		}
		return chk;
	}//void
	
	//내 정보 수정
	public int updateUser ( UserVO userVo) throws SQLException {
		int updateCnt=0;
		
		DbConnection dc=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		//1.드라이버로딩
		try {
		//2.커넥션얻기
			con=dc.getConn();
		//3.쿼리문 생성객체 얻기
			String updateUser="update TOUR_USER "
					+ " set PASSWORD=?, EMAIL=?, NAME=?, PHONE=?, ZIPCODE=?,"
					+ " ADDR=?, DE_ADDR=?, JOIN_DATE=?, TOUR_NUM=?"
					+ " where ID=?";
			pstmt=con.prepareStatement(updateUser);//쿼리문을 넣어 쿼리문 실행 객체를 얻는다.

		//4.바인드 변수에 값 설정
			pstmt.setString(1, userVo.getId());
			pstmt.setString(2, userVo.getPassword());
			pstmt.setString(3, userVo.getEmail());
			pstmt.setString(4, userVo.getName());
			pstmt.setString(5, userVo.getPhone());
			pstmt.setString(6, userVo.getZipcode());
			pstmt.setString(7, userVo.getAddr());
			pstmt.setString(8, userVo.getDeAddr());
			pstmt.setDate(9, (Date) userVo.getJoinDate());
			pstmt.setInt(10, userVo.getTourNum());
		//5.쿼리문 수행 후 결과 얻기
			updateCnt=pstmt.executeUpdate();
		}finally {
		//6.연결 끊기
			dc.dbClose(null, pstmt, con);
		}
		return updateCnt;
		
	}//int
	
	//내 정보 불러오기
	public UserVO selectUser (String ID) throws SQLException {
			UserVO userVO=null;
			
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			DbConnection db=DbConnection.getInstance();
			try {
			//1.드라이버 로딩
			//2.커넥션 얻기
				con=db.getConn();
			//3.쿼리문 생성객체 얻기
				String selectUser="select PASSWORD, EMAIL, NAME, PHONE, ZIPCODE,"
						+ " ADDR, DE_ADDR, JOIN_DATE, TOUR_NUM"
						+ " from TOUR_USER"
						+ " where ID=?";
				pstmt=con.prepareStatement(selectUser);//쿼리문을 넣어 쿼리문 실행 객체를 얻는다.

			//4.바인드변수 값 설정
				pstmt.setString(1, ID);
			//5.쿼리문 수행 후 결과 얻기
				rs=pstmt.executeQuery();
				if(rs.next()) {//조회된 레코드가 있음
					userVO=new UserVO();
					//setter method를 호출하여 값을 설정 => 필요한 값만 넣을 수 있고 어떤 값을 넣는지 쉽게 알 수 있다.
					userVO.setPassword(rs.getString("PASSWORD"));
					userVO.setEmail(rs.getString("EMAIL"));
					userVO.setName(rs.getString("NAME"));
					userVO.setPhone(rs.getString("PHONE"));
					userVO.setZipcode(rs.getString("ZIPCODE"));
					userVO.setAddr(rs.getString("ADDR"));
					userVO.setDeAddr(rs.getString("DE_ADDR"));
					userVO.setJoinDate(rs.getDate("JOIN_DATE"));
					userVO.setTourNum(rs.getInt("TOUR_NUM"));
				}
			}finally{
			//6.연결 끊기
				db.dbClose(rs, pstmt, con);
			}
			return userVO;
		
	}//String
	
	//탈퇴
	public int deleteUser (String ID) throws SQLException{
		int deleteCnt=0;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		DbConnection db=DbConnection.getInstance();
		
		try {
		//1.드라이버로딩
		//2.커넥션얻기
			con=db.getConn();
		//3.쿼리문 생성객체 얻기
			String deleteUser="delete from TOUR_USER where ID=?";
			pstmt=con.prepareStatement(deleteUser);
		//4.바인드변수에 값 설정
			pstmt.setString(1, ID);
		//5.쿼리문 수행 후 결과 얻기
			deleteCnt=pstmt.executeUpdate();//리턴되는 값 : 0 - 삭제된 행 없는 경우
											//또는 1 - 삭제된 행이 하나인 경우
		}finally {
		//6.연결 끊기
			db.dbClose(null, pstmt, con);
		}
		return deleteCnt; 
		
	}//String
	
	
	//로그인
	public int selectLogin (String id, String password) throws SQLException {
		
		String pass;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		System.out.println(id+password);
		DbConnection db=DbConnection.getInstance();
		try {
		//1.드라이버 로딩
		//2.커넥션 얻기
			con=db.getConn();
		//3.쿼리문 생성객체 얻기
			String selectLogin="select password from TOUR_USER where ID=?";
			pstmt=con.prepareStatement(selectLogin);//쿼리문을 넣어 쿼리문 실행 객체를 얻는다.

		//4.바인드변수 값 설정
			pstmt.setString(1, id);
		//5.쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			while(rs.next()) {//조회된 레코드가 있음
				pass=rs.getString("password");
				System.out.println(pass);
				if(pass.equals(password)) {
					System.out.println("성공");
					return 1; //로그인 성공
				}else {
					System.out.println("비밀번호 실패");
					return 0; //비밀번호 불일치
				}
			}
				System.out.println("아이디 없음");
				return -1; //아이디가 없음
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				//6.연결 끊기
				db.dbClose(rs, pstmt, con);
			}
		System.out.println("DB오류");
		return -2;//db오류
	}//int
	
	//아이디 중복체크
	public boolean selectIdChk(String id) throws SQLException, NamingException {
		boolean flag=false;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		try {
			//1.드라이버 로딩
			//2.커넥션 얻기
				con=db.getConn();
			//3.쿼리문 생성객체 얻기
				String selectIdChk="select ID"
						+ " from TOUR_USER"
						+ " where ID=?";
				pstmt=con.prepareStatement(selectIdChk);//쿼리문을 넣어 쿼리문 실행 객체를 얻는다.

			//4.바인드변수 값 설정
				pstmt.setString(1, id);
			//5.쿼리문 수행 후 결과 얻기
				rs=pstmt.executeQuery();
				while(rs.next()) {
					flag=true;
				}

		}catch(Exception e ) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return flag;
	}
	
	//아이디 찾기
	public String selectFindId (String name, String email) throws SQLException {
		String userId=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		try {
		//1.드라이버 로딩
		//2.커넥션 얻기
			con=db.getConn();
		//3.쿼리문 생성객체 얻기
			String selectFindId="select id"
					+ " from TOUR_USER"
					+ " where name=? and email=?";
			pstmt=con.prepareStatement(selectFindId);//쿼리문을 넣어 쿼리문 실행 객체를 얻는다.

		//4.바인드변수 값 설정
			pstmt.setString(1, name);
			pstmt.setString(2, email);
		//5.쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {//조회된 레코드가 있음
				userId=rs.getString("id");
			}
			}catch(Exception e) {
				e.printStackTrace();
		}
		return userId;
		
	}//String
	
	//비밀번호 변경 전 회원정보 확인
	public String selectFindPass (String id, String name, String email) throws SQLException {
		String pass=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		try {
		//1.드라이버 로딩
		//2.커넥션 얻기
			con=db.getConn();
		//3.쿼리문 생성객체 얻기
			String selectFindPass="select password"
					+ " from TOUR_USER"
					+ " where id=? and name=? and email=?";
			pstmt=con.prepareStatement(selectFindPass);//쿼리문을 넣어 쿼리문 실행 객체를 얻는다.

		//4.바인드변수 값 설정
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
		//5.쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {//조회된 레코드가 있음
				pass=rs.getString("password");
			}
			}catch(Exception e) {
				e.printStackTrace();
		}finally{
		//6.연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		return pass;
		
	}//String
	public int updatePass (String id, String password) throws SQLException {
		int rows=-1;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		DbConnection db=DbConnection.getInstance();
		try {
		//1.드라이버 로딩
		//2.커넥션 얻기
			con=db.getConn();
		//3.쿼리문 생성객체 얻기
			String updatePass="update TOUR_USER set password=? where id=?";
			pstmt=con.prepareStatement(updatePass);//쿼리문을 넣어 쿼리문 실행 객체를 얻는다.

		//4.바인드변수 값 설정
			pstmt.setString(1, password);
			pstmt.setString(2, id);
			
		//5.쿼리문 수행 후 결과 얻기
			rows=pstmt.executeUpdate();
			
			}catch(Exception e) {
				e.printStackTrace();
		}finally{
		//6.연결 끊기
			db.dbClose(null, pstmt, con);
		}
		return rows;
		
	}//boolean

}//DAO
