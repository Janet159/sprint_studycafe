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

@Table("users")
@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder
public class Users {
	@Pk
	/** 아이디 */
	private String userId;
	/** 비밀번호 */
	private String password;
	/** 이름 */
	private String name;
	/** 이메일 */
	private String email;
	/** 권한 */
	private boolean admin_kbn;
	/** 가입날짜 */
	private Date createdAt;

	public static List<Users> getTestList() {
		List<Users> resultList = new ArrayList<Users>();

		for (int i = 0; i < 6; i++) {
			Users result = new Users("userid" + i, "123456", "name" + i, "email" + i, false, new Date());
			resultList.add(result);
		}
		return resultList;
	}
}
