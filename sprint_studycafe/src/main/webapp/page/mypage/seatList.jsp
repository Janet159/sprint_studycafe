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
			color: #5ecbe1;
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
	<div class="list-box">
		<div class="sub-title-area fs-50">좌석현황</div>

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
					<tr><td colspan="4"></td></tr>
					<% } %>
				</tbody>
			</table>
		</div>

		<div class="pagination">
			<span>1</span> <span>2</span> <span>3</span> <span>4</span> <span>5</span>
			<span>6</span> <span>7</span> <span>8</span> <span>9</span> <span>10</span>
		</div>
			
		<a href="<%= Common.getUrl() %>" class="btn btn-cyan-700 btn-main">메인</a>
	</div>
	</main>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>