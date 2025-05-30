package DTO;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("Notice")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notice {
	@Pk
	/** 공지 번호 */
	private int no;
	/** 사용자 아이디 */
	private String adminId;
	/** 구분 */
	private int typeNo;
	/** 제목 */
	private String title;
	/** 내용 */
	private String content;
	/** 등록일자 */
	private Date createdAt;
	/** 수정일자 */
	private Date updatedAt;

	@Column(exist = false)
	private int vNum;
}
