package DTO;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import Config.Common;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("Reservation")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Reservation {
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

	/** 티켓 이름 */
	@Column(exist = false)
	private String ticketName;

	/** 티켓 이름 */
	@Column(exist = false)
	private int ticketPrice;

	/** 유저 이름 */
	@Column(exist = false)
	private String userName;

	/** 좌석 이름 */
	@Column(exist = false)
	private String seatName;

	public String getSeatName() {
		if (null == this.seatName) return "";
		return this.seatName;
	}
	
	public String getOrderTimeStr() {
		if (null == this.orderTime) return "";
		return Common.getDateToString(this.orderTime);
	}
	
	public String getStartTimeStr() {
		if (null == this.startTime) return "";
		return Common.getDateToString(this.startTime);
	}
	
	public String getEndTimeStr() {
		if (null == this.endTime) return "";
		return Common.getDateToString(this.endTime);
	}
}
