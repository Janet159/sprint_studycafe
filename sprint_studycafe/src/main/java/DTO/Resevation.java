package DTO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("Resevation")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Resevation {
	@Pk
	/** 내역 */
	private int no;
	/** 사용자 아이디 */
	private String userId;
	/** 좌석 아이디 */
	private String seatId;
	/** 티켓 아이디 */
	private String ticketId;
	/** 구매 시간 */
	private Date orderTime;
	/** 시작 시간 */
	private Date startTime;
	/** 종료 시간 */
	private Date endTime;

	public static List<Resevation> getTestList() {
		List<Resevation> resultList = new ArrayList<Resevation>();

		for (int i = 0; i < 6; i++) {
			Resevation result = new Resevation(i, "userid" + i, "seatid" + i, "ticketid" + i, new Date(), new Date(),
					new Date());
			resultList.add(result);
		}
		return resultList;
	}
}
