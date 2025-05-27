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
	<div class="list-box">
		<div class="title-area fs-30 text-dark">마이페이지</div>
		<div class="table-responsive">
			<div class="sub-title-area fs-25 text-dark">구매내역</div>
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
					<tr><td colspan="4"></td></tr>
					<% } %>
				</tbody>
			</table>
		</div>
		
		<div class="pagination">
			<span>1</span> <span>2</span> <span>3</span> <span>4</span> <span>5</span>
			<span>6</span> <span>7</span> <span>8</span> <span>9</span> <span>10</span>
		</div>
			
		<a href="<%=Common.getUrl("")%>" class="btn btn-cyan-700 btn-main">메인</a>
	</div>
	</main>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>