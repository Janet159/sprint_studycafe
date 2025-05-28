<%@ include file="/alljsp/jstl.jsp"%>
<%@ include file="/alljsp/common.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Ticket"%>
<%@ page import="DTO.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>마이페이지</title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="<%=root%>/allcss/list.css" rel="stylesheet">
</head>
<body>
	<%
		Object att = request.getAttribute("resultList");
		List<Reservation> arrList;
		if (att != null) {
			arrList = (List<Reservation>) request.getAttribute("resultList");
		} else {
			arrList = new ArrayList<Reservation>();
		}
	%>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main class="container-1360">
		<div class="title-area">마이페이지</div>
		<div class="sub-title-area">구매내역</div>

		<div class="list-area">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>구매일시</th>
							<th>이용권정보</th>
							<th>이용시간</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (int i = 0; i < arrList.size(); i++) {
							Reservation dto = arrList.get(i);
						%>
						<tr>
							<td><%=dto.getNo()%></td>
							<td><%=Common.getDateToString(dto.getOrderTime())%></td>
							<td><%=dto.getTicketName()%></td>
							<td><%=Common.getDateToString(dto.getStartTime())%> - <%=Common.getDateToString(dto.getEndTime())%></td>
						</tr>
						<%
						}
						for (int i = 0; i < 10 - arrList.size(); i++) {
						%>
						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>
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
				<a href="<%=Common.getUrl("")%>" class="btn btn-cyan-700">메인</a>
			</div>
		</div>
	</main>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>