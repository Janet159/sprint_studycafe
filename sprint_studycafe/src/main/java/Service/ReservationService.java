package Service;

import java.util.List;

import DTO.Reservation;

public interface ReservationService {
	/** 전체 목록 조회 */
	List<Reservation> list();
}
