<%@ include file="/alljsp/jstl.jsp"%>
<%@ include file="/alljsp/common.jsp"%>

<%@ page import="Config.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>회원 가입</title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="<%= root %>/page/users/join.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<div class="border-box">
		<div class="logo-wrapper">
			<img src="<%=root%>/img/스프린트 스터디 카페 남색.png" class="logo" alt="SPRINT Logo" />
		</div>

		<div class="title-area">회원가입</div>

		<div class="form-box border-gray mt-5 mb-10">
			<form action="<%=root%>/users/join" method="post">
				<div class="mb-3 row align-items-center">
					<label class="col-3 col-form-label">아이디</label>
					<div class="col-9 d-flex">
						<input type="text" name="userId" id="userId" class="form-control me-2" required />
						<button type="button" class="btn btn-check-id btn-cyan-700" onclick="clickIdCheck()">중복확인</button>
					</div>
				</div>

				<div class="mb-3 row align-items-center">
					<label class="col-3 col-form-label">비밀번호</label>
					<div class="col-9">
						<input type="password" name="password" class="form-control" required />
					</div>
				</div>

				<div class="mb-3 row align-items-center">
					<label class="col-3 col-form-label">비밀번호 확인</label>
					<div class="col-9">
						<input type="password" name="confirmPassword" class="form-control" required />
					</div>
				</div>

				<div class="mb-3 row align-items-center">
					<label class="col-3 col-form-label">이름</label>
					<div class="col-9">
						<input type="text" name="name" class="form-control" required />
					</div>
				</div>

				<div class="mb-4 row align-items-center">
					<label class="col-3 col-form-label">이메일</label>
					<div class="col-9">
						<input type="email" name="email" class="form-control" required />
					</div>
				</div>

				<div class="d-grid gap-2">
					<button type="submit" class="btn btn-cyan-700">가입</button>
					<a href="<%=root%>/main.jsp" class="btn btn-cancel">취소</a>
				</div>
			</form>
		</div>
	</div>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />

	<script>
		async function clickIdCheck() {
			console.log('click!');
			let check = await idCheck()
			if (check) {
				alert('중복된 아이디 입니다.')
			} else {
				alert('사용 가능한 아이디 입니다.')
			}
		}
	</script>
</body>
</html>