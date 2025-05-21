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

@Table("Answer")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Answer {

	@Pk
	/** 답변 번호 */
	private int no;
	/** 게시글 번호 */
	private int boardNo;
	/** 관리자 아이디 */
	private String adminId;
	/** 내용 */
	private String content;
	/** 등록 일자 */
	private Date createdAt;
	/** 수정 일자 */
	private Date updatedAt;

	public static List<Answer> getTestList() {
		List<Answer> resultList = new ArrayList<Answer>();

		for (int i = 0; i < 6; i++) {
			Answer result = new Answer(i, i, "admin" + i, "content" + i, new Date(), new Date());
			resultList.add(result);
		}
		return resultList;
	}
}
