package Servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import Config.Common;
import DTO.Board;
import DTO.Reservation;
import DTO.Ticket;
import DTO.Type;
import DTO.Users;
import Service.BoardService;
import Service.BoardServiceImpl;
import Service.CommonService;
import Service.CommonServiceImpl;
import Service.ReservationService;
import Service.ReservationServiceImpl;
import Service.UsersService;
import Service.UsersServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardServlet
 */
@WebServlet("/mypage/*")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReservationService reService = new ReservationServiceImpl();
	private CommonService comService = new CommonServiceImpl();
	private UsersService userService = new UsersServiceImpl();

	private final String urlJsp = "/page/mypage/";
	private final String url = "/mypage/";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getPathInfo();
		String page = "/page/users/userread.jsp";

		System.out.println("MyPageServlet : GET : " + path);

		if (path == null || path.isEmpty() || path.equals("/")) {
			// 나의 정보

		} else if (path.equals("/orderList") || path.equals("/orderList.jsp")) {
			// 나의 구매 내역

			//			String userId = ((Users) request.getSession().getAttribute("loginUser")).getUser_id();
			String userId = "test";

			// DB에서 데이터 조회
			List<Reservation> resultList = reService.list(userId);
			Map<String, Ticket> ticketMap = comService.getTicketMap();

			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("resultList", resultList);
			request.setAttribute("ticketMap", ticketMap);

			// 이동 할 페이지
			page = urlJsp + "orderList.jsp";

		} else if (path.equals("/seatList") || path.equals("/seatList.jsp")) {

		} else if (path.equals("/seatRead") || path.equals("/seatRead.jsp")) {
			// 좌석 정보 화면

			// 조회 할 데이터 PK(KEY)
			String userId = "test";
			Object attribute = request.getSession().getAttribute("loginUser");
			if (null != attribute) {
				userId = ((Users) attribute).getUser_id();
			}
			System.out.println(userId);

			// DB에서 데이터 조회
			Reservation result = reService.select(userId);

			System.out.println(result);

			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("result", result);

			// 이동 할 페이지 
			page = urlJsp + "seatRead.jsp";

		}

		// 화면 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}
}