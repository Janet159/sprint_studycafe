package Service;

import java.util.List;

import DTO.Reservation;

public interface ReservationService {
	/** 전체 목록 조회 */
	List<Reservation> list();

	/** 주문 내역 조회 */
	Reservation select(int no);

	/** 주문 등록 */
	Reservation insert(Reservation dto);
}
