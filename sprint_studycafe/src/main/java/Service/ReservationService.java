package Service;

import java.util.List;

import DTO.Reservation;

public interface ReservationService {
	/** 좌석 구매 리스트 */
	List<Reservation> reservationList();

	/** 나의 구매 내역 */
	List<Reservation> orderList(String userId);
	
	/** 좌석 현황 */
	List<Reservation> seatList();
	
	/** 주문 내역 조회 */
	Reservation select(int no);

	/** 현재 주문 내역 조회 */
	Reservation select(String userId);

	/** 주문 등록 */
	Reservation insert(Reservation dto);
}
