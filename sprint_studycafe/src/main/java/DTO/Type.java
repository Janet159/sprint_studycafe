package DTO;

import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("Type")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Type {
	@Pk
	/** 
	 * 구분자
	 * 1:1 문의사항 : BOARD
	 * 공지사항 : NOTICE
	 * 편의시설 : SERVICE
	 */
	private String type;

	@Pk
	/** 구분 */
	private int typeNo;
	/** 구분명 */
	private String typeName;
	
	
	public static List<Type> getTestList() {
		List<Type> resultList = new ArrayList<Type>();

		for (int i = 0; i < 3; i++) {
			Type result = new Type("type", i, "typeName" + i);
			resultList.add(result);
		}
		return resultList;
	}
}
