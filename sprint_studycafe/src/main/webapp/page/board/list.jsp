<%@ include file="/alljsp/jstl.jsp"%>
<%@ include file="/alljsp/common.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Users"%>
<%@ page import="DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%=Common.TITLE%></title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="<%=root%>/allcss/list.css" rel="stylesheet">
	<style>
		body {
			padding-bottom: 100px;
		}
	</style>
</head>
<body>
	<%
	Users user = (Users) session.getAttribute("loginUser");

	String param = request.getParameter("type");
	String title = "나의 문의사항";
	if (null == param || param.isEmpty()) {
		title = "문의사항";
	}

	Object object = request.getAttribute("resultList");
	List<Board> resultList;
	if (object != null) {
		resultList = (List<Board>) request.getAttribute("resultList");
	} else {
		resultList = new ArrayList<Board>();
	}
	%>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
	<main class="container-1360">
		<div class="list-box">
			<div class="title-area fs-30">고객센터</div>
			<div class="table-responsive">
				<div class="sub-title-area text-cyan-700 fs-25"><%=title%></div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>답변</th>
							<th>구분</th>
							<th>제목</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (int i = 0; i < resultList.size(); i++) {
							Board board = resultList.get(i);
						%>
						<tr>
							<td><%=board.getNo()%></td>
							<td><%=board.isAnsweredKbn() ? "✔" : "✖"%></td>
							<td><%=board.getTypeName()%></td>
							<td><a href="<%=Common.getUrl(Common.BOARD, Common.READ)%>?no=<%=board.getNo()%>">
									<%=board.getTitle()%></a></td>
							<td><%=Common.getDateToString(board.getCreatedAt())%></td>
						</tr>
						<%
						}
						for (int i = 0; i < 10 - resultList.size(); i++) {
						%>
						<tr><td colspan="5"></td></tr>
						<% } %>
						<%-- for 끝 --%>
					</tbody>
				</table>
			</div>
			
			<div class="pagination">
				<span>1</span> <span>2</span> <span>3</span> <span>4</span> <span>5</span>
				<span>6</span> <span>7</span> <span>8</span> <span>9</span> <span>10</span>
			</div>
			
			<div class="btn-main">
				<% if (user != null) { %>
				<a href="<%=Common.getUrl(Common.BOARD, Common.INSERT)%>"
					class="btn btn-cyan-700">1:1문의</a>
				<% } %>
				<a href="<%=root%>" class="btn btn-cyan-700 btn-main">메인</a>
			</div>
		</div>
	</main>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>