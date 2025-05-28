<%@ include file="/alljsp/jstl.jsp"%>
<%@ include file="/alljsp/common.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Reservation"%>
<%@ page import="DTO.Seats"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<jsp:include page="/alljsp/link.jsp" />
<link href="<%=root%>/allcss/list.css" rel="stylesheet">
<style>
.table thead th {
	color: #168099;
}
</style>
</head>
<body>
	<%
		Object att = request.getAttribute("resultList") ;
		List<Reservation> arrList ;
		if (att != null ) {
			arrList = (List<Reservation>) request.getAttribute("resultList");
		} else {
			arrList = new ArrayList<Reservation>();
		}
	%>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main class="container-1360">
		<div class="title-area">좌석현황</div>

		<div class="list-area">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>이름</th>
							<th>아이디</th>
							<th>좌석 번호</th>
							<th>이용 시간</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (int i = 0; i < arrList.size(); i++) {
							Reservation dto = arrList.get(i);
						%>
						<tr>
							<td><%=dto.getUserName()%></td>
							<td><%=dto.getUserId()%></td>
							<td><%=dto.getSeatName()%></td>
							<td><%=dto.getStartTimeStr()%>-<%=dto.getEndTimeStr()%></td>
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
				<a href="<%=Common.getUrl()%>" class="btn btn-cyan-700">메인</a>
			</div>
		</div>
	</main>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>