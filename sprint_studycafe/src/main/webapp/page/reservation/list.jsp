<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%= Common.TITLE %></title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="<%=root%>/allcss/list.css" rel="stylesheet">
</head>
<body>
	

	<!-- header 포함하기 -->
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
	<%
		String title = "" ;		
		String usingSeat1 = "사용중" ;
		String usingSeat2 = "" ;
		String usingSeat3 = "" ;
		
		String emptySeat1 = "" ;
		String emptySeat2 = "" ;
		String emptySeat3 = "" ;
		
		if (role) {
			// 관리자
			title = "좌석 현황" ;
			emptySeat1 = "빈 좌석" ;
			emptySeat2 = "비어 있는  좌석입니다.<br>" ;
			usingSeat2 = "" ;
			usingSeat3 = "" ;
		} else {
			// 사용자
			title = "좌석 선택" ;
			emptySeat1 = "선택 가능" ;
			emptySeat2 = "선택 가능한 좌석입니다.<br>" ;
			usingSeat2 = "현재 사용 중인 좌석입니다." ;
			usingSeat3 = " 후 선택 가능합니다." ;
		}

		Object att = request.getAttribute("resultList") ;
		List<Reservation> arrList ;
		if (att != null ) {
			arrList = (List<Reservation>) request.getAttribute("resultList");
		} else {
			arrList = new ArrayList<Reservation>();
		}
	%>

	<main>
	<div class="container mt-5 mb-10">
		<div class="title-area"><%= title %></div>

		<div class="container text-center">
		
		<% 
			for (int i = 0 ; i < arrList.size() ; i++ ) {
				Reservation seat = arrList.get(i);
		%>
		
			<% if (i % 4 == 0) { %>
			<div class="row justify-content-center">
			<% } %>
				<div class="col-3">
					<% 
					if (null == seat.getUserId() || seat.getUserId().isEmpty()) {
					// 빈 좌석일때
					%>
					<% if (!role) { /* 사용자 일 때*/ %>
					<a href="<%= Common.getUrl(Common.RESERVATION, Common.ORDER) %>?seatId=<%= seat.getSeatId() %>">
					<% } %>
					<div class="card btn-cyan-700-55 mb-3" style="max-width: 18rem;">
						<div class="card-header"><%= seat.getSeatName() %></div>
						<div class="card-body">
							<h5 class="card-title"><%= emptySeat1 %></h5>
							<p class="card-text"><%= emptySeat2 %><br></p>							
						</div>
					</div>
					<% if (!role) { /* 사용자 일 때*/ %>
					</a>
					<% } %>
					<% 
					} else {
					// 사용 중 일때
					%>
					<div class="card mb-3" style="max-width: 18rem;">
						<div class="card-header"><%= seat.getSeatName() %></div>
						<div class="card-body">
							<h5 class="card-title"><%= usingSeat1 %></h5>
							<% if (role) { /* 관리자 일 때*/ %>
							<p class="card-text"><%= seat.getUserId() %> : <%= seat.getUserName() %><br>
								 <%= Common.getHourMinuteFromDate(seat.getStartTime()) %> ~ <%= Common.getHourMinuteFromDate(seat.getEndTime()) %></p>
							<% } else { /* 사용자 일 때 */ %>
							<p class="card-text"><%= usingSeat2 %><br>
								<%= Common.getRemainingTime(seat.getEndTime())%><%= usingSeat3 %></p>
							<% } %>
						</div>
					</div>
					<% } %>
				</div>
			<% if (i % 4 == 3 || i == arrList.size() -1 ) { %>
			</div>
			<% } %>
			<%-- end row --%>
		
		<% } %>
			
		</div>
		<%-- end container --%>

	</div>
	</main>

	<%-- [Contents] ######################################################### --%>

	<!-- footer 포함하기 -->
	<jsp:include page="/alljsp/footer.jsp" />

</body>
</html>