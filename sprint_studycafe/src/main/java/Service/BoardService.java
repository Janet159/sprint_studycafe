package Service;

import java.util.List;

import DTO.Board;

public interface BoardService {
	
	/** 전체 목록 조회 */
	List<Board> list();
	
	/** 특정 유저 목록 조회 */ 
	List<Board> listBy();

	/** 조회 */ 
	Board select(int no);

	/** 등록 */
	Board insert(Board board);

	/** 수정 */
	boolean update(Board board);

	/** 삭제 */
	boolean delete(Board board);

}
