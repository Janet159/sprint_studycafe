<%@ include file="/alljsp/jstl.jsp"%>
<%@ include file="/alljsp/common.jsp"%>

<%@ page import="Config.Common"%>
<%@ page import="DTO.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<jsp:include page="/alljsp/link.jsp" />
<link href="<%=root%>/allcss/insert.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main>
		<div class="title-area">공지사항</div>

		<div class="container mb-10">
			<div class="content-area mx-auto">
				<%-- 제목 --%>
				<div class="row mb-5 pb-3 border-bottom">
					<label class="col-2 col-form-label fw-bold" for="title">제목</label>
					<div class="col-10">
						<input type="text" class="form-control" id="title" readonly
							value="${result.title}">
					</div>
				</div>

				<%-- 수정 --%>
				<div class="row mb-5 pb-3 border-bottom">
					<label
						class="col-2 col-form-label d-flex align-items-center justify-content-center fw-bold"
						for="content">내용</label>
					<div class="col-10">
						<textarea class="form-control readonly" id="content"
							style="resize: none; height: 300px;" readonly>${result.content}</textarea>
					</div>
				</div>

				<%-- 버튼 --%>
				<%
				if (role) {
				%>
				<div class="w-100">
					<a
						href="<%= Common.getUrl(Common.NOTICE, Common.UPDATE) %>?no=${result.no}"
						class="btn btn-cyan-700 w-100">수정</a>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</main>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>