package DTO;

import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("Seats")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Seats {
	@Pk
	/** 좌석 아이디 */
	private String seatId;
	/** 좌석명 */
	private String seatName;
	/** 이용 여부 */
	private Boolean using;

	public static List<Seats> getTestList() {
		List<Seats> resultList = new ArrayList<Seats>();

		boolean is = false ;
		for (int i = 0; i < 12; i++) {
			Seats result = new Seats("seatid" + i, "seatName" + i, is);
			resultList.add(result);
			is = !is;
		}
		return resultList;
	}
}
