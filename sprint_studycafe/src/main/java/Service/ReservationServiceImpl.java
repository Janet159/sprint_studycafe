package Service;

import java.util.ArrayList;
import java.util.List;

import DAO.ReservationDAO;
import DTO.Reservation;

public class ReservationServiceImpl implements ReservationService {
	ReservationDAO dao = new ReservationDAO();

	/** 전체 목록 조회 */
	@Override
	public List<Reservation> list() {
		List<Reservation> list = new ArrayList<Reservation>();

		try {
			list = dao.list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/** 주문 내역 조회 */
	@Override
	public Reservation select(int no) {
		Reservation dto = null;
		try {
			dto = dao.select(no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dto = new Reservation();
		}

		return dto;
	}

	/** 주문 등록 */
	@Override
	public Reservation insert(Reservation dto) {
		Reservation result = null ;
		try {
			result = dao.insertKey(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
