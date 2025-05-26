<%@ include file="/alljsp/common.jsp"%>
<%@ page import="Config.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%= Common.TITLE %></title>
	<jsp:include page="/alljsp/link.jsp" />
	<link rel="stylesheet" href="<%= root %>/allcss/read.css">
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	<main class="main-1920">
    <div class="container-1360">
        <div class="text-center my-6 fs-30 py-5">결제가 완료되었습니다.</div>
        <div class="payment-complete-box mx-auto py-7 mb-10 rounded gap-40 d-flex flex-column align-items-center">
            
            <div class="read-item mb-3 row">
                <label class="col-4 col-form-label text-center fs-20">결제 일시</label>
                <div class="col-8">
                    <div class="info-box">${dto.orderTime}</div>
                </div>
            </div>
            
            <div class="read-item mb-3 row">
                <label class="col-4 col-form-label text-center fs-20">좌석 번호</label>
                <div class="col-8">
                    <div class="info-box">${dto.seatName}</div>
                </div>
            </div>
            
            <div class="read-item mb-3 row">
                <label class="col-4 col-form-label text-center fs-20">선택 시간</label>
                <div class="col-8">
                    <div class="info-box">${dto.ticketName}</div>
                </div>
            </div>
            
            <div class="read-item mb-3 row">
                <label class="col-4 col-form-label text-center fs-20">이용 시작 시간</label>
                <div class="col-8">
                    <div class="info-box">${dto.startTime}</div>
                </div>
            </div>
            
            <div class="read-item mb-4 row">
                <label class="col-4 col-form-label text-center fs-20">이용 종료 예정 시간</label>
                <div class="col-8">
                    <div class="info-box">${dto.endTime}</div>
                </div>
            </div>
            
            
            <a href="<%= Common.getUrl(Common.RESERVATION) %>" class="ok-btn btn btn-cyan-700 fw-semibold ">확인</a>
            
        </div>
        </div>
    </main>
		
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>