package Servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import Config.Common;
import DTO.Answer;
import DTO.Board;
import DTO.Type;
import DTO.Users;
import Service.AnswerService;
import Service.AnswerServiceImpl;
import Service.BoardService;
import Service.BoardServiceImpl;
import Service.CommonService;
import Service.CommonServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/board/*")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String urlJsp = "/page/board/";
	private final String url = "/board/";

	private BoardService service = new BoardServiceImpl();
	private CommonService commonservice = new CommonServiceImpl();
	private AnswerService answerService = new AnswerServiceImpl();

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

		System.out.println("BoardServlet : GET : " + path);

		try {
			if (path == null || path.isEmpty() || path.equals("/") || path.equals("/list")
					|| path.equals("/list.jsp")) {
				// 문의 사항 목록 화면
				List<Board> resultList;

				String param = request.getParameter("type");

				if (null == param || param.isEmpty() || userId.isEmpty()) {
					// DB에서 데이터 전체 조회
					resultList = service.list();
				} else {
					resultList = service.listBy(userId);
				}

				Map<Integer, Type> typeMap = commonservice.getTypeMap(Common.BOARD);
				for (Board board : resultList) {
					board.setTypeName(typeMap.get(board.getTypeNo()).getTypeName());
				}

				// 화면에 표시를 위해 request 에 담기
				request.setAttribute("resultList", resultList);

				// 이동 할 페이지
				page = urlJsp + "list.jsp";

			} else if (path.equals("/insert") || path.equals("/insert.jsp")) {
				// 게시글 등록 화면

				// 로그인 정보가 없으면 등록 할 수 없음
				if (!userId.isEmpty()) {

					List<Type> typelist = commonservice.getTypeList(Common.BOARD);
					request.setAttribute("typelist", typelist);

					// 이동 할 페이지 
					page = urlJsp + "insert.jsp";
				}

			} else if (path.equals("/read") || path.equals("/read.jsp")) {
				// 문의 사항 조회 화면

				// DB에서 데이터 조회
				// 1. 타입
				List<Type> typelist = commonservice.getTypeList(Common.BOARD);

				// 2. Board 데이터
				// 조회 할 데이터 PK(KEY)
				int no = Integer.parseInt(request.getParameter("no"));
				Board result = service.select(no);

				// 3. 답변
				Answer answer = answerService.selectBy(no);

				// 화면에 표시를 위해 request 에 담기
				request.setAttribute("result", result);
				request.setAttribute("typelist", typelist);
				request.setAttribute("answer", answer);

				// 이동 할 페이지
				page = urlJsp + "read.jsp";

			} else if (path.equals("/update") || path.equals("/update.jsp")) {
				// 게시글 수정 화면

				// 로그인 정보가 없으면 수정 할 수 없음
				if (!userId.isEmpty()) {
					// 조회 할 데이터 PK(KEY)
					int no = Integer.parseInt(request.getParameter("no"));

					// DB에서 데이터 조회
					Board result = service.select(no);
					List<Type> typelist = commonservice.getTypeList(Common.BOARD);

					// 화면에 표시를 위해 request 에 담기
					request.setAttribute("typelist", typelist);
					request.setAttribute("result", result);
					request.setAttribute("no", no);

					// 이동 할 페이지
					page = urlJsp + "update.jsp";
				}

			} else if (path.equals("/delete") || path.equals("/delete.jsp")) {
				// 문의 사항 삭제 처리

				// 삭제 할 데이터 화면에서 가져오기
				int no = Integer.parseInt(request.getParameter("no"));

				// DB에 삭제 처리 보내기
				boolean result = service.delete(no);

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
			// 문의사항 번호 없을 때 리스트 화면으로 이동
			response.sendRedirect(root + url + "list?error=true");
			return;
		}
		// 화면 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

	/**
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String root = request.getContextPath();
		String path = request.getPathInfo();

		String userId = "";
		Object attribute = request.getSession().getAttribute("loginUser");
		if (null != attribute) {
			userId = ((Users) attribute).getUser_id();
		} else {
			// 유저 정보가 없으면 문의 사항 등록, 수정, 답변 작성 할 수 없음
			String page = url + "list.jsp?error=no";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
			return ;
		}

		System.out.println("BoardServlet : POST : " + path);

		if (path.equals("/insert") || path.equals("/insert.jsp")) {
			// 문의 사항 등록 처리 

			// 등록 할 데이터 화면에서 가져오기
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int typeNo = Integer.parseInt(request.getParameter("typeNo"));
			String phonenumber = request.getParameter("phonenumber");

			// 등록 할 데이터 만들기
			Board dto = Board.builder().typeNo(typeNo).title(title).content(content).phonenumber(phonenumber)
					.userId(userId).build();

			// DB에 등록하기
			Board resultDto = service.insert(dto);

			// 등록 결과
			if (resultDto != null) {
				System.out.println("등록 성공");
				// 등록 성공시 이동할 페이지
				response.sendRedirect(root + url + "list");
			} else {
				System.out.println("등록 실패");
				// 등록 실패시 이동할 페이지
				response.sendRedirect(root + url + "insert.jsp?error=true");
			}

		} else if (path.equals("/update") || path.equals("/update.jsp")) {
			// 문의 사항 수정 처리

			// 수정 할 데이터 화면에서 가져오기
			int no = Integer.parseInt(request.getParameter("no"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String phonenumber = request.getParameter("phonenumber");
			int typeNo = Integer.parseInt(request.getParameter("typeNo"));

			// 수정 할 데이터 만들기
			Board dto = Board.builder().no(no).typeNo(typeNo).title(title).content(content).phonenumber(phonenumber)
					.userId(userId).build();

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
				response.sendRedirect(root + url + "update.jsp?error=true");
			}

		} else if (path.equals("/answerUpdate")) {
			// 답변 업데이트

			// 화면에서 데이터 가져오기
			String noStr = request.getParameter("no");
			String answerNoStr = request.getParameter("answer_no");
			String content = request.getParameter("content");

			if (noStr == null || noStr.trim().isEmpty()) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "no 또는 answer_no 파라미터가 비어 있습니다.");
				return;
			}

			int no = Integer.parseInt(noStr);

			if (answerNoStr == null || answerNoStr.trim().isEmpty()) {
				// INSERT 처리
				Answer answer = Answer.builder().boardNo(no).content(content).adminId(userId).build();

				Answer inserted = answerService.insert(answer);

				if (inserted == null || inserted.getNo() == 0) {
					System.out.println("신규 등록 실패");
					response.getWriter().print(0);
					return;
				}

				// 게시글 상태 업데이트
				Board board = Board.builder().no(no).answeredKbn(true).build();
				service.update(board, true);

				System.out.println("신규 등록 성공: answer_no=" + inserted.getNo());

				response.getWriter().print(inserted.getNo());
				return;

			} else {
				// 수정 : update
				int answer_no = Integer.parseInt(answerNoStr);

				// 수정 할 데이터 만들기
				Answer answer = Answer.builder().no(answer_no).boardNo(no).content(content).adminId(userId).build();

				// DB에 업데이트 보내기
				boolean result = answerService.update(answer);

				// 업데이트 처리 결과
				if (result) {
					System.out.println("수정 성공");

					Board board = Board.builder().no(no).answeredKbn(true).build();
					service.update(board);

					// 수정 성공시 이동할 페이지
					response.getWriter().print(answer_no);
					return;
				} else {
					System.out.println("수정 실패");
					response.getWriter().print(answer_no);
					return;
				}
			} // end 답변 등록, 답변 수정
		} // end 답변 업데이트
	}
}
