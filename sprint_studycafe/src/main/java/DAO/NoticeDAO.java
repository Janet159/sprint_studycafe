package DAO;

import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import DTO.Notice;

public class NoticeDAO extends BaseDAOImpl<Notice>{

	@Override
	public List<Notice> list() throws Exception {
		StringBuilder sql = new StringBuilder("SELECT ");
		sql.append(" ROW_NUMBER() OVER (ORDER BY CREATED_AT ) AS V_NUM, NO ");
		sql.append(" , ADMIN_ID, TYPE_NO, TITLE, CONTENT, CREATED_AT, UPDATED_AT");
		sql.append(" FROM NOTICE");
		sql.append(" ORDER BY CREATED_AT DESC");

		List<Notice> list = new ArrayList<Notice>();
		try {
			stmt = con.createStatement();
			log(sql);
			rs = stmt.executeQuery(sql.toString());
			while (rs.next()) {
				Notice entity = new Notice();
				entity.setNo(rs.getInt("NO"));
				entity.setVNum(rs.getInt("V_NUM"));
				entity.setAdminId(rs.getString("ADMIN_ID"));
				entity.setTypeNo(rs.getInt("TYPE_NO"));
				entity.setTitle(rs.getString("TITLE"));
				entity.setContent(rs.getString("CONTENT"));
				entity.setCreatedAt(rs.getTimestamp("CREATED_AT"));
				entity.setUpdatedAt(rs.getTimestamp("UPDATED_AT"));
				list.add(entity);
			}
		} catch (Exception e) {
			System.err.println("Notice - list() 조회 중 에러");
			e.printStackTrace();
		}
		return list;
	}
}
