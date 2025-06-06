package Servlet;

import java.io.IOException;
import java.util.List;

import DTO.Reservation;
import DTO.Users;
import Service.ReservationService;
import Service.ReservationServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mypage/*")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String urlJsp = "/page/mypage/";

	private ReservationService reService = new ReservationServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getPathInfo();
		String page = "/";
		
		String userId = "";
		Object user = request.getSession().getAttribute("loginUser");
		if (null != user) {
			userId = ((Users) user).getUser_id();
		}

		System.out.println("MyPageServlet : GET : " + path);

		if (path == null || path.isEmpty() || path.equals("/")) {
			// 나의 정보
			page = "/page/users/userread.jsp";

		} else if (path.equals("/seatList") || path.equals("/seatList.jsp")) {
			// 좌석 현황

			// DB에서 데이터 조회
			List<Reservation> resultList = reService.seatList();

			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("resultList", resultList);

			// 이동 할 페이지
			page = urlJsp + "seatList.jsp";

		} else if (path.equals("/orderList") || path.equals("/orderList.jsp")) {
			// 나의 구매 내역

			// 로그인 정보 없으면 구매 내역 조회 불가
			if (!userId.isEmpty()) {

				// DB에서 데이터 조회
				List<Reservation> resultList = reService.orderList(userId);

				// 화면에 표시를 위해 request 에 담기
				request.setAttribute("resultList", resultList);

				// 이동 할 페이지
				page = urlJsp + "orderList.jsp";
			}

		} else if (path.equals("/seatRead") || path.equals("/seatRead.jsp")) {
			// 현재 주문 내역 조회

			// 로그인 정보 없으면 현재 구매 내역 조회 불가
			if (!userId.isEmpty()) {
				// DB에서 데이터 조회
				Reservation result = reService.select(userId);

				// 화면에 표시를 위해 request 에 담기
				request.setAttribute("result", result);
				// 이동 할 페이지 
				page = urlJsp + "seatRead.jsp";
			}

		}

		// 화면 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}
}