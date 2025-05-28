package Servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import Config.Common;
import DTO.Service;
import DTO.Type;
import Service.CommonService;
import Service.CommonServiceImpl;
import Service.ServiceService;
import Service.ServiceServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/service/*")
public class ServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String urlJsp = "/page/service/" ;

	private ServiceService service = new ServiceServiceImpl();
	private CommonService typeService = new CommonServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String root = request.getContextPath();
		String path = request.getPathInfo();
		
		String page = "";

		System.out.println("ServiceServlet : GET : " + path);

		if (path == null || path.isEmpty() || path.equals("/list") || path.equals("/list.jsp")) {

			// 문의 사항 목록 화면
			Map<Integer, Type> typeMap = typeService.getTypeMap(Common.SERVICE);

			// DB에서 데이터 전체 조회
			List<Service> resultList = service.list();

			for (Service service : resultList) {
				service.setTypeName(typeMap.get(service.getTypeNo()).getTypeName());
			}

			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("resultList", resultList);

			// 이동 할 페이지 
			page = urlJsp + "list.jsp";

		} else if (path.equals("/insert") || path.equals("/insert.jsp")) {
			// 게시글 등록 화면
			
			// DB에서 데이터 전체 조회
			List<Type> typeList = typeService.getTypeList(Common.SERVICE);
			
			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("typeList", typeList);

			// 이동 할 페이지 
			page = urlJsp +"insert.jsp";

		} else if (path.equals("/update") || path.equals("/update.jsp")) {
			// 게시글 수정 화면 

			// 조회 할 데이터 PK(KEY)
			int no = Integer.parseInt(request.getParameter("no"));

			// DB에서 데이터 전체 조회
			List<Type> typeList = typeService.getTypeList(Common.SERVICE);
			
			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("typeList", typeList);
			
			// DB에서 데이터 조회
			Service result = service.select(no);

			// 화면에 표시를 위해 request 에 담기
			request.setAttribute("service", result);

			// 이동 할 페이지 
			page = urlJsp + "update.jsp";

		} else if (path.equals("/delete") || path.equals("/delete.jsp")) {
			// 문의 사항 삭제 처리
			
			// 삭제 할 데이터 화면에서 가져오기
			int no = Integer.parseInt(request.getParameter("no"));
			
			// 삭제 할 데이터 만들기
			Service dto = Service.builder().no(no).build();
			
			// DB에 삭제 처리 보내기
			boolean result = service.delete(dto);
			
			// 삭제 결과
			if (result) {
				System.out.println("삭제 성공");
				// 삭제 성공 시 이동할 페이지
				response.sendRedirect(root + "/service/list");
				return;
			} else {
				System.out.println("삭제 실패");
				// 삭제 실패 시 이동할 페이지
				response.sendRedirect(root + "/service/update.jsp?error=true");
				return;
			}
		}

		// 화면 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String root = request.getContextPath();
		String path = request.getPathInfo();

		System.out.println("ServiceServlet : POST : " + path);

		if (path.equals("/insert") || path.equals("/insert.jsp")) {
			// 등록 처리 

			// 등록 할 데이터 화면에서 가져오기
			int typeNo = Integer.parseInt(request.getParameter("typeNo"));
			String serviceId = request.getParameter("serviceId");
			String location = request.getParameter("location");

			// 등록 할 데이터 만들기
			Service dto = Service.builder().typeNo(typeNo).serviceId(serviceId).location(location).build();

			// DB에 등록하기
			Service resultDto = service.insert(dto);

			// 등록 결과
			if (resultDto != null) {
				System.out.println("등록 성공");
				// 등록 성공시 이동할 페이지
				response.sendRedirect(root + "/service/list");
			} else {
				System.out.println("등록 실패");
				// 등록 실패시 이동할 페이지
				response.sendRedirect(root + "/service/insert");
			}

		} else if (path.equals("/update") || path.equals("/update.jsp")) {
			// 편의 시설 수정 처리

			// 수정 할 데이터 화면에서 가져오기
			int no = Integer.parseInt(request.getParameter("no"));
			int typeNo = Integer.parseInt(request.getParameter("typeNo"));
			String serviceId = request.getParameter("serviceId");
			String location = request.getParameter("location");

			// 수정 할 데이터 만들기
			Service dto = Service.builder().no(no).typeNo(typeNo).serviceId(serviceId).location(location).build();

			// DB에 업데이트 보내기
			boolean result = service.update(dto);

			// 업데이트 처리 결과
			if (result) {
				System.out.println("수정 성공");
				// 수정 성공시 이동할 페이지
				response.sendRedirect(root + "/service/list");
				return;
			} else {
				System.out.println("수정 실패");
				// 수정 실패시 이동할 페이지
				response.sendRedirect(root + "/service/update.jsp?error=true");
			}
		}
	}
}
