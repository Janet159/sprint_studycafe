package DTO;

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
	private Boolean usingKbn;

}
