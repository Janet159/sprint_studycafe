<%@ include file="/alljsp/jstl.jsp"%>
<%@ include file="/alljsp/common.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Notice"%>
<%@ page import="DTO.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>고객센터</title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="<%=root%>/allcss/list.css" rel="stylesheet">
</head>
<body>
	<%
	Object att = request.getAttribute("resultList");
	List<Notice> arrayList;
	if (att != null) {
		arrayList = (List<Notice>) request.getAttribute("resultList");
	} else {
		arrayList = new ArrayList<Notice>();
	}
	%>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
	<main>
		<div class="title-area">고객센터</div>
		<div class="sub-title-area">공지사항</div>

		<div class="list-area">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty resultList}">
							<tr>
								<td colspan="3" class="text-center">조회된 데이터가 없습니다.</td>
							</tr>
						</c:if>
						<%
						for (int i = 0; i < arrayList.size(); i++) {
							Notice notice = arrayList.get(i);
						%>
						<tr>
							<td><%=notice.getVNum()%></td>
							<td><a
								href="<%=Common.getUrl(Common.NOTICE, Common.READ)%>?no=<%=notice.getNo()%>"><%=notice.getTitle()%></a></td>
							<td><%=Common.getDateToString(notice.getCreatedAt())%></td>
						</tr>
						<%
						}
						for (int i = 0; i < 10 - arrayList.size(); i++) {
						%>
						<tr><td colspan="3">&nbsp;</td></tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			
			<div class="pagination">
				<span><a href="">1</a></span>
			</div>
	
			<div class="text-end">
				<% if (role) { %>
				<a href="<%=Common.getUrl(Common.NOTICE, Common.INSERT)%>" class="btn btn-cyan-700">등록</a>
				<% } %>
				<a href="<%=root%>" class="btn btn-cyan-700">메인</a>
			</div>
		</div>
	</main>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>