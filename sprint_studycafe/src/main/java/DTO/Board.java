package DTO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("board")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Board {

	@Pk
	/** 게시글 번호 */
	private int no;
	/** 사용자 아이디 */
	private String userId;
	/** 구분 */
	private int typeNo;
	/** 제목 */
	private String title;
	/** 내용 */
	private String content;
	/** 공개여부 */
	private boolean privateKbn;
	/** 전화번호 */
	private String phonenumber;
	/** 등록일자 */
	private Date createdAt;
	/** 수정일자 */
	private Date updatedAt;
	/** 답변여부 */
	private boolean answeredKbn;
	
	public String getIsAnswered() {
		return String.valueOf(answeredKbn);
	}

	public static List<Board> getTestList() {
		List<Board> resultList = new ArrayList<Board>();
		Board board = new Board(1, "t1", 1, "j1", "k1", true, "010000", new Date(), new Date(), false);
		resultList.add(board);

		boolean is1 = true ;
		boolean is2 = false ;
		for (int i = 0; i < 6; i++) {
			Board result = new Board(i,"userid" + i, i , "title" + i, "content" + i, is1, "01012345678", new Date(), new Date(), is2);
			resultList.add(result);
			is1 = !is1;
			is2 = !is2;
		}
		
		return resultList;
	}

}
