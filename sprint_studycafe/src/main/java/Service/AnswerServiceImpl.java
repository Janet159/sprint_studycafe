package Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DAO.AnswerDAO;
import DTO.Answer;

public class AnswerServiceImpl implements AnswerService {
	private AnswerDAO answerDAO = new AnswerDAO();

	@Override
	public List<Answer> list() {
		List<Answer> list = null;
		try {
			list = answerDAO.list();
		} catch (Exception e) {
			e.printStackTrace();
			list = new ArrayList<Answer>();
		}

		return list;
	}

	@Override
	public List<Answer> listBy() {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public Answer selectBy(int no) {
		Answer answer = null;

		try {
			Map<String, Object> fields = new HashMap<String, Object>() ;
			fields.put("board_no", no);
			answer = answerDAO.selectBy(fields);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return answer;
	}


	@Override
	public Answer insert(Answer answer) {
		int result = 0;
		try {
			result = answerDAO.insert(answer);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			return answer;
		}
		return null;
	}

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

	@Override
	public boolean delete(Answer answer) {
		int result = 0;

		try {
			result = answerDAO.delete(answer);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			return true;
		}
		return false;
	}

}
