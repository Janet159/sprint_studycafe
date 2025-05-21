package Config;

import java.time.LocalDateTime;
public class Common {
	public static final String UTF_8 = "UTF-8";
	public static final String TEXT_PLAIN = "text/plain; charset=UTF-8";
	public static final String TEXT_HTML = "text/html; charset=UTF-8";
	public static final String JSON = "application/json; charset=UTF-8";
	public static final String OCTET_STREAM = "application/octet-stream; charset=UTF-8";
	
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

	public static String getUrl(String... urls) {
		return "/" + String.join("/", urls);
	}
	
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
}
