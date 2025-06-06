package Servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Map;

import DTO.Reservation;
import DTO.Seats;
import DTO.Ticket;
import DTO.Users;
import Service.CommonService;
import Service.CommonServiceImpl;
import Service.ReservationService;
import Service.ReservationServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reservation/*")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String urlJsp = "/page/reservation/";
	private final String url = "/reservation/";

	private ReservationService service = new ReservationServiceImpl();
	private CommonService common = new CommonServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getPathInfo();
		String page = url + "list.jsp";
		String userId = "";
		Object attribute = request.getSession().getAttribute("loginUser");
		if (null != attribute) {
			userId = ((Users) attribute).getUser_id();
		}

		System.out.println("ReservationServlet : GET : " + path);

		if (path == null || path.isEmpty() || path.equals("/") || path.equals("/list") || path.equals("/list.jsp")) {
			// 목록 화면

			// DB에서 데이터 전체 조회
			List<Reservation> resultList = service.reservationList();

			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("resultList", resultList);

			// 이동 할 페이지 
			page = urlJsp + "list.jsp";

		} else if (path.equals("/order") || path.equals("/order.jsp")) {

			// 로그인 정보가 없으면 주문 할 수 없음
			if (!userId.isEmpty()) {
				System.out.println(userId);
				// 주문 화면

				// 선택한 좌석
				String seatId = request.getParameter("seatId");

				// DB에서 데이터 조회
				List<Ticket> resultList = common.getTicketList();

				// 화면에 표시를 위해 request 에 담기
				request.setAttribute("resultList", resultList);
				request.setAttribute("seatId", seatId);

				// 이동 할 페이지 
				page = urlJsp + "order.jsp";
			}

		} else if (path.equals("/select") || path.equals("/select.jsp")) {
			// 주문 결과 화면
			// 로그인 정보가 없으면 조회 할 수 없음
			if (!userId.isEmpty()) {

				try {
					// 조회 할 데이터 PK(KEY)
					int no = Integer.parseInt(request.getParameter("no"));

					// DB에서 데이터 조회
					Reservation dto = service.select(no);
					Map<String, Seats> seatMap = common.getSeatMap();
					Map<String, Ticket> ticketMap = common.getTicketMap();
					dto.setSeatName(seatMap.get(dto.getSeatId()).getSeatName());
					dto.setTicketName(ticketMap.get(dto.getTicketId()).getTicketName());

					// 화면에 표시를 위해 request 에 담기
					request.setAttribute("dto", dto);

					// 이동 할 페이지 
					page = urlJsp + "select.jsp";

				} catch (NumberFormatException e) {
					// 주문 번호가 없으면 에러
					page = urlJsp + "list.jsp?error=no";
				}
			}

		}

		System.out.println(page);
		// 화면 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String root = request.getContextPath();
		String path = request.getPathInfo();

		String userId = "";
		Object attribute = request.getSession().getAttribute("loginUser");
		if (null != attribute) {
			userId = ((Users) attribute).getUser_id();
		} else {

			// 유저 정보가 없으면 주문 할 수 없음
			String page = url + "list.jsp?error=no";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}

		System.out.println("ReservationServlet : POST : " + path);

		if (path.equals("/order") || path.equals("/order.jsp")) {
			// 등록 처리 

			// 등록 할 데이터 화면에서 가져오기
			String seatId = request.getParameter("seatId");		// 선택한 좌석

			String ticketId = request.getParameter("ticketId");	// 선택한 이용권
			Map<String, Ticket> ticketMap = common.getTicketMap();
			int ticketTime = ticketMap.get(ticketId).getTicketTime();

			LocalDateTime now = LocalDateTime.now();
			LocalDateTime startDate = getStartTime(now);
			LocalDateTime endDate = startDate.plusHours(ticketTime);

			ZoneId zone = ZoneId.systemDefault();
			Date orderTime = Date.from(now.atZone(zone).toInstant());
			Date startTime = Date.from(startDate.atZone(zone).toInstant());
			Date endTime = Date.from(endDate.atZone(zone).toInstant());

			// 등록 할 데이터 만들기
			Reservation dto = Reservation.builder().no(0).userId(userId).seatId(seatId).ticketId(ticketId)
					.orderTime(orderTime).startTime(startTime).endTime(endTime).build();

			System.out.println("orderTime : " + dto.getOrderTime());
			System.out.println("startTime : " + dto.getStartTime());
			System.out.println("endTime : " + dto.getEndTime());

			// DB에 등록하기
			Reservation resultDto = service.insert(dto);

			// 등록 결과
			if (resultDto.getNo() != 0) {
				System.out.println("등록 성공");
				// 등록 성공시 이동할 페이지
				response.sendRedirect(root + url + "select?no=" + resultDto.getNo());
			} else {
				System.out.println("등록 실패");
				// 등록 실패시 이동할 페이지
				response.sendRedirect(root + url + "list?error=error");
			}
		}
	}

	/**
	 * 이용 시작 시간 설정
	 * 결제 시간에 10분 여유를 두고 5분 단위로 시작 시간 설정
	 * 
	 * @param time
	 * @return
	 */
	private LocalDateTime getStartTime(LocalDateTime time) {
		// 10분 더하기
		time = time.plusMinutes(10);

		int minute = time.getMinute();
		int roundedMinute = Math.round(minute / 5.0f) * 10;

		System.out.println(roundedMinute);
		// 시(hour)가 넘어가는 경우 처리
		if (roundedMinute >= 60) {
			time = time.plusHours(1).withMinute(0);
		} else {
			time = time.withMinute(roundedMinute);
		}

		return time.withSecond(0).withNano(0);
	}
}
