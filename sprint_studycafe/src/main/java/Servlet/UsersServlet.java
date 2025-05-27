package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import DTO.Users;
import Service.UsersService;
import Service.UsersServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class BoardServlet
 */
@WebServlet("/users/*")
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsersService users = new UsersServiceImpl();

	private final String urlJsp = "/page/users/";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String root = request.getContextPath();
		String path = request.getPathInfo();
		String page = "";

		System.out.println("UsersServlet : GET : " + path);

		if (path == null || path.isEmpty() || path.equals("/userlist") || path.equals("/userlist.jsp")) {
			// 회원 목록 화면

			// DB에서 데이터 전체 조회
			List<Users> resultList = users.list();

			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("resultList", resultList);

			// 이동 할 페이지 
			page = urlJsp + "userlist.jsp";

		} else if (path.equals("/usersread") || path.equals("/usersread.jsp")) {
			// 회원 정보 화면

			// 조회 할 데이터 PK(KEY)
			int no = Integer.parseInt(request.getParameter("no"));

			// DB에서 데이터 조회
			Users result = users.select(no);

			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("result", result);

			// 이동 할 페이지 
			page = urlJsp + "usersread.jsp";

		} else if (path.contains("/idCheck")) {
			// /idCheck - 아이디 중복 확인

			System.out.println("아이디 중복 확인...");
			String userId = request.getParameter("userId");
			boolean check = users.idCheck(userId);
			response.getWriter().print(check);
			return;		// 안 멈추면 계속 /users 로 돌아감

		} else if (path.equals("/logout")) {
			// /logout - 로그아웃

			System.out.println("로그아웃...");
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(root + "/main.jsp");
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

		System.out.println("UsersServlet : POST : " + path);

		if (path.equals("/join") || path.equals("/join.jsp")) {
			// 회원 등록 처리 

			// 등록 할 데이터 화면에서 가져오기
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmPassword");
			String name = request.getParameter("name");
			String email = request.getParameter("email");

			if (!password.equals(confirmPassword)) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다.');");
				out.println("history.back();"); // 이전 페이지로 돌아가기
				out.println("</script>");
				out.close();
				return;
			}

			// 등록 할 데이터 만들기
			Users dto = Users.builder().user_id(userId).password(password).name(name).email(email).build();

			// DB에 등록하기
			Users resultDto = users.insert(dto);

			// 등록 결과
			if (resultDto != null) {
				System.out.println("등록 성공");
				// 등록 성공시 이동할 페이지
				response.sendRedirect(root + "/main.jsp");
			} else {
				System.out.println("등록 실패");
				// 등록 실패시 이동할 페이지
				response.sendRedirect(root + urlJsp + "join.jsp");
			}

		} else if (path.equals("/login") || path.equals("/login.jsp")) {
			// /login - 로그인

			String user_id = request.getParameter("user_id");
			String password = request.getParameter("password");
			Users user = Users.builder().user_id(user_id).password(password).build();
			boolean result = users.login(user);
			// 로그인 성공
			if (result) {
				// 회원 조회
				Users loginUser = users.selectByUsername(user_id);
				loginUser.setPassword(null);
				// 세션에 사용자 정보 등록
				HttpSession session = request.getSession();
				session.setAttribute("loginId", user.getUser_id());
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("role", loginUser.getAdminKbn());
				
			    // 아이디 저장 체크 여부 확인
			    String saveId = request.getParameter("saveId");

			    Cookie cookie = new Cookie("savedId", user_id);
			    cookie.setPath("/");

			    if (saveId != null) {
			        cookie.setMaxAge(60 * 60 * 24 * 7); // 7일간 저장
			    } else {
			        cookie.setMaxAge(0); // 삭제
			    }

			    response.addCookie(cookie);
				
				response.sendRedirect(root+"/main.jsp");
				
			}
			// 로그인 실패
			else {
				response.sendRedirect(root + urlJsp + "login.jsp?error=true");
			}
		}
	}
}
