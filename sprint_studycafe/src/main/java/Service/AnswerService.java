package Service;

import DTO.Answer;

public interface AnswerService {
	
	/** 조회 */ 
	Answer selectBy(int no);

	/** 등록 */
	Answer insert(Answer answer);

	/** 수정 */
	boolean update(Answer answer);
}
