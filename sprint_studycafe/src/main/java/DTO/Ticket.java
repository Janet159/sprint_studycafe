package DTO;

import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("Ticket")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Ticket {
	@Pk
	/** 티켓 아이디 */
	private String ticketId;
	/** 티켓 명 */
	private String ticketName;
	/** 가격 */
	private int price;
	/** 이용권 시간 */
	private int ticketTime;

	public static List<Ticket> getTestList() {
		List<Ticket> resultList = new ArrayList<Ticket>();

		for (int i = 0; i < 6; i++) {
			Ticket result = new Ticket("ticketId" + i, "ticketName" + i,2000*(i+1), i);
			resultList.add(result);
		}
		return resultList;
	}
}
