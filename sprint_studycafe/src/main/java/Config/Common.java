package Config;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
public class Common {
	public static final String UTF_8 = "UTF-8";
	public static final String TEXT_PLAIN = "text/plain; charset=UTF-8";
	public static final String TEXT_HTML = "text/html; charset=UTF-8";
	public static final String JSON = "application/json; charset=UTF-8";
	public static final String OCTET_STREAM = "application/octet-stream; charset=UTF-8";
	public static final String PROJECT = "sprint_studycafe" ;
	
	public static final String TITLE = "Sprint Study Cafe☕" ;

	public static final String JOIN = "join";
	public static final String LOGIN = "login";
	public static final String MYPAGE = "mypage";
	public static final String NOTICE = "notice";
	public static final String BOARD = "board";
	public static final String RESERVATION = "reservation";
	public static final String SERVICE = "service";

	public static final String LIST = "list";
	public static final String READ = "read";
	public static final String INSERT = "insert";
	public static final String UPDATE = "update";
	public static final String DELETE = "delete";
	public static final String ORDER = "order";
	
	public static final int TRUE = 1;
	public static final int FALSE = 0;

	public static String getUrl(String... urls) {
		return "/" + PROJECT + "/" + String.join("/", urls);
	}
	
	/**
	 * 현재 시간으로 부터 지정 시간 이후 시간을 HH:mm 형식의 문자열로 리턴
	 * @param int : 현재 시간으로 부터 몇 시간 후
	 * @return String : 현재 시간으로 부터 지정 시간 이후 시간
	 */
	public static String afterHour(int time) {

	    LocalDateTime now = LocalDateTime.now();
	    LocalDateTime afterOneHour = now.plusHours(time);

	    int hour = afterOneHour.getHour();

	    // "오늘 기준"으로 24시 이상 표현하기
	    int virtualHour = hour;
	    if (afterOneHour.getDayOfYear() > now.getDayOfYear()) {
	        virtualHour = hour + 24;
	    }

	    return String.format("%02d:%02d", virtualHour, afterOneHour.getMinute());
	}
	
	/**
	 * 지정 시간 Date 타입의 데이터를 yyyy/MM/dd HH:mm 형식의 문자열로 리턴
	 * @param date
	 * @return
	 */
	public static String getDateToString(Date date) {

		if (null == date) return "";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		return formatter.format(date);     
	}
	
	/**
	 * 지정 시간 Date 타입의 데이터를 HH:mm 형식의 문자열로 리턴
	 * @param date
	 * @return
	 */
	public static String getHourMinuteFromDate(Date date) {
		if (null == date) return "";
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
		return formatter.format(date);     
	}
	
	/** 남은 시간 계산 */
	public static String getRemainingTime(Date date) {
		if (date == null) return "";

	    // 현재 시간
	    Date now = new Date();

	    // 차이 (밀리초)
	    long diffInMillis = Math.abs(now.getTime() - date.getTime());

	    // 시간과 분 계산
	    long diffInMinutes = diffInMillis / (1000 * 60);
	    long hours = diffInMinutes / 60;
	    long minutes = diffInMinutes % 60;

	    return String.format("%02d시간 %02d분", hours, minutes);
	}

	/**
	 * 지정된 두 개의 시간의 차이를 HH:mm 형식의 문자열로 리턴
	 * @param start 시작 시간
	 * @param end 끝 시간
	 * @return
	 */
	public static String getTimeDifference(Date start, Date end) {
		if (null == start || null == end) return "";
        long diffMillis = end.getTime() - start.getTime();

        long diffMinutes = (diffMillis / (1000 * 60)) % 60;
        long diffHours = diffMillis / (1000 * 60 * 60);

        return diffHours + ":" + diffMinutes;
    }
	
	/**
	 * 지정된 순자를 #,### 형식의 문자열로 리턴
	 * @param number
	 * @return 문자열
	 */
	public static String getIntegerToString(int number) {
	    DecimalFormat formatter = new DecimalFormat("#,###");
	    String formatted = formatter.format(number);
	    return formatted; // 출력: 1,000
		
	}
}
