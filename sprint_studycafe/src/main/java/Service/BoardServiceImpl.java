package Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DAO.BoardDAO;
import DTO.Board;

public class BoardServiceImpl implements BoardService {
	private BoardDAO boardDAO = new BoardDAO();

	/** 전체 목록 조회 */
	@Override
	public List<Board> list() {
		List<Board> list = null;
		try {
			list = boardDAO.list();
		} catch (Exception e) {
			e.printStackTrace();
			list = new ArrayList<Board>();
		}

		return list;
	}

	/** 특정 유저 목록 조회 */
	@Override
	public List<Board> listBy(String userId) {
		List<Board> list = null;
		try {
			Map<String, Object> fields = new HashMap<String, Object>();
			fields.put("userId", userId);
			list = boardDAO.listBy(fields);
		} catch (Exception e) {
			e.printStackTrace();
			list = new ArrayList<Board>();
		}

		return list;
	}

	/** 조회 */
	@Override
	public Board select(int no) {
		Board board = null;

		try {
			board = boardDAO.select(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}

	/** 등록 */
	@Override
	public Board insert(Board board) {
		Board result;
		try {
			result = boardDAO.insertKey(board);
		} catch (Exception e) {
			e.printStackTrace();
			result = new Board();
		}
		return result;
	}

	/** 수정 */
	@Override
	public boolean update(Board board) {
		System.out.println("update");
		int result = 0;
		try {
			result = boardDAO.update(board);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			return true;
		}
		return false;
	}

	/** 수정 : 답변 업데이트 */
	@Override
	public boolean update(Board board, boolean kbn) {
		System.out.println("field : " + kbn);
		int result = 0;
		try {
			result = boardDAO.update(board, kbn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			return true;
		}
		return false;
	}

	/** 삭제 */
	@Override
	public boolean delete(int no) {
		int result = 0;

		try {
			result = boardDAO.delete(no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			return true;
		}
		return false;
	}
}
