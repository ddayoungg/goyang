package kr.co.goyang.manager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.dbConnection.DbConnection;
import kr.co.goyang.manager.vo.SpotListVO;
import kr.co.goyang.manager.vo.TourManagerVO;

public class SpotListDAO {
	private static SpotListDAO spotDAO;
	
	private SpotListDAO() {
		
	}
	
	public static SpotListDAO getInstance() {
		if (spotDAO == null) {
			spotDAO = new SpotListDAO();
		}
		return spotDAO; 
	}
	
	/**투어 코스별 관광지 리스트
	 * @param i
	 * @return
	 */
	public List<SpotListVO> selectTourSpots(String i) throws SQLException{
		List<SpotListVO> list = new ArrayList<SpotListVO>();
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {  
			conn = dbCon.getConn();
			////////////////////////////////////////////////
			StringBuilder selectAllSpots = new StringBuilder();
			selectAllSpots
			.append("	select tour.tour_num,tour_spots.tour_order,tour.tour_name,tour_spots.spots_name")
			.append("	from tour,tour_spots")
			.append("	where tour.tour_num=tour_spots.tour_num and tour.run_flag=1 and tour.tour_name=?")
			.append("	order by tour.tour_num,tour_spots.tour_order");
			pstmt = conn.prepareStatement(selectAllSpots.toString());
			// 4. 바인드 변수에 값 설정
			//해당 투어검색
			pstmt.setString(1, i); 
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.

			while (rs.next()) {
				SpotListVO spVO=new SpotListVO();
				spVO.setTourNum(rs.getInt("tour_num"));
				spVO.setTourOrder(rs.getInt("tour_order"));
				spVO.setTourName(rs.getString("tour_name"));
				spVO.setSpotsName(rs.getString("spots_name"));
				list.add(spVO);
			}
			
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	/**검색 리스트
	 * @return
	 */
	@SuppressWarnings("resource")
	public String[] selectTourList() throws SQLException{
		String[] tourNames = {};
		int size=0;
		int index=0;
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbCon.getConn();
			///////////////////배열 크기할당//////////////////
			StringBuilder selectCnt = new StringBuilder();
			selectCnt
			.append("	select count(*) as cnt")
			.append("	from tour")
			.append("	where run_flag=1");
			pstmt = conn.prepareStatement(selectCnt.toString());
			// 4. 바인드 변수에 값 설정
			//해당 투어검색
			//pstmt.setInt(1, i); 
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.

			while (rs.next()) {
				size=rs.getInt("cnt");
			}
			tourNames=new String[size];
			
			//////////////크기에 맞게 투어전체검색////////////////
			StringBuilder selectTourName = new StringBuilder();
			selectTourName
			.append("	select tour_name")
			.append("	from tour")
			.append("	where run_flag=1")
			.append("	order by tour_num");
			pstmt = conn.prepareStatement(selectTourName.toString());
			// 4. 바인드 변수에 값 설정
			//해당 투어검색
			//pstmt.setInt(1, i); 
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.
			
			while (rs.next()) {
				tourNames[index]=rs.getString("tour_name");
				index++;
			}
			
			
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}
		
		
		return tourNames;
	}
	
	/**관광지 상세 화면
	 * @param spotVO
	 * @return
	 */
	@SuppressWarnings("resource")
	public SpotListVO selectSpot(SpotListVO spotVO) throws SQLException {
		SpotListVO spotDetail = new SpotListVO();
		int tourNum=0;
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbCon.getConn();
			
			///////////////////선택한 투어의 넘버//////////////////
			StringBuilder selectTourNum = new StringBuilder();
			selectTourNum
			.append("	select tour_num")
			.append("	from tour")
			.append("	where tour_name=?");
			pstmt = conn.prepareStatement(selectTourNum.toString());
			// 4. 바인드 변수에 값 설정
			//해당 투어검색
			pstmt.setString(1, spotVO.getTourName()); 
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.
			
			while (rs.next()) {
				tourNum=rs.getInt("tour_num");
			}
			///////////////////////////////////////////////////////
			StringBuilder selectSpotDetail = new StringBuilder();
			selectSpotDetail
			.append("	select spots_name,spots_img,spo_content ")
			.append("	from tour_spots")
			.append("	where tour_num=? and tour_order=?");
			pstmt = conn.prepareStatement(selectSpotDetail.toString());
			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, tourNum);
			pstmt.setInt(2, spotVO.getTourOrder());
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.

			while (rs.next()) {
				spotDetail.setSpotsName(rs.getString("spots_name"));
				spotDetail.setSpotsImg(rs.getString("spots_img"));
				spotDetail.setSpoContent(rs.getString("spo_content"));
				
			}
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		}
		
		
		return spotDetail;
	}
	
	
	/**관광지 삭제
	 * @param spotVO
	 * @return
	 */
	@SuppressWarnings("resource")
	public int deleteSpot(SpotListVO spotVO) throws SQLException{
		int deleteCnt = 0;
		
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbCon.getConn();
			
			//////////////관광지 삭제/////////////////////
			StringBuilder deleteSpot = new StringBuilder();
			deleteSpot
			.append("	delete ")
			.append("	from tour_spots")
			.append("	where tour_num=? and tour_order=?");
			pstmt = conn.prepareStatement(deleteSpot.toString());
			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, spotVO.getTourNum());
			pstmt.setInt(2, spotVO.getTourOrder());
			// 5. 쿼리문 수행 후 결과 얻기
			deleteCnt=pstmt.executeUpdate();//리턴되는 값:0-삭제된 행없다/사원번호는 잘못넣음  | 리턴되는 값은:1: 삭제된 행이 하나
			
		
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		} 
		
		return deleteCnt;
	}
	
	/**관광지 수정
	 * @param spotVO
	 * @return
	 */
	@SuppressWarnings("resource")
	public int updateSpot(SpotListVO spotVO) throws SQLException{
		int updateCnt = 0;
		int tourNum=0;
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbCon.getConn();
			
			///////////////////선택한 투어의 넘버//////////////////
			StringBuilder selectTourNum = new StringBuilder();
			selectTourNum
			.append("	select tour_num")
			.append("	from tour")
			.append("	where tour_name=?");
			pstmt = conn.prepareStatement(selectTourNum.toString());
			// 4. 바인드 변수에 값 설정
			//해당 투어검색
			pstmt.setString(1, spotVO.getTourName()); 
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.
			
			while (rs.next()) {
				tourNum=rs.getInt("tour_num");
			}
			
			///////////////////////////////////////////////////////////
			
			
			StringBuilder updateSpot = new StringBuilder();
			updateSpot
			.append("	update tour_spots ")
			.append("	set spots_name=?,spo_content=?,spots_img=?")
			.append("	where tour_num=? and tour_order=?");
			
			pstmt = conn.prepareStatement(updateSpot.toString());
			// 4. 바인드 변수에 값 설정
			pstmt.setString(1, spotVO.getSpotsName());
			pstmt.setString(2, spotVO.getSpoContent());
			pstmt.setString(3, spotVO.getSpotsImg());
			pstmt.setInt(4, tourNum);
			pstmt.setInt(5, spotVO.getTourOrder());

			// 5. 쿼리문 수행 후 결과 얻기
			updateCnt=pstmt.executeUpdate();//

		
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		} 
		
		return updateCnt;

	}
	
	/**관광지 추가
	 * @param spotVO
	 */
	@SuppressWarnings("resource")
	public void insertSpot(SpotListVO spotVO) throws SQLException{
		
		int rowCnt=0;
		int tourNum=0;
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			conn = dbCon.getConn();
			
			///////////////////선택한 투어의 넘버//////////////////
			StringBuilder selectTourNum = new StringBuilder();
			selectTourNum
			.append("	select tour_num")
			.append("	from tour")
			.append("	where tour_name=?");
			pstmt = conn.prepareStatement(selectTourNum.toString());
			// 4. 바인드 변수에 값 설정
			//해당 투어검색
			pstmt.setString(1, spotVO.getTourName()); 
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.
			
			while (rs.next()) {
				tourNum=rs.getInt("tour_num");
			}
			
			///////////////////해당투어의 관광지개수//////////////////
			StringBuilder selectCnt = new StringBuilder();
			selectCnt
			.append("	select count(*) as cnt")
			.append("	from tour_spots")
			.append("	where tour_num=?");
			pstmt = conn.prepareStatement(selectCnt.toString());
			// 4. 바인드 변수에 값 설정
			//해당 투어검색
			pstmt.setInt(1, tourNum); 
			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery(); // rs는 커서의 제어권을 가지고 있다.

			while (rs.next()) {
				rowCnt=rs.getInt("cnt");
			}
			
			//////////////////////////////////////////////////
			
			StringBuilder insertSpot = new StringBuilder();
			insertSpot
			.append("	insert into tour_spots(tour_num,tour_order,spots_name,spo_content,spots_img,spots_regist)")
			.append("	values(?,?,?,?,?,sysdate)");
			 
			pstmt = conn.prepareStatement(insertSpot.toString());
			// 4. 바인드 변수에 값 설정
			pstmt.setInt(1, tourNum);
			pstmt.setInt(2, rowCnt+1); //있는 관광지개수에서 추가
			pstmt.setString(3, spotVO.getSpotsName());
			pstmt.setString(4, spotVO.getSpoContent());
			pstmt.setString(5, spotVO.getSpotsImg());

			// 5. 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();//

		
		} finally {
			dbCon.dbClose(rs, pstmt, conn);
		} 
		
		
	} 
	
	/*
	public static void main(String[] args) {
		SpotListDAO slDAO=SpotListDAO.getInstance();
		try {
			List<SpotListVO> allSpots=slDAO.selectTourSpots("화요나들이(벽제)");
			for(SpotListVO slVO:allSpots) {
				System.out.println(slVO.getTourOrder()+" : "+slVO.getTourName()+" : "+slVO.getSpotsName());
			}
			String[] AllTour=slDAO.selectTourList();
			for(String tour:AllTour) {
				System.out.println(tour);
			}
			
			SpotListVO one=new SpotListVO();
			one.setTourName("화요나들이(벽제)");
			one.setTourOrder(1);
			SpotListVO spotDetail=slDAO.selectSpot(one);
			System.out.println(spotDetail.getSpotsName()+" : "+spotDetail.getSpoContent()+" : "+spotDetail.getSpotsImg());
			
			SpotListVO del=new SpotListVO();
			del.setTourNum(4);
			del.setTourOrder(3);
			int deleteCnt=slDAO.deleteSpot(del);
			if(deleteCnt==1) {
				System.out.println("관광지가 삭제되었습니다.");
			}else {
				System.out.println("삭제할 관광지가 없습니다.");
			}
			
			SpotListVO upd=new SpotListVO();
			upd.setSpotsName("중남미문화원");
			upd.setSpoContent("중남미문화원의 내용입니다!!!.");
			upd.setSpotsImg("img_2.jpg");
			upd.setTourName("화요나들이(벽제)");
			upd.setTourOrder(1);
			int updateCnt=slDAO.updateSpot(upd);
			if(updateCnt==1) {
				System.out.println("관광지가 업데이트되었습니다.");
			}else {
				System.out.println("업데이트할 관광지가 없습니다.");
			}
			
			SpotListVO insert=new SpotListVO();
			insert.setTourName("화요나들이(벽제)");
			insert.setSpotsName("쌍용교육센터");
			insert.setSpoContent("곽우신강사님이 강의하시는 쌍용교육센터");
			insert.setSpotsImg("img_3.jpg");
			slDAO.insertSpot(insert);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	} 
	*/
}
