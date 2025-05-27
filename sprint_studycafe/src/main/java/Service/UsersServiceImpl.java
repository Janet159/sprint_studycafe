package Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

//	/** 로그인 정보에 따른 조회 */
//	@Override
//	public Users login(String userId, String password) {
//		try {
//			Map<String, Object> map = new HashMap<>();
//			;
//			map.put("user_id", userId);
//			map.put("password", password);
//
//			return usersDAO.selectBy(map); // alcl-jdbc 방식
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}

	/** 등록 */
	@Override
	public Users insert(Users users) {
		int result = 0;
		try {
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
		boolean result = password.equals(joinedPassword);
		//		boolean result = BCrypt.checkpw(password, joinedPassword);
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