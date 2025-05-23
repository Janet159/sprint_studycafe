package Servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import Config.Common;
import DTO.Board;
import DTO.Reservation;
import DTO.Seats;
import DTO.Ticket;
import DTO.Type;
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

/**
 * Servlet implementation class SeatsServlet
 */
@WebServlet("/reservation/*")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReservationService service = new ReservationServiceImpl();
	private CommonService common = new CommonServiceImpl();
	private String urlJsp = "/page/reservation/" ;
	private String url = "/reservation/" ;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getPathInfo();
		String page = "";

		System.out.println("ReservationServlet : GET : " + path);

		if (path == null || path.isEmpty() || path.equals("/list") || path.equals("/list.jsp")) {
			// 목록 화면

			// DB에서 데이터 전체 조회
			List<Reservation> resultList = service.list();

			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("resultList", resultList);

			// 이동 할 페이지 
			page = urlJsp + "list.jsp";

		} else if (path.equals("/select") || path.equals("/select.jsp")) {
			// 조회 화면

			// 조회 할 데이터 PK(KEY)
			int no = Integer.parseInt(request.getParameter("no"));

			// DB에서 데이터 조회
			Reservation dto = service.select(no);

			// 화면에 표시를 위해 request 에 담기
//			request.setAttribute("board", board);

			// 이동 할 페이지 
			page = urlJsp + "select.jsp";
			
		} else if (path.equals("/order") || path.equals("/order.jsp")) {
			// 조회 화면

			// 선택한 좌석
			String seatId = request.getParameter("seatId");

			// DB에서 데이터 조회
			List<Ticket> resultList = common.getTicketList();

			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("resultList", resultList);
			request.setAttribute("seatId", seatId);

			// 이동 할 페이지 
			page = urlJsp + "order.jsp";
			
		} else if (path.equals("/temp")) {
			CommonService service = new CommonServiceImpl();
			List<Seats> seatList = service.getSeatList();
			List<Ticket> ticketList = service.getTicketList();
			List<Type> typeList = service.getTypeList(Common.SERVICE.toUpperCase());
			
			for (Seats dto : seatList) {
				System.out.print(dto.getSeatId() + "\t");
				System.out.print(dto.getSeatName() + "\t");
				System.out.print(dto.getUsing_kbn() + "\t");
				System.out.println();
				
			}
			System.out.println();
			for (Ticket dto : ticketList) {
				System.out.print(dto.getPrice() + "\t");
				System.out.print(dto.getTicketId() + "\t");
				System.out.print(dto.getTicketName() + "\t");
				System.out.print(dto.getTicketTime() + "\t");
				System.out.println();
			}
			System.out.println();
			for (Type dto : typeList) {
				System.out.print(dto.getNo() + "\t");
				System.out.print(dto.getTypeKbn() + "\t");
				System.out.print(dto.getTypeName() + "\t");
				System.out.println();
			}
			page = urlJsp + "list.jsp";
		}

		// 화면 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String root = request.getContextPath();
		String path = request.getPathInfo();
		String userId = ((Users) request.getSession().getAttribute("loginUser")).getUserId();

		System.out.println("ReservationServlet : POST : " + path);

		if (path.equals("/order") || path.equals("/order.jsp")) {
			// 등록 처리 

			// 등록 할 데이터 화면에서 가져오기
			String seatId = request.getParameter("seatId");		// 선택한 좌석
			String ticketId = request.getParameter("ticketId");	// 선택한 이용권

			// 등록 할 데이터 만들기
			Reservation dto = Reservation.builder().userId(userId).seatId(seatId).ticketId(ticketId)//
					.startTime(null).endTime(null).build();
			
			// DB에 등록하기
			Reservation resultDto = service.insert(dto);

			// 등록 결과
			if (resultDto != null) {
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
}
