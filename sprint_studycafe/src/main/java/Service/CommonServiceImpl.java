package Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DAO.SeatsDAO;
import DAO.TicketDAO;
import DAO.TypeDAO;
import DTO.Seats;
import DTO.Ticket;
import DTO.Type;

public class CommonServiceImpl implements CommonService {
	private TypeDAO typeDao = new TypeDAO();
	private TicketDAO ticketDao = new TicketDAO();
	private SeatsDAO seatsdao = new SeatsDAO();

	/** 타입 목록 조회 */
	@Override
	public List<Type> getTypeList(String type) {
		List<Type> list = new ArrayList<Type>();
		
		try {
			Map<String,Object> param = new HashMap<String, Object>();
			param.put("type_kbn", type);
			
			list = typeDao.listBy(param);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/** 이용권 목록 조회 */
	@Override
	public List<Ticket> getTicketList() {
		List<Ticket> list = new ArrayList<Ticket>() ;
		
		try {
			list = ticketDao.list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/** 좌석 관리 목록 조회 */
	@Override
	public List<Seats> getSeatList() {
		List<Seats> list = new ArrayList<Seats>() ;
		
		try {
			Map<String,Object> param = new HashMap<String, Object>();
			param.put("using_type", true);
			list = seatsdao.listBy(param);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
