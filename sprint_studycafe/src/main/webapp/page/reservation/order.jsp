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
		String seatsId = request.getParameter("seatsId");
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
				<%
					for (int i = 0 ; i < ticketList.size() ; i++  ) {
						Ticket ticket = ticketList.get(i);
				%>
				
					<% if (i % 3 == 0) { %>
					<div class="row justify-content-center">
					<% } %>
						<div class="col-auto">
							<% if (i == 0) { %>
								<div class="card mb-3 btn-cyan-700-55" style="max-width: 18rem;">
							<% } else {%>
								<div class="card mb-3" style="max-width: 18rem;">
							<% } %>
								<input type="hidden" id="hidden<%= i %>" value="<%= ticket.getTicketId() %>"/>
								<div class="card-header"><%= ticket.getTicketTime() %>시간</div>
								<div class="card-body">
									<h6 class="card-title"><%= ticket.getTicketTime() %>시간 : <%= Common.getIntegerToString(ticket.getPrice()) %>원</h6>
									<p class="card-text">퇴실 예정 시간 : <%= Common.afterHour(ticket.getTicketTime()) %></p>
								</div>
							</div>
						</div>
						
					<% if (i % 3 == 2 || i == ticketList.size() -1 ) { %>
					</div>
					<% } %>
				<% } %>
				<%-- end row --%>

				<div class="row">
					<div class="col-12">
						<form action="<%= Common.getUrl(Common.RESERVATION, Common.ORDER) %>" method="post">
							<input type="hidden" value="1" id="seatsNo" name="seatsNo"/>
							<input type="submit" class="btn btn-cyan-700 w-100 mb-3" value="구매"/>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<a href="<%= Common.getUrl(Common.RESERVATION, Common.LIST) %> class="btn btn-cyan-700-55 w-100">취소</a>
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
	$(function() {
		$('.col-auto').click(function() {
			// 클릭된 .col 내부의 input[type=hidden]의 값을 가져옴
			let ticketId = $(this).find('input[type=hidden]').val();

			// 그 값을 #seatsNo의 value로 설정
			$('#seatsNo').val(ticketId);

			// 기존 선택된 카드들 클래스 변경: text-bg-info -> border-info
	        $('.card.btn-cyan-700-55').removeClass('btn-cyan-700-55'); // .addClass('border-info');
	        // 현재 클릭된 카드에 클래스 변경: border-info -> text-bg-info
	        $(this).find('.card')/*.removeClass('btn-cyan-700')*/.addClass('btn-cyan-700-55');
		});
	});
</script>

</body>
</html>