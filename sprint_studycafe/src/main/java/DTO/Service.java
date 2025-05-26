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
	
	@Column(exist = false)
	private String typeName ;

//	public static List<Service> getTestList() {
//		List<Service> resultList = new ArrayList<Service>();
//
//		for (int i = 0; i < 6; i++) {
//			Service result = new Service(i, i, "serviceId" + i, "location" + i);
//			resultList.add(result);
//		}
//		return resultList;
//	}
}
