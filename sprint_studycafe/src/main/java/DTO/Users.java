package DTO;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("users")
@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder
public class Users {
	@Pk
	/** 아이디 */
	private String user_id;
	/** 비밀번호 */
	private String password;
	/** 이름 */
	private String name;
	/** 이메일 */
	private String email;
	/** 권한 */
	private boolean adminKbn;
	/** 가입날짜 */
	private Date createdAt;
	
	public boolean getAdminKbn() {
		return this.adminKbn;
	}

}
