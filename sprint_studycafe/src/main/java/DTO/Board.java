package DTO;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Column;
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
	
	@Column(exist = false)
	private String typeName;
	
	public String getIsAnswered() {
		return String.valueOf(answeredKbn);
	}
}
