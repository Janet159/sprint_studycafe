package board.DTO;

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
	private String ticketId ;
	/** 가격 */
	private int price;
	/** 이용권 시간 */
	private int ticketTime;
}
