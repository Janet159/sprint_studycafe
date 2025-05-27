<%@ include file="/alljsp/jstl.jsp"%>
<%@ include file="/alljsp/common.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Ticket"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%=Common.TITLE%></title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="<%=root%>/allcss/list.css" rel="stylesheet">
	<link href="<%=root%>/allcss/read.css" rel="stylesheet">
</head>
<body>
	<%
	Object att = request.getAttribute("resultList");
	List<Ticket> resultList;
	if (att != null) {
		resultList = (List<Ticket>) request.getAttribute("resultList");
	} else {
		resultList = new ArrayList<Ticket>();
	}
	%>

	<!-- header 포함하기 -->
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main class="main-1920">
		<div class="container-1360">
			<div class="title-area">좌석 구매</div>

			<div class="text-center">
				<%
				String first = "btn-cyan-700-55";
				for (int i = 0; i < resultList.size(); i++) {
					Ticket ticket = resultList.get(i);
					if (i != 0) first = "" ;
				%>

				<% if (i % 3 == 0) { %>
				<div class="row justify-content-center">
				<% } %>
					<div class="col-auto">
						<div class="card mb-3 <%= first %>" style="max-width: 18rem;">
							<input type="hidden" id="hidden<%=i%>" value="<%=ticket.getTicketId()%>" />
							<div class="card-header"><%=ticket.getTicketTime()%>시간</div>
							<div class="card-body">
								<h6 class="card-title"><%=ticket.getTicketTime()%>시간 :
									<%=Common.getIntegerToString(ticket.getPrice())%>원
								</h6>
								<p class="card-text">퇴실 예정 시간 :
									<%=Common.afterHour(ticket.getTicketTime())%></p>
							</div>
						</div>
					</div>
				<% if (i % 3 == 2 || i == resultList.size() - 1) { %>
				</div>
				<% } %>
				<%-- end row --%>
				<% } %>
				<%-- end for --%>

				<div class="row">
					<div class="col-12">
						<form
							action="<%=Common.getUrl(Common.RESERVATION, Common.ORDER)%>"
							method="post">
							<input type="hidden" value="${seatId}" id="seatId" name="seatId" />
							<input type="hidden" value="<%=resultList.get(0).getTicketId()%>" 
								id="ticketId" name="ticketId" />
							<input type="submit" class="btn btn-cyan-700 w-100 mb-3 fs-20" value="구매" />
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<a href="<%=Common.getUrl(Common.RESERVATION, Common.LIST)%>"
							class="btn btn-cancel w-100 fs-20">취소</a>
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
			$('.col-auto').click(
				function() {
					// 클릭된 .col 내부의 input[type=hidden]의 값을 가져옴
					let ticketId = $(this).find('input[type=hidden]').val();

					// 그 값을 #ticketId의 value로 설정
					$('#ticketId').val(ticketId);

					// 기존 선택된 카드들 클래스 삭제: btn-cyan-700-55
					$('.card.btn-cyan-700-55').removeClass('btn-cyan-700-55');
					// 현재 클릭된 카드에 클래스 추가: btn-cyan-700-55
					$(this).find('.card').addClass('btn-cyan-700-55');
				});
		});
	</script>

</body>
</html>