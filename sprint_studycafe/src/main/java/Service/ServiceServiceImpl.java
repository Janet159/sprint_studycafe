package Service;

import java.util.List;

import DAO.ServiceDAO;
import DTO.Service;

public class ServiceServiceImpl implements ServiceService {
	private ServiceDAO serviceDAO = new ServiceDAO();

	/** 전체 목록 조회 */
	@Override
	public List<Service> list() {
		List<Service> list = null;
		try {
			list = serviceDAO.list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/** 등록 */
	@Override
	public Service insert(Service service) {
		int result = 0;
		try {
			result = serviceDAO.insert(service);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			return service;
		}
		return null;
	}

	/** 조회 */
	@Override
	public Service select(int no) {
		Service service = null;

		try {
			service = serviceDAO.select(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return service;
	}

	/** 수정 */
	@Override
	public boolean update(Service service) {
		int result = 0;
		try {
			result = serviceDAO.update(service);
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
	public boolean delete(Service service) {
		int result = 0;

		try {
			result = serviceDAO.delete(service.getNo());
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			return true;
		}
		return false;
	}

}