<%-- 전역변수 --%>
<%
	// Context Path (루트 경로)
	String root = request.getContextPath();
	// 로그인 아이디 (세션)
	String loginId = (String) session.getAttribute("loginId");
	
	//로그인 됬을 경우
	loginId = "admin123";
	
	// 관리자 권한
	boolean role = true;
	
	pageContext.setAttribute("root", root);
%>