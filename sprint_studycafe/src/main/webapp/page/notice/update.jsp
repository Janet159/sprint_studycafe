<%@ include file="/alljsp/jstl.jsp"%>
<%@ include file="/alljsp/common.jsp"%>

<%@ page import="Config.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>공지사항 수정/삭제</title>
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
		<div class="row justify-content-center">
			<div class="col-md-7">
				<div class="content-box">
					<div class="content-title">공지사항</div>
					<form action="<%=Common.getUrl(Common.NOTICE, Common.UPDATE)%>"
						method="post">
						<div class="row mb-5 pb-3 border-bottom">
							<label for="title" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="title"
									value="${result.title}" name="title" required>
							</div>
						</div>
						<div class="row mb-5 pb-3 border-bottom">
							<label for="content"
								class="col-sm-2 col-form-label d-flex align-items-center justify-content-center">내용</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="content"
									style="resize: none; height: 300px;" name="content" required>${result.content}</textarea>
							</div>
						</div>
						<div class="d-grid gap-2">
							<input type="hidden" name="no" value="${no}" />
							<button type="submit"
								class="btn btn-cyan-700">수정</button>
							<a
								href="<%= Common.getUrl(Common.NOTICE, Common.DELETE) %>?no=${result.no}"
								class="btn btn-cancel">삭제</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</main>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>