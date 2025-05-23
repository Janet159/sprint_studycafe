package Service;

import java.util.List;

import DAO.BoardDAO;
import DAO.ServiceDAO;
import DTO.Board;
import DTO.Service;

public class ServiceServiceImpl implements ServiceService {
	private ServiceDAO serviceDAO = new ServiceDAO();

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