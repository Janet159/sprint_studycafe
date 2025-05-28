<%@ include file="/alljsp/jstl.jsp"%>
<%@ include file="/alljsp/common.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Board"%>
<%@ page import="DTO.Type"%>
<%@ page import="DTO.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title><%=Common.TITLE%></title>
<jsp:include page="/alljsp/link.jsp" />
<link href="<%=root%>/allcss/insert.css" rel="stylesheet">
<link href="<%=root%>/allcss/read.css" rel="stylesheet">
</head>
<body>
	<%
	String readonly = "readonly";
	if (role) {
		readonly = "";
	}
	
	// 세션에서 사용자 정보 꺼내기
	Users user = (Users) session.getAttribute("loginUser");
	if (user == null) {
		user = new Users() ;
	}

	Board board;
	List<Type> typelist;

	// 문의사항
	Object object1 = request.getAttribute("result");
	if (object1 != null) {
		board = (Board) request.getAttribute("result");
	} else {
		board = new Board();
	}

	// 구분
	Object object2 = request.getAttribute("typelist");
	if (object2 != null) {
		typelist = (List<Type>) request.getAttribute("typelist");
	} else {
		typelist = new ArrayList<Type>();
	}
	
	// 관리자이거나 작성자인지
	boolean canUpdate = false ;
	if (role || (null != board.getUserId() && null != user.getUser_id() && board.getUserId().equals(user.getUser_id()))) {
		canUpdate = true ;
	}
	
	%>

	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main class="container-1360">
		<div class="title-area">문의내용</div>

		<div class="container mb-10">
			<div class="content-area mx-auto">
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
							<input class="form-check-input" type="radio" name="category"
								id="opt<%=i%>" <%=check%> disabled> <label
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
						<input type="text" class="form-control" id="title" readonly
							value="${result.title}">
					</div>
				</div>

				<%-- 내용 --%>
				<div class="row border-bottom mb-3 pb-3">
					<label
							class="col-2 col-form-label d-flex align-items-center justify-content-center fw-bold" for="content">내용</label>
					<div class="col-10">
						<textarea class="form-control " id="content"
							style="resize: none; height: 300px;" readonly>${result.content}</textarea>
					</div>
				</div>

				<%
				if (canUpdate) {
				%>
				<%-- 고객 정보 --%>
				<div class="row border-bottom mt-4 mb-3 pb-3">
					<label class="col col-form-label text-start fs-20">고객정보</label>
				</div>

				<%-- 전화번호 --%>
				<div class="row border-bottom mb-3 pb-3">
					<label class="col-2 col-form-label fw-bold fw-bold" for="phone">전화번호</label>
					<div class="col-4">
						<input class="form-control" type="text" id="phone"
							name="phonenumber" placeholder="-없이 입력하세요." maxlength="11"
							readonly>
					</div>
				</div>
				<%
				}
				%>

				<%-- 버튼 --%>
				<div class="w-100 d-flex flex-column gap-3 mt-5">
					<%-- 수정, 삭제 버튼 --%>
					<%
					if (canUpdate) {
					%>
					<div class="col">
						<a
							href="<%= Common.getUrl(Common.BOARD, Common.UPDATE) %>?no=${result.no}"
							class="btn btn-cyan-700 w-100">수정</a>
					</div>
					<div class="col">
						<a
							href="<%= Common.getUrl(Common.BOARD, Common.DELETE) %>?no=${result.no}"
							class="btn btn-cancel w-100">삭제</a>
					</div>
					<%
					}
					%>
				</div>

				<%-- 답변 --%>
				<form>
					<div class="w-100">
						<div class="sub-title-area text-cyan-700 mt-8">답변내용</div>
						<div class="w-100">
							<input type="hidden" id="board_no" name="no" value="${result.no}" />
							<input type="hidden" id="answer_no" name="answer_no"
								value="${answer.no}" />
							<textarea class="form-control mb-3" id="content"
								style="resize: none; height: 130px;" <%=readonly%>>${answer.content}</textarea>
						</div>
						<%
						if (role) {
						%>
						<div class="w-100">
							<button onclick="answer()" class="btn btn-cyan-700 w-100">등록</button>
						</div>
						<%
						}
						%>
					</div>
				</form>
			</div>
		</div>
	</main>

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