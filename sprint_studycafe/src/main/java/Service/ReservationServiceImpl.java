package Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DAO.ReservationDAO;
import DTO.Reservation;

public class ReservationServiceImpl implements ReservationService {
	ReservationDAO dao = new ReservationDAO();

	/** 좌석 목록 조회 */
	@Override
	public List<Reservation> list() {
		List<Reservation> list = new ArrayList<Reservation>();

		try {
			list = dao.list();
		} catch (Exception e) {
			e.printStackTrace();
			list = new ArrayList<Reservation>();
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
			e.printStackTrace();
			dto = new Reservation();
		}

		return dto;
	}

	/** 주문 내역 조회 */
	@Override
	public Reservation select(String userId) {
		Reservation dto = null;
		try {
			List<Reservation> list = dao.list(userId);
			if (null != list && list.size() >= 1) {
				dto = list.get(0);
			} else {
				dto = new Reservation();
			}
		} catch (Exception e) {
			e.printStackTrace();
			dto = new Reservation();
		}

		return dto;
	}

	/** 주문 등록 */
	@Override
	public Reservation insert(Reservation dto) {
		Reservation result = null;
		try {
			result = dao.insertKey(dto);
		} catch (Exception e) {
			e.printStackTrace();
			dto = new Reservation();
		}

		return result;
	}

	/** 나의 구매 내역 */
	@Override
	public List<Reservation> list(String userId) {
		List<Reservation> list = new ArrayList<Reservation>();

		try {
			list = dao.list(userId);
		} catch (Exception e) {
			e.printStackTrace();
			list = new ArrayList<Reservation>();
		}

		return list;
	}

}
