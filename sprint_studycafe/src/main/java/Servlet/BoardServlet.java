package Servlet;

import java.io.IOException;
import java.util.List;

import DTO.Board;
import DTO.Users;
import Service.BoardService;
import Service.BoardServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardServlet
 */
@WebServlet("/board/*")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService boardService = new BoardServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getPathInfo();
		String page = "";

		System.out.println("BoardServlet : GET : " + path);

		if (path.isEmpty() || path == null || path.equals("/list") || path.equals("/list.jsp")) {
			// 문의 사항 목록 화면

			// DB에서 데이터 전체 조회
			List<Board> boardList = boardService.list();

			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("boardList", boardList);

			// 이동 할 페이지 
			page = "/page/board/list.jsp";

		} else if (path.equals("/insert") || path.equals("/insert.jsp")) {
			// 게시글 등록 화면

			// 이동 할 페이지 
			page = "/page/board/create.jsp";

		} else if (path.equals("/read") || path.equals("/read.jsp")) {
			// 문의 사항 조회 화면

			// 조회 할 데이터 PK(KEY)
			int no = Integer.parseInt(request.getParameter("no"));

			// DB에서 데이터 조회
			Board board = boardService.select(no);

			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("board", board);

			// 이동 할 페이지 
			page = "/page/board/read.jsp";

		} else if (path.equals("/update") || path.equals("/update.jsp")) {
			// 게시글 수정 화면 

			// 조회 할 데이터 PK(KEY)
			int no = Integer.parseInt(request.getParameter("no"));

			// DB에서 데이터 조회
			Board board = boardService.select(no);

			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("board", board);

			// 이동 할 페이지 
			page = "/page/board/update.jsp";

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

		System.out.println("BoardServlet : POST : " + path);

		if (path.equals("/create") || path.equals("/create.jsp")) {
			// 문의 사항 등록 처리 

			// 등록 할 데이터 화면에서 가져오기
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			// 등록 할 데이터 만들기
			Board board = Board.builder().title(title).content(content).userId(userId).build();

			// DB에 등록하기
			Board createdBoard = boardService.insert(board);

			// 등록 결과
			if (createdBoard != null) {
				System.out.println("등록 성공");
				// 등록 성공시 이동할 페이지
				response.sendRedirect(root + "/board/list");
			} else {
				System.out.println("등록 실패");
				// 등록 실패시 이동할 페이지
				response.sendRedirect(root + "/board/list");
			}

		} else if (path.equals("/update") || path.equals("/update.jsp")) {
			// 문의 사항 수정 처리

			// 수정 할 데이터 화면에서 가져오기
			int no = Integer.parseInt(request.getParameter("no"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			// 수정 할 데이터 만들기
			Board board = Board.builder().no(no).title(title).content(content).userId(userId).build();

			// DB에 업데이트 보내기
			boolean result = boardService.update(board);

			// 업데이트 처리 결과
			if (result) {
				System.out.println("수정 성공");
				// 수정 성공시 이동할 페이지
				response.sendRedirect(root + "/board/list");
				return;
			} else {
				System.out.println("수정 실패");
				// 수정 실패시 이동할 페이지
				response.sendRedirect(root + "/board/update.jsp?error=true");
			}

		} else if (path.equals("/delete") || path.equals("/update.jsp")) {
			// 문의 사항 삭제 처리

			// 삭제 할 데이터 화면에서 가져오기
			int no = Integer.parseInt(request.getParameter("no"));

			// 삭제 할 데이터 만들기
			Board board = Board.builder().no(no).build();

			// DB에 삭제 처리 보내기
			boolean result = boardService.delete(board);

			// 삭제 결과
			if (result) {
				System.out.println("삭제 성공");
				// 삭제 성공 시 이동할 페이지
				response.sendRedirect(root + "/board/list");
			} else {
				System.out.println("삭제 실패");
				// 삭제 실패 시 이동할 페이지
				response.sendRedirect(root + "/board/update.jsp?error=true");
			}
		}
	}
}
