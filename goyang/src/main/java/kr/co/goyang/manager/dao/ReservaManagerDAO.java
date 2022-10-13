package kr.co.goyang.manager.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.goyang.manager.vo.ReservaManagerVO;
import kr.co.goyang.manager.vo.SpotListVO;
import kr.co.goyang.manager.vo.TourManagerVO;

public class ReservaManagerDAO {
	private static ReservaManagerDAO reserDAO;
	
	private ReservaManagerDAO() {
		
	}
	
	public static ReservaManagerDAO getInstance() {
		if (reserDAO == null) {
			reserDAO = new ReservaManagerDAO();
		}
		return reserDAO;
	}
	
	/**검색 결과, 전체 리스트
	 * @param reserVO
	 * @return
	 */
	public List<ReservaManagerVO> selectSearchReserva(ReservaManagerVO reserVO){
		List<ReservaManagerVO> list = new ArrayList<ReservaManagerVO>();
		return list;
	}
	
	/**예약 상세
	 * @param i
	 * @return
	 */
	public ReservaManagerVO selectReserva(int i){
		ReservaManagerVO reserVO = new ReservaManagerVO();
		return reserVO;
	}
	
	/**예약 확정
	 * @param reserVO
	 * @return
	 */
	public int updateReserva(ReservaManagerVO reserVO) {
		int i = 0;
		return i;
	}
	
	/**취소 사유 상세
	 * @param i
	 * @return
	 */
	public ReservaManagerVO selectDelReserva(int i) {
		ReservaManagerVO reserVO = new ReservaManagerVO();
		return reserVO;
	}
	
	/**취소 확정
	 * @param reserVO
	 * @return
	 */
	public int updateDelReserva(ReservaManagerVO reserVO) {
		int i = 0;
		return i;
	}
	
}
