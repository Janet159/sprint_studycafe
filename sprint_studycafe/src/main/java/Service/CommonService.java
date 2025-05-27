package Service;

import java.util.List;
import java.util.Map;

import DTO.Seats;
import DTO.Ticket;
import DTO.Type;

public interface CommonService {
	
	/** 타입 목록 조회 */ 
	List<Type> getTypeList(String type);
	/** 타입 목록 조회 */
	Map<Integer, Type> getTypeMap(String type);

	/** 이용권 목록 조회 */
	List<Ticket> getTicketList();
	/** 이용권 목록 조회 */
	Map<String, Ticket> getTicketMap();
	
	/** 좌석 관리 */
	List<Seats> getSeatList();
	/** 좌석 관리 */
	Map<String, Seats> getSeatMap();
}
