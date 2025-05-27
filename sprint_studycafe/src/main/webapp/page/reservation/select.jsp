<%@ include file="/alljsp/common.jsp"%>

<%@ page import="Config.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%=Common.TITLE%></title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="<%=root%>/allcss/read.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main class="main-1920">
		<div class="container-1360">
			<div class="title-area">결제가 완료되었습니다.</div>
			<div
				class="mx-auto py-7 mb-10 rounded gap-40 d-flex flex-column align-items-center">

				<div class="info-item-area mb-3 row">
					<label class="col-4 col-form-label text-center fs-20">결제 일시</label>
					<div class="col-8 info-box">${dto.orderTime}</div>
				</div>

				<div class="info-item-area mb-3 row">
					<label class="col-4 col-form-label text-center fs-20">좌석 번호</label>
					<div class="col-8 info-box">${dto.seatName}</div>
				</div>

				<div class="info-item-area mb-3 row">
					<label class="col-4 col-form-label text-center fs-20">선택 시간</label>
					<div class="col-8 info-box">${dto.ticketName}</div>
				</div>

				<div class="info-item-area mb-3 row">
					<label class="col-4 col-form-label text-center fs-20">이용 시작 시간</label>
					<div class="col-8 info-box">${dto.startTime}</div>
				</div>

				<div class="info-item-area mb-4 row">
					<label class="col-4 col-form-label text-center fs-20">이용 종료 예정 시간</label>
					<div class="col-8 info-box">${dto.endTime}</div>
				</div>

				<a href="<%=Common.getUrl(Common.RESERVATION)%>" class="btn btn-cyan-700 ok-btn fs-20" >확인</a>

			</div>
		</div>
	</main>


	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>