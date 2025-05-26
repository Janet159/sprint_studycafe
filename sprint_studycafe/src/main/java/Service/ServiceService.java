package Service;

import java.util.List;

import DTO.Service;

public interface ServiceService {
	
	/** 전체 목록 조회 */
	List<Service> list();

	/** 등록 */
	Service insert(Service service);

	/** 조회 */ 
	Service select(int no);
	
	/** 수정 */
	boolean update(Service service);

	/** 삭제 */
	boolean delete(Service service);

}
