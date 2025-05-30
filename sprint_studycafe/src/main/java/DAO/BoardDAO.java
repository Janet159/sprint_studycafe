package DAO;

import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import DTO.Board;

public class BoardDAO extends BaseDAOImpl<Board> {
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

	@Override
	public List<Board> list() throws Exception {
		StringBuilder sql = new StringBuilder("SELECT ");
		sql.append(" ROW_NUMBER() OVER (ORDER BY CREATED_AT ) AS V_NUM, NO, ");
		sql.append(" USER_ID, TYPE_NO, TITLE, CONTENT, PRIVATE_KBN, PHONENUMBER, CREATED_AT, UPDATED_AT, ANSWERED_KBN");
		sql.append(" FROM BOARD");
		sql.append(" ORDER BY CREATED_AT DESC");

		List<Board> list = new ArrayList<Board>();
		try {
			stmt = con.createStatement();
			log(sql);
			rs = stmt.executeQuery(sql.toString());
			while (rs.next()) {
				Board entity = new Board();
				entity.setNo(rs.getInt("NO"));
				entity.setVNum(rs.getInt("V_NUM"));
				entity.setUserId(rs.getString("USER_ID"));
				entity.setTypeNo(rs.getInt("TYPE_NO"));
				entity.setTitle(rs.getString("TITLE"));
				entity.setContent(rs.getString("CONTENT"));
				entity.setPrivateKbn(rs.getBoolean("PRIVATE_KBN"));
				entity.setPhonenumber(rs.getString("PHONENUMBER"));
				entity.setCreatedAt(rs.getTimestamp("CREATED_AT"));
				entity.setUpdatedAt(rs.getTimestamp("UPDATED_AT"));
				entity.setAnsweredKbn(rs.getBoolean("ANSWERED_KBN"));
				list.add(entity);
			}
		} catch (Exception e) {
			System.err.println("Board - list() 조회 중 에러");
			e.printStackTrace();
		}
		return list;
	}
}
