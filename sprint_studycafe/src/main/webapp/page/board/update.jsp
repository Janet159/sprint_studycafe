<%@ include file="/alljsp/common.jsp"%>
<%@ include file="/alljsp/jstl.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Type"%>
<%@ page import="DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%=Common.TITLE%></title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="<%=root%>/allcss/insert.css" rel="stylesheet">
</head>
<body>
	<%
	Board board = (Board) request.getAttribute("result");
	Object object = request.getAttribute("typelist");
	List<Type> typelist;
	if (object != null) {
		typelist = (List<Type>) request.getAttribute("typelist");
	} else {
		typelist = new ArrayList<Type>();
	}
	%>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main class="container-1360">
		<div class="title-area">문의내용</div>

		<div class="container mb-10">
			<div class="content-area mx-auto">
				<form action="<%=Common.getUrl(Common.BOARD, Common.UPDATE)%>"
					method="post">

					<%-- 구분 --%>
					<div class="row border-top border-bottom mb-3">
						<label class="col-2 col-form-label fw-bold">구분</label>
						<div class="col-10 d-flex align-items-center gap-3">
							<%
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
								<input class="form-check-input" type="radio" name="typeNo"
									value="<%=type.getNo()%>" id="opt<%=i%>" <%=check%>> <label
									class="form-check-label" for="opt<%=i%>"><%=type.getTypeName()%></label>
							</div>
							<%
							}
							%>
						</div>
					</div>

					<%-- 제목 --%>
					<div class="row border-bottom mb-3 pb-3">
						<label class="col-2 col-form-label fw-bold" for="title">제목</label>
						<div class="col-10">
							<input type="text" class="form-control" id="title" name="title"
								required value="${result.title}">
						</div>
					</div>

					<%-- 내용 --%>
					<div class="row border-bottom mb-3 pb-3">
						<label
							class="col-2 col-form-label d-flex align-items-center justify-content-center fw-bold" for="content">내용</label>
						<div class="col-10">
							<textarea class="form-control" id="content"
								style="resize: none; height: 300px;" name="content" required>${result.content}</textarea>
						</div>
					</div>

					<%-- 고객 정보 --%>
					<div class="row border-bottom mt-4 mb-3 pb-3">
						<label class="col col-form-label text-start fs-20">고객정보</label>
					</div>

					<%-- 전화번호 --%>
					<div class="row border-bottom mb-3 pb-3">
						<label class="col-2 col-form-label fw-bold" for="phone">전화번호</label>
						<div class="col-4">
							<input type="text" class="form-control" id="phone"
								placeholder="-없이 입력하세요." name="phonenumber"
								value="${result.phonenumber}" required>
						</div>
					</div>

					<%-- 버튼 --%>
					<div class="w-100">
						<input type="hidden" name="no" value="${no}" />
						<button type="submit" class="btn btn-cyan-700 w-100">수정</button>
					</div>
				</form>
			</div>
		</div>
	</main>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>