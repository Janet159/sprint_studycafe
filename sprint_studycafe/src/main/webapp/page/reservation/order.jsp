<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>

<%@ page import="java.util.List"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Ticket"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%= Common.TITLE %></title>
	<jsp:include page="/alljsp/link.jsp" />
</head>
<body>
	<%
		List<Ticket> ticketList = Ticket.getTestList();
		request.setAttribute("ticketList" ,ticketList);
	%>

	<!-- header 포함하기 -->
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main>
		<div class="container mt-5">
			<h2 class="mb-4 text-center">좌석 구매</h2>

			<div class="container text-center">
			
				<c:forEach items="${ticketList}" var="ticket" varStatus="index">
					<c:if test="${index.index % 3 == 0 }">
						<div class="row">
					</c:if>
						<div class="col">
							<c:if test="${index.first}">
								<div class="card text-bg-info mb-3" style="max-width: 18rem;">
							</c:if>
							<c:if test="${!index.first}">
								<div class="card border-info mb-3" style="max-width: 18rem;">
							</c:if>
								<div class="card-header">${ticket.ticketTime}시간</div>
								<div class="card-body">
									<h6 class="card-title">${ticket.ticketTime}시간 : <fmt:formatNumber value="${ticket.price}" type="number" />원</h6>
									<% Ticket ticketObj = (Ticket) pageContext.getAttribute("ticket"); %>
									<p class="card-text">퇴실 예정 시간 : <%= Common.afterHour(ticketObj.getTicketTime()) %></p>
								</div>
							</div>
						</div>
					<c:if test="${index.index % 3 == 2 || index.last}">
						</div>
					</c:if>
				</c:forEach>
				<%-- end row --%>

				<div class="row">
					<div class="col-12">
						<form action="/resevation/order" method="post">
							<input type="hidden" value="1" />
							<button type="button" class="btn btn-cyan-700 w-100 mb-3"
								onclick="order()">구매</button>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<a href="/resevation/list" class="btn btn-cyan-700-55 w-100">취소</a>
					</div>
				</div>
			</div>
			<%-- end container --%>

		</div>
	</main>

	<%-- [Contents] ######################################################### --%>

	<!-- footer 포함하기 -->
	<jsp:include page="/alljsp/footer.jsp" />

	<!-- script 포함하기 -->
	<script>
		function order() {
			/*
				1. 카드를 선택하면 히든에 티켓 아이디 저장
				2. 폼 submit
			 */
		}
	</script>
</body>
</html>