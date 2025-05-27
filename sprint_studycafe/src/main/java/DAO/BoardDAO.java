package DAO;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import DTO.Board;

public class BoardDAO extends BaseDAOImpl<Board>{
	public int update(Board entity, boolean answerKbn) throws Exception {
		int result = 0;

		StringBuilder sql = new StringBuilder("UPDATE BOARD SET ");
		sql.append(" ANSWERED_KBN = " + answerKbn);
		sql.append(" , UPDATED_AT = CURRENT_TIMESTAMP");
		sql.append(" WHERE NO = " + entity.getNo());
		
		try {
			psmt = con.prepareStatement(sql.toString());
			log(sql.toString());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.err.println(table() + " - update(entity, boolean) 도중 에러");
			e.printStackTrace();
		}

		return result;
	}
}
