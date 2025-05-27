package Service;

import java.util.List;

import DTO.Users;

public interface UsersService {

	/** 전체 목록 조회 */
	List<Users> list();

	/** 조회 */
	Users select(int no);

	///** 로그인 정보에 따른 조회 */
	//Users login(String userId, String password);

	/** 등록 */
	Users insert(Users users);

	/** 아이디 중복 확인 */
	public boolean idCheck(String username);

	/** 로그인 */
	public boolean login(Users user);

	/** 아이디로 회원 조회 */
	public Users selectByUsername(String username);

}
