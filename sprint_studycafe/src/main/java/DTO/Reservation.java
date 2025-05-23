package DTO;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

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
//	private LocalDateTime orderTime;
	private Date orderTime;
	/** 시작 시간 */
//	private LocalDateTime startTime;
	private Date startTime;
	/** 종료 시간 */
//	private LocalDateTime endTime;
	private Date endTime;

	@Column(exist = false)
	private String ticketName;

	@Column(exist = false)
	private String userName;

	@Column(exist = false)
	private String seatName;
	
	
	@Column(exist = false)
	private Users user;  

	public static List<Reservation> getTestList() {
		List<Reservation> resultList = new ArrayList<Reservation>();
		try {

			LocalDateTime beforeOneHour = LocalDateTime.now().minusHours(3);
			LocalDateTime afterOneHour = LocalDateTime.now().plusHours(2);
			Date from = Date.from(beforeOneHour.atZone(ZoneId.systemDefault()).toInstant());
			Date to = Date.from(afterOneHour.atZone(ZoneId.systemDefault()).toInstant());

			String userid  ;
			for (int i = 0; i < 16; i++) {
				userid = (i % 3 == 0) ? "userid" + i : "" ;
				
				Reservation result = new Reservation();
				result.setNo(i);       
				result.setUserId(userid);         
				result.setSeatId("seatid" + i );          
				result.setTicketId("ticketid" + i);        
				result.setOrderTime(from);       
				result.setStartTime(from);       
				result.setEndTime(to);         
				result.setTicketName("ticketName" + i);     
				result.setUserName("userName" + i);        
				result.setSeatName("seatName" + i);       
				
				resultList.add(result);
			}
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}
		return resultList;
	}
}
