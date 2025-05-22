package Service;

import java.util.List;

import DAO.BoardDAO;
import DTO.Board;

public class BoardServiceImpl implements BoardService {
	private BoardDAO boardDAO = new BoardDAO();

	@Override
	public List<Board> list() {
		List<Board> list = null;
		try {
			list = boardDAO.list();
		} catch (Exception e) {
			System.err.println();
			System.out.println();
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Board> listBy() {
		// TODO Auto-generated method stub
		return null;
	}

	
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


	@Override
	public Board insert(Board board) {
		int result = 0;
		try {
			result = boardDAO.insert(board);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			return board;
		}
		return null;
	}

	@Override
	public boolean update(Board board) {
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

	@Override
	public boolean delete(Board board) {
		int result = 0;

		try {
			result = boardDAO.delete(board);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			return true;
		}
		return false;
	}

}
