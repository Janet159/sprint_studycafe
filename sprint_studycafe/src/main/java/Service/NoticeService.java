package Service;

import java.util.List;

import DTO.Notice;

public interface NoticeService {
	
	/** 전체 목록 조회 */
	List<Notice> list();
	
	/** 특정 유저 목록 조회 */ 
//	List<Notice> listBy();

	/** 조회 */ 
	Notice select(int no);

	/** 등록 */
	int insert(Notice notice);

	/** 수정 */
	boolean update(Notice notice);

	/** 삭제 */
	boolean delete(Notice notice);

}
