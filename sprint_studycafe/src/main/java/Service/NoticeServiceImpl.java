package Service;

import java.util.ArrayList;
import java.util.List;

import DAO.NoticeDAO;
import DTO.Notice;

public class NoticeServiceImpl implements NoticeService {
	private NoticeDAO noticeDAO = new NoticeDAO();

	/** 전체 목록 조회 */
	@Override
	public List<Notice> list() {
		List<Notice> list = null;
		try {
			list = noticeDAO.list();
		} catch (Exception e) {
			e.printStackTrace();
			list = new ArrayList<Notice>();
		}

		return list;
	}

	/** 조회 */
	@Override
	public Notice select(int no) {
		Notice notice = null;

		try {
			notice = noticeDAO.select(no);
		} catch (Exception e) {
			e.printStackTrace();
			notice = new Notice();
		}

		return notice;
	}

	/** 등록 */
	@Override
	public int insert(Notice notice) {
		int result = 0;
		try {
			result = noticeDAO.insert(notice);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/** 수정 */
	@Override
	public boolean update(Notice notice) {
		int result = 0;
		try {
			result = noticeDAO.update(notice);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			return true;
		}
		return false;
	}

	/** 삭제 */
	@Override
	public boolean delete(Notice notice) {
		int result = 0;

		try {
			result = noticeDAO.delete(notice.getNo());
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			return true;
		}
		return false;
	}

}
