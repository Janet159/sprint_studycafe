<%@ include file="/alljsp/jstl.jsp"%>
<%@ include file="/alljsp/common.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="DTO.Board"%>
<%@ page import="DTO.Type"%>
<%@ page import="Config.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title><%=Common.TITLE%></title>
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
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-7">
				<div class="content-box" style="height: 1050px;">
					<div class="content-title">문의내용</div>

					<div class="row mb-3 border-bottom border-top">
						<label class="col-sm-2 col-form-label">구분</label>
						<div class="col-sm-10 d-flex align-items-center gap-3">

							<%
							role = true;
							String readonly = "readonly";
							if (role) {
								readonly = "";
							}
							Board board = (Board) request.getAttribute("result");
							Object object = request.getAttribute("typelist");
							List<Type> typelist;
							if (object != null) {
								typelist = (List<Type>) request.getAttribute("typelist");
							} else {
								typelist = new ArrayList<Type>();
							}
							String check = "";
							for (int i = 0; i < typelist.size(); i++) {
								Type type = typelist.get(i);
								if (type.getNo() == board.getTypeNo()) {
									check = "checked";
								} else {
									check = "";
								}
							%>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="category"
									id="opt<%=i%>" <%=check%> disabled> <label
									class="form-check-label" for="opt<%=i%>"><%=type.getTypeName()%></label>
							</div>
							<%
							}
							%>
						</div>
					</div>
					<div class="row mb-5 pb-4 border-bottom">
						<label for="title" class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" readonly value="${result.title}">
						</div>
					</div>
					<div class="row mb-3 pb-5 border-bottom">
						<label for="floatingTextarea2"
							class="col-sm-2 col-form-label d-flex align-items-center justify-content-center">내용</label>
						<div class="col-sm-10">
							<textarea class="form-control " id="floatingTextarea2"
								style="resize: none; height: 300px;" readonly>${result.content}</textarea>
						</div>
					</div>
					<div class="d-grid gap-2">
						<a
							href="<%= Common.getUrl(Common.BOARD, Common.UPDATE) %>?no=${result.no}"
							class="btn btn-signup btn-cyan-700:hove btn-cyan-700">수정</a> <a
							href="<%= Common.getUrl(Common.BOARD, Common.DELETE) %>?no=${result.no}"
							class="btn btn-cancel">삭제</a>
					</div>
					<form>
						<div class="row justify-content-center mt-2 mb-5 pb-2">
							<div class="title2 mt-3 mb-4 text-cyan-700">답변내용</div>
							<div class="col-sm-10">
								<input type="hidden" id="board_no" name="no"
									value="${result.no}" /> <input type="hidden" id="answer_no"
									name="answer_no" value="${answer.no}" />
								<textarea class="form-control mb-3" id="content"
									style="resize: none; height: 130px;" <%=readonly%>>${answer.content}</textarea>
							</div>
							<div>
								<button onclick="answer()" class="btn btn-main btn-cyan-700"
									value="등록"></button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
	<script src="<%=root%>/alljs/answer.js" type="text/javascript"></script>
	<script>
		async
		function answer() {
			let check = await
			answerUpdate();
			if (check) {
				alert('답변 업데이트 성공')
			}
		}
	</script>
</body>
</html>