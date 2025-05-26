package DAO;

import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import Config.Common;
import DTO.Reservation;

public class ReservationDAO extends BaseDAOImpl<Reservation> {

	@Override
	public List<Reservation> list() throws Exception {
		StringBuilder sql = new StringBuilder("SELECT ");
		sql.append(
				" RE.NO, RE.USER_ID, SEATS.SEAT_ID, RE.TICKET_ID, RE.ORDER_TIME, RE.START_TIME, RE.END_TIME, RE.NAME, RE.TICKET_NAME, SEATS.SEAT_NAME");
		sql.append(" FROM SEATS");
		sql.append(" LEFT JOIN ");
		sql.append(" ( ");
		sql.append(
				"  SELECT RE.NO, RE.USER_ID, RE.SEAT_ID, RE.TICKET_ID, RE.ORDER_TIME, RE.START_TIME, RE.END_TIME, USERS.NAME, TICKET.TICKET_NAME");
		sql.append("  FROM RESERVATION AS RE");
		sql.append("  LEFT JOIN USERS ON USERS.USER_ID = RE.USER_ID");
		sql.append("  LEFT JOIN TICKET ON TICKET.TICKET_ID = RE.TICKET_ID");
		sql.append("  WHERE RE.END_TIME > NOW()");
		sql.append(" ) AS RE");
		sql.append(" ON SEATS.SEAT_ID = RE.SEAT_ID");
		sql.append(" WHERE SEATS.USING_KBN = " + Common.TRUE);
		sql.append(" ORDER BY CAST(SEATS.SEAT_ID AS UNSIGNED)");

		List<Reservation> list = new ArrayList<Reservation>();
		try {
			stmt = con.createStatement();
			log(sql);
			rs = stmt.executeQuery(sql.toString());
			while (rs.next()) {
				Reservation entity = new Reservation();
				entity.setNo(rs.getInt("NO"));
				entity.setUserId(rs.getString("USER_ID"));
				entity.setUserName(rs.getString("NAME"));
				entity.setSeatId(rs.getString("SEAT_ID"));
				entity.setSeatName(rs.getString("SEAT_NAME"));
				entity.setTicketId(rs.getString("TICKET_ID"));
				entity.setTicketName(rs.getString("TICKET_NAME"));
				entity.setOrderTime(rs.getTimestamp("ORDER_TIME"));
				entity.setStartTime(rs.getTimestamp("START_TIME"));
				entity.setEndTime(rs.getTimestamp("END_TIME"));
				list.add(entity);
			}
		} catch (Exception e) {
			System.err.println("Reservation - list() 조회 중 에러");
			e.printStackTrace();
		}
		return list;
	}

	public List<Reservation> list(String userId) throws Exception {
		StringBuilder sql = new StringBuilder("SELECT ");
		sql.append(
				"RE.NO, RE.USER_ID, RE.SEAT_ID, SE.SEAT_NAME, RE.TICKET_ID, TI.TICKET_NAME, RE.ORDER_TIME, RE.START_TIME, RE.END_TIME");
		sql.append(" FROM RESERVATION AS RE ");
		sql.append(" LEFT JOIN  TICKET AS TI ON TI.TICKET_ID = RE.TICKET_ID ");
		sql.append(" LEFT JOIN SEATS AS SE ON RE.SEAT_ID = SE.SEAT_ID ");
		sql.append(" WHERE USER_ID = '" + userId + "'");
		sql.append(" ORDER BY ORDER_TIME DESC ");

		List<Reservation> list = new ArrayList<Reservation>();
		try {
			stmt = con.createStatement();
			log(sql);
			rs = stmt.executeQuery(sql.toString());
			while (rs.next()) {
				Reservation entity = new Reservation();
				entity.setNo(rs.getInt("NO"));
				entity.setUserId(rs.getString("USER_ID"));
				entity.setSeatId(rs.getString("SEAT_ID"));
				entity.setSeatName(rs.getString("SEAT_NAME"));
				entity.setTicketId(rs.getString("TICKET_ID"));
				entity.setTicketName(rs.getString("TICKET_NAME"));
				entity.setOrderTime(rs.getTimestamp("ORDER_TIME"));
				entity.setStartTime(rs.getTimestamp("START_TIME"));
				entity.setEndTime(rs.getTimestamp("END_TIME"));
				list.add(entity);
			}
		} catch (Exception e) {
			System.err.println("Reservation - list() 조회 중 에러");
			e.printStackTrace();
		}
		return list;
	}

}
