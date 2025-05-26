package Service;

import java.util.List;

import DTO.Reservation;

public interface ReservationService {
	/** 좌석 목록 조회 */
	List<Reservation> list();

	/** 주문 내역 조회 */
	Reservation select(int no);

	/** 주문 등록 */
	Reservation insert(Reservation dto);
	
	/** 나의 구매 내역 */
	List<Reservation> list(String userId);

	/** 좌석 정보 조회 */
	Reservation select(String userId);
}
