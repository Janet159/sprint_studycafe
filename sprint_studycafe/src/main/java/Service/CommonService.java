package Service;

import java.util.List;

import DTO.Seats;
import DTO.Ticket;
import DTO.Type;

public interface CommonService {
	
	/** 타입 목록 조회 */ 
	List<Type> getTypeList(String type);

	/** 이용권 목록 조회 */
	List<Ticket> getTicketList();
	
	/** 좌석 관리 */
	List<Seats> getSeatList();
}
