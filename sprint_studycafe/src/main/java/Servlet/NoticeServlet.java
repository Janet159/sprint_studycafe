package Servlet;

import java.io.IOException;
import java.util.List;

import Config.Common;
import DTO.Notice;
import DTO.Type;
import DTO.Users;
import Service.CommonService;
import Service.CommonServiceImpl;
import Service.NoticeService;
import Service.NoticeServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/notice/*")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String urlJsp = "/page/notice/";
	private final String url = "/notice/";

	private NoticeService service = new NoticeServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String root = request.getContextPath();
		String path = request.getPathInfo();
		String page = url + "list.jsp";

		String userId = "";
		Object attribute = request.getSession().getAttribute("loginUser");
		if (null != attribute) {
			userId = ((Users) attribute).getUser_id();
		}

		System.out.println("NoticeServlet : GET : " + path);

		try {
			if (path == null || path.isEmpty() || path.equals("/") || path.equals("/list")
					|| path.equals("/list.jsp")) {
				// 문의 사항 목록 화면

				// DB에서 데이터 전체 조회
				List<Notice> resultList = service.list();

				// 화면에 표시를 위해 request 에 담기
				request.setAttribute("resultList", resultList);

				// 이동 할 페이지
				page = urlJsp + "list.jsp";

			} else if (path.equals("/insert") || path.equals("/insert.jsp")) {
				// 게시글 등록 화면

				// 로그인 정보가 없으면 등록 할 수 없음
				if (!userId.isEmpty()) {				// 이동 할 페이지
					page = urlJsp + "insert.jsp";
				}

			} else if (path.equals("/read") || path.equals("/read.jsp")) {
				// 문의 사항 조회 화면

				// 조회 할 데이터 PK(KEY)
				int no = Integer.parseInt(request.getParameter("no"));

				// DB에서 데이터 조회
				Notice result = service.select(no);

				// 화면에 표시를 위해 request 에 담기
				request.setAttribute("result", result);

				// 이동 할 페이지
				page = urlJsp + "read.jsp";

			} else if (path.equals("/update") || path.equals("/update.jsp")) {
				// 게시글 수정 화면

				// 로그인 정보가 없으면 수정 할 수 없음
				if (!userId.isEmpty()) {
					// 조회 할 데이터 PK(KEY)
					int no = Integer.parseInt(request.getParameter("no"));

					// DB에서 데이터 조회
					Notice result = service.select(no);

					// 화면에 표시를 위해 request 에 담기
					request.setAttribute("result", result);
					request.setAttribute("no", no);

					// 이동 할 페이지
					page = urlJsp + "update.jsp";
				}

			} else if (path.equals("/delete") || path.equals("/delete.jsp")) {
				// 문의 사항 삭제 처리

				// 삭제 할 데이터 화면에서 가져오기
				int no = Integer.parseInt(request.getParameter("no"));

				// 삭제 할 데이터 만들기
				Notice dto = Notice.builder().no(no).build();

				// DB에 삭제 처리 보내기
				boolean result = service.delete(dto);

				// 삭제 결과
				if (result) {
					System.out.println("삭제 성공");
					// 삭제 성공 시 이동할 페이지
					response.sendRedirect(root + url + "list");
					return;
				} else {
					System.out.println("삭제 실패");
					// 삭제 실패 시 이동할 페이지
					response.sendRedirect(root + url + "list.jsp?error=true");
					return;
				}
			}
		} catch (NumberFormatException e) {
			// 공지사항 번호 없을 때 리스트 화면으로 이동
			response.sendRedirect(root + url + "list?error=true");
			return;
		}
		// 화면 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String root = request.getContextPath();
		String path = request.getPathInfo();

		String userId = "";
		Object user = request.getSession().getAttribute("loginUser");
		if (null != user) {
			userId = ((Users) user).getUser_id();
		} else {
			// 유저 정보가 없으면 공지사항 등록, 수정 불가
			String page = url + "list.jsp?error=no";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
			return ;
		}

		System.out.println("NoticeServlet : POST : " + path);

		if (path.equals("/insert") || path.equals("/insert.jsp")) {
			// 공지 사항 등록 처리

			// 등록 할 데이터 화면에서 가져오기
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			// 등록 구분 임의 지정
			CommonService comserService = new CommonServiceImpl();
			List<Type> typeList = comserService.getTypeList(Common.NOTICE);
			Type type;
			if (null != typeList && typeList.size() >= 1) {
				type = typeList.get(0);
			} else {
				type = new Type();
			}

			// 등록 할 데이터 만들기
			Notice dto = Notice.builder().typeNo(type.getNo()).adminId(userId).title(title).content(content).build();

			// DB에 등록하기
			int result = service.insert(dto);

			// 등록 결과
			if (result != 0) {
				System.out.println("등록 성공");
				// 등록 성공시 이동할 페이지
				response.sendRedirect(root + url + "list");
			} else {
				System.out.println("등록 실패");
				// 등록 실패시 이동할 페이지
				response.sendRedirect(root + url + "list?error=error");
			}

		} else if (path.equals("/update") || path.equals("/update.jsp")) {
			// 공지 사항 수정 처리

			// 수정 할 데이터 화면에서 가져오기
			int no = Integer.parseInt(request.getParameter("no"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			// 수정 할 데이터 만들기
			Notice dto = Notice.builder().typeNo(1).no(no).adminId(userId).title(title).content(content).build();

			// DB에 업데이트 보내기
			boolean result = service.update(dto);

			// 업데이트 처리 결과
			if (result) {
				System.out.println("수정 성공");
				// 수정 성공시 이동할 페이지
				response.sendRedirect(root + url + "list");
				return;
			} else {
				System.out.println("수정 실패");
				// 수정 실패시 이동할 페이지
				response.sendRedirect(root + url + "list?error=true");
			}
		}
	}
}
