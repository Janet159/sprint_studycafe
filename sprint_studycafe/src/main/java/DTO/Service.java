package DTO;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("Service")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Service {
	@Pk
	/** 편의시설 번호 */
	private int no;
	/** 구분 */
	private int typeNo;
	/** 종류 */
	private String serviceId;
	/** 위치 */
	private String location;
	
	/** 타입 이름 */
	@Column(exist = false)
	private String typeName ;

}
