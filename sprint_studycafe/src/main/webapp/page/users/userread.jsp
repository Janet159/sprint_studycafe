<%@ include file="/alljsp/common.jsp"%>

<%@ page import="Config.Common"%>
<%@ page import="DTO.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<title><%=Common.TITLE%></title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="<%=root%>/allcss/read.css" rel="stylesheet">
</head>
<body>
	<%
	// 세션에서 사용자 정보 꺼내기
	Users loginUser = (Users) session.getAttribute("loginUser");
	%>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
	<main class="main-1920">
		<div class="container-1360 position-relative">

			<div class="text-center fs-30 py-10 fw-bold border-bottom border-gray">마이페이지</div>
			<div class="text-center my-6 fs-25 py-5 fw-bold">회원정보</div>
			<div
				class="info-area mx-auto rounded mb-10 pt-7 gap-20 d-flex flex-column align-items-center">

				<div class="info-item-area mb-3 row">
					<label class="col-4 col-form-label text-center fs-20">아이디</label>
					<div class="col-8">
						<div class="info-box"><%=loginUser.getUser_id()%></div>
					</div>
				</div>

				<div class="info-item-area mb-3 row">
					<label class="col-4 col-form-label text-center fs-20">이름</label>
					<div class="col-8">
						<div class="info-box"><%=loginUser.getName()%></div>
					</div>
				</div>

				<div class="info-item-area mb-3 row">
					<label class="col-4 col-form-label text-center fs-20">이메일</label>
					<div class="col-8">
						<div class="info-box"><%=loginUser.getEmail()%></div>
					</div>
				</div>

			</div>
			<a href="<%=root%>/main.jsp"
				class="btn btn-cyan-700 fw-semibold fs-30 text-center position-absolute end-0">
				메인 </a>
		</div>
	</main>


	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>