<%@ include file="/alljsp/jstl.jsp"%>
<%@ include file="/alljsp/common.jsp"%>

<%@ page import="Config.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>공지사항 등록</title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="<%=root%>/allcss/insert.css" rel="stylesheet">
	<style>
		body {
			padding-bottom: 100px;
		}
	</style>
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main>
	<div class="container">
		<div class="title-area">공지사항</div>
		<div class="content-box mx-auto">
			<form action="<%=Common.getUrl(Common.NOTICE, Common.INSERT)%>" method="post">
				<div class="row mb-5 pb-3 border-bottom">
					<label for="title" class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="title" name="title" required>
					</div>
				</div>
				<div class="row mb-5 pb-3 border-bottom">
					<label for="floatingTextarea2"
						class="col-sm-2 col-form-label d-flex align-items-center justify-content-center">내용</label>
					<div class="col-sm-10">
						<textarea class="form-control" id="floatingTextarea2"
							style="resize: none; height: 300px;" name="content" required></textarea>
					</div>
				</div>
				
				<button type="submit" class="btn btn-cyan-700 w-100">등록</button>
			</form>
		</div>
	</div>
	</main>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>