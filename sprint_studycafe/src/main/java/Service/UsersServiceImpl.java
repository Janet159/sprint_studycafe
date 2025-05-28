package Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;

import DAO.UsersDAO;
import DTO.Users;

public class UsersServiceImpl implements UsersService {
	private UsersDAO usersDAO = new UsersDAO();

	/** 전체 목록 조회 */
	@Override
	public List<Users> list() {
		List<Users> list = null;
		try {
			list = usersDAO.list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/** 조회 */
	@Override
	public Users select(int no) {
		Users users = null;

		try {
			users = usersDAO.select(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

	/** 등록 */
	@Override
	public Users insert(Users users) {
		int result = 0;
		try {
			// 비밀번호 암호화
			String password = users.getPassword();
			String encodedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
			users.setPassword(encodedPassword);
			//회원 등록
			result = usersDAO.insert(users);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			return users;
		}
		return null;
	}

	/** 아이디 중복 확인 */
	@Override
	public boolean idCheck(String user_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);

		Object user = null;
		try {
			user = usersDAO.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 아이디 중복X
		if (user == null) {
			return false;
		}
		return true;
	}

	/** 로그인 */
	@Override
	public boolean login(Users user) {
		String user_id = user.getUser_id();
		String password = user.getPassword();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);

		Users joinedUser = null;
		try {
			joinedUser = usersDAO.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 아이디가 존재 하지 않는 경우
		if (joinedUser == null)
			return false;
		// 비밀번호 일치 여부 확인
		String joinedPassword = joinedUser.getPassword();
		boolean result = false;
		try {
		    result = BCrypt.checkpw(password, joinedPassword);
		} catch (IllegalArgumentException e) {
		    // 암호화된 값이 아님 = 평문일 가능성
		    result = password.equals(joinedPassword);
		}
		return result;
	}

	/** 아이디로 회원 조회 */
	@Override
	public Users selectByUsername(String user_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);

		Users user = null;
		try {
			user = usersDAO.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}