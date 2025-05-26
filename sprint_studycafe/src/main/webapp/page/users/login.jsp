<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>
<%@ include file="/alljsp/jstl.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>로그인</title>
	<link href="login.css" rel="stylesheet">
	<jsp:include page="/alljsp/link.jsp" />
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
<div class="container login-box d-flex justify-content-center align-items-center my-10">
	<form action="<%= root %>/users/login" method="post">
		<div class="login-title">Login</div>
		<div class="mb-3">
			<input type="text" class="form-control" name="user_id" placeholder="아이디">
		</div>
		<div class="mb-2">
			<input type="password" class="form-control" name="password" placeholder="비밀번호">
		</div>
		<div class="mb-4 text-end">
			<div class="form-check d-inline-block">
			<input class="form-check-input" type="checkbox" id="saveId">
			<label class="form-check-label" for="saveId">
			  아이디 저장
			</label>
		</div>
		</div>
		<div class="d-grid gap-2">
			<button type="submit" class="btn btn-login btn-cyan-700">로그인</button>
			<a href="<%= root %>/page/users/join.jsp" class="btn btn-cancel text-center">회원가입</a>
		</div>
	</form>
</div>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
<%-- 	<jsp:include page="/alljsp/script.jsp" /> --%>
</body>
</html>