<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>

<%@ page import="Config.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%= Common.TITLE %></title>
	<jsp:include page="/alljsp/link.jsp" />
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

		String emptySeat1 = "선택 가능" ;
		String emptySeat2 = "" ;

		
		
		if (role) {
			// 관리자
			title = "좌석 현황" ;
			emptySeat1 = "빈 좌석" ;
			emptySeat2 = "선택 가능한 좌석입니다.<br>" ;
			usingSeat2 = "" ;
			usingSeat3 = "" ;
		} else {
			// 사용자
			title = "좌석 선택" ;
			emptySeat1 = "선택 가능" ;
			emptySeat2 = "비어 있는  좌석입니다." ;
			usingSeat2 = "현재 사용 중인 좌석입니다." ;
			usingSeat3 = " 이후 선택 가능합니다." ;
		}

		//Resevation;
	%>

	<main>
	<div class="container mt-5">
		<h2 class="mb-4 text-center"><%= title %> </h2>

		<div class="container text-center">
			<div class="row">
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card text-bg-info mb-3" style="max-width: 18rem;">
			<div class="card-header">A-01</div>
			<div class="card-body">
				<h5 class="card-title"><%= usingSeat1 %></h5>
				<p class="card-text"><%= usingSeat2 %><br>18:00<%= usingSeat3 %></p>
			</div>
		</div>
		</a>
				</div>
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card border-info mb-3" style="max-width: 18rem;">
			<div class="card-header">A-02</div>
			<div class="card-body">
				<h5 class="card-title"><%= emptySeat1 %></h5>
				<p class="card-text">선택 가능한 좌석입니다.</p>
			</div>
		</div>
		</a>
				</div>
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card text-bg-info mb-3" style="max-width: 18rem;">
			<div class="card-header">A-03</div>
			<div class="card-body">
				<h5 class="card-title"><%= usingSeat1 %></h5>
				<p class="card-text"><%= usingSeat2 %><br>18:00<%= usingSeat3 %></p>
			</div>
		</div>
		</a>
				</div>
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card text-bg-info mb-3" style="max-width: 18rem;">
			<div class="card-header">A-04</div>
			<div class="card-body">
				<h5 class="card-title"><%= usingSeat1 %></h5>
				<p class="card-text"><%= usingSeat2 %><br>18:00<%= usingSeat3 %></p>
			</div>
		</div>
		</a>
				</div>
			</div>
			<%-- end row --%>
			<div class="row">
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card text-bg-info mb-3" style="max-width: 18rem;">
			<div class="card-header">B-01</div>
			<div class="card-body">
				<h5 class="card-title"><%= usingSeat1 %></h5>
				<p class="card-text"><%= usingSeat2 %><br>18:00<%= usingSeat3 %></p>
			</div>
		</div>
		</a>
				</div>
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card text-bg-info mb-3" style="max-width: 18rem;">
			<div class="card-header">B-02</div>
			<div class="card-body">
				<h5 class="card-title"><%= usingSeat1 %></h5>
				<p class="card-text"><%= usingSeat2 %><br>18:00<%= usingSeat3 %></p>
			</div>
		</div>
		</a>
				</div>
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card border-info mb-3" style="max-width: 18rem;">
			<div class="card-header">B-03</div>
			<div class="card-body">
				<h5 class="card-title"><%= emptySeat1 %></h5>
				<p class="card-text">선택 가능한 좌석입니다.<br> </p>
			</div>
		</div>
		</a>
				</div>
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card border-info mb-3" style="max-width: 18rem;">
			<div class="card-header">B-04</div>
			<div class="card-body">
				<h5 class="card-title"><%= emptySeat1 %></h5>
				<p class="card-text">선택 가능한 좌석입니다.</p>
			</div>
		</div>
		</a>
				</div>
			</div>
			<%-- end row --%>
			<div class="row">
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card border-info mb-3" style="max-width: 18rem;">
			<div class="card-header">C-01</div>
			<div class="card-body">
				<h5 class="card-title"><%= emptySeat1 %></h5>
				<p class="card-text">비어 있는 좌석입니다.<br>11:50 ~ 15:00</p>
			</div>
		</div>
		</a>
				</div>
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card text-bg-info mb-3" style="max-width: 18rem;">
			<div class="card-header">C-02</div>
			<div class="card-body">
				<h5 class="card-title">사용 중</h5>
				<p class="card-text">joeun05 : 참조은<br>11:50 ~ 15:00</p>
			</div>
		</div>
		</a>
				</div>       
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card border-info mb-3" style="max-width: 18rem;">
			<div class="card-header">C-03</div>
			<div class="card-body">
				<h5 class="card-title"><%= emptySeat1 %></h5>
				<p class="card-text">비어 있는 좌석입니다.<br>&nbsp;</p>
			</div>
		</div>
		</a>
				</div>
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card border-info mb-3" style="max-width: 18rem;">
			<div class="card-header">C-04</div>
			<div class="card-body">
				<h5 class="card-title"><%= emptySeat1 %></h5>
				<p class="card-text">비어 있는 좌석입니다.</p>
			</div>
		</div>
		</a>
				</div>
			</div>
			<%-- end row --%>
			<div class="row">
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card border-info mb-3" style="max-width: 18rem;">
			<div class="card-header">D-01</div>
			<div class="card-body">
				<h5 class="card-title"><%= emptySeat1 %></h5>
				<p class="card-text">비어 있는 좌석입니다.</p>
			</div>
		</div>
		</a>
				</div>
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card border-info mb-3" style="max-width: 18rem;">
			<div class="card-header">D-02</div>
			<div class="card-body">
				<h5 class="card-title"><%= emptySeat1 %></h5>
				<p class="card-text">비어 있는 좌석입니다.</p>
				<P></P>
			</div>
		</div>
		</a>
				</div>
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card border-info mb-3" style="max-width: 18rem;">
			<div class="card-header">D-03</div>
			<div class="card-body">
				<h5 class="card-title"><%= emptySeat1 %></h5>
				<p class="card-text">비어 있는 좌석입니다.</p>
			</div>
		</div>
		</a>
				</div>
				<div class="col">
		<a href="/order?seatsId=no">
		<div class="card border-info mb-3" style="max-width: 18rem;">
			<div class="card-header">D-04</div>
			<div class="card-body">
				<h5 class="card-title"><%= emptySeat1 %></h5>
				<p class="card-text">비어 있는 좌석입니다.</p>
			</div> 
		</div>
		</a>
				</div>
			</div> 
			<%-- end row --%>
		</div>
		<%-- end container --%>

	</div>
	</main>

	<%-- [Contents] ######################################################### --%>

	<!-- footer 포함하기 -->
	<jsp:include page="/alljsp/footer.jsp" />

</body>
</html>