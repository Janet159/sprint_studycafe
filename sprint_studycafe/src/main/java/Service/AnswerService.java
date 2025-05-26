package Service;

import java.util.List;
import java.util.Map;

import DTO.Answer;

public interface AnswerService {
	
	/** 전체 목록 조회 */
	List<Answer> list();
	
	/** 특정 유저 목록 조회 */ 
	List<Answer> listBy();

	/** 조회 */ 
	Answer selectBy(int no);

	/** 등록 */
	Answer insert(Answer answer);

	/** 수정 */
	boolean update(Answer answer);

	/** 삭제 */
	boolean delete(Answer answer);

}
