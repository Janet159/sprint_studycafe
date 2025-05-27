package Service;

import java.util.HashMap;
import java.util.Map;

import DAO.AnswerDAO;
import DTO.Answer;

public class AnswerServiceImpl implements AnswerService {
	private AnswerDAO answerDAO = new AnswerDAO();

	/**
	 * 답변 조회
	 */
	@Override
	public Answer selectBy(int no) {
		Answer answer = null;

		try {
			Map<String, Object> fields = new HashMap<String, Object>();
			fields.put("board_no", no);
			answer = answerDAO.selectBy(fields);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return answer;
	}

	/**
	 * 답변 등록
	 */
	@Override
	public Answer insert(Answer answer) {
		Answer result;
		try {
			result = answerDAO.insertKey(answer);
		} catch (Exception e) {
			e.printStackTrace();
			result = new Answer();
		}

		return result;
	}

	/**
	 * 답변 수정
	 */
	@Override
	public boolean update(Answer answer) {
		int result = 0;
		try {
			result = answerDAO.update(answer);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			return true;
		}
		return false;
	}
}
