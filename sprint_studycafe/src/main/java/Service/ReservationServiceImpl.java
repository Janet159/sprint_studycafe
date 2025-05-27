package Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import DAO.ReservationDAO;
import DTO.Reservation;

public class ReservationServiceImpl implements ReservationService {
	ReservationDAO dao = new ReservationDAO();

	/** 좌석 구매 리스트 */
	@Override
	public List<Reservation> reservationList() {
		List<Reservation> list = new ArrayList<Reservation>();

		try {
			list = dao.reservationList();
		} catch (Exception e) {
			e.printStackTrace();
			list = new ArrayList<Reservation>();
		}

		return list;
	}

	/** 나의 구매 내역 */
	@Override
	public List<Reservation> orderList(String userId) {
		List<Reservation> list = new ArrayList<Reservation>();

		try {
			list = dao.orderList(userId);
		} catch (Exception e) {
			e.printStackTrace();
			list = new ArrayList<Reservation>();
		}

		return list;
	}

	/** 좌석 현황 */
	@Override
	public List<Reservation> seatList() {
		List<Reservation> list = new ArrayList<Reservation>();

		try {
			list = dao.seatList();
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

	/** 현재 주문 내역 조회 */
	@Override
	public Reservation select(String userId) {
		Reservation dto = null;
		try {
			List<Reservation> list = dao.orderList(userId);
			if (null != list && list.size() >= 1) {
				
				Date now = new Date();
				Date endTime = list.get(0).getEndTime();

				if (now.after(endTime)) {
				    dto = list.get(0);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (null == dto) dto = new Reservation();

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
}
