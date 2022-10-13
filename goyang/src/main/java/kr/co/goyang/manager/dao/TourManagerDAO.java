package kr.co.goyang.manager.dao;

import java.util.ArrayList;
import java.util.List;

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
	
	/**투어 검색, 전체 투어 리스트
	 * @param tourVO
	 * @return
	 */
	public List<TourManagerVO> selectSearchTour(TourManagerVO tourVO){
		List<TourManagerVO> list = new ArrayList<TourManagerVO>();
		return list;
	}
	
	/**상세보기
	 * @param i
	 * @return
	 */
	public TourManagerVO selectTour(int i) {
		TourManagerVO tourVO = new TourManagerVO();
		return tourVO;
	}
	
	/**투어별 관광지
	 * @param tourNum
	 * @return
	 */
	public List<TourManagerVO> selectTourSpots(int tourNum){
		List<TourManagerVO> list = new ArrayList<TourManagerVO>();
		return list;
	}
	
	/**투어 정보 수정
	 * @param tourVO
	 * @return
	 */
	public int updateTour(TourManagerVO tourVO) {
		int i = 0;
		return i;
	}
	
	/**투어 관광지 수정 삭제
	 * @param tourVO
	 * @return
	 */
	public int deleteTourSpots(TourManagerVO tourVO) {
		int i = 0;
		return i;
	}
	
	/**투어 관광지 수정 추가
	 * @param tourVO
	 * @return
	 */
	public void insertTourSpots(TourManagerVO tourVO) {
		
	}
	
	/**투어 정보 종료
	 * @param j
	 * @return
	 */
	public int updateTourDown(int j) {
		int i = 0;
		return i;
	}
	
	/**투어 정보 추가
	 * @param tourVO
	 */
	public void insertTour(TourManagerVO tourVO) {
		
	}
	
}
