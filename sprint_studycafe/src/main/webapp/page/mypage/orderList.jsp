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

	Object att1 = request.getAttribute("ticketMap");
	Map<String, Ticket> ticketMap;
	if (att != null) {
		ticketMap = (Map<String, Ticket>) request.getAttribute("ticketMap");
	} else {
		ticketMap = new HashMap<String, Ticket>();
	}
	%>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	<div class="border-box">
		<div class="title fs-30 text-dark">마이페이지</div>
		<div class="table-responsive">
			<table class="table">
				<div class="title2 fs-25 text-dark">구매내역</div>
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
						Reservation item = arrList.get(i);
					%>
					<tr>
						<td><%=item.getNo()%></td>
						<td><%=Common.getDateToString(item.getOrderTime())%></td>
						<td><%=ticketMap.get(item.getTicketId()).getTicketName()%></td>
						<td><%=Common.getDateToString(item.getStartTime())%> - <%=Common.getDateToString(item.getEndTime())%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<!-- 		<div class="pagination"> -->
		<!-- 			<span>1</span> <span>2</span> <span>3</span> <span>4</span> <span>5</span> -->
		<!-- 			<span>6</span> <span>7</span> <span>8</span> <span>9</span> <span>10</span> -->
		<!-- 		</div> -->

		<a href="<%=Common.getUrl("")%>" class="btn btn-main btn-cyan-700">메인</a>
	</div>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
	<%-- 	<jsp:include page="/layout/script.jsp" /> --%>
</body>
</html>