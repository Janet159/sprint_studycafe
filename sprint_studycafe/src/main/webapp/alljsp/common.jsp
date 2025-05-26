<%-- 전역변수 --%>
<%
	// Context Path (루트 경로)
	String root = request.getContextPath();
	// 로그인 아이디 (세션)
	String loginId = (String) session.getAttribute("loginId");

	
	// 관리자 권한
	boolean role =(boolean) session.getAttribute("role");
	
	pageContext.setAttribute("root", root);
%>