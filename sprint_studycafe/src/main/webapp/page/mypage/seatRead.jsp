<%@ include file="/alljsp/common.jsp"%>

<%@ page import="Config.Common"%>
<%@ page import="DTO.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>   
	<title><%= Common.TITLE %></title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="<%= root %>/allcss/read.css" rel="stylesheet">
	<link href="<%=root%>/allcss/insert.css" rel="stylesheet">
</head>
<body>
	<%
		Object att = request.getAttribute("result") ;
		Reservation dto ;
		if (att != null ) {
			dto = (Reservation) request.getAttribute("result");
		} else {
			dto = new Reservation();
		}
	%>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
	<main class="main-1920">
	    <div class="container-1360 position-relative">
	
	        <div class="text-center fs-30 py-10 fw-bold border-bottom border-gray">마이페이지</div>
	        <div class="text-center my-6 fs-25 py-5 fw-bold">좌석정보</div>
	        
	        <div class="info-area mx-auto rounded pt-5 gap-20 d-flex flex-column align-items-center">
	            
	            <div class="info-item-area mb-3 row">
	                <label class="col-4 col-form-label text-center fs-20">좌석 번호</label>
	                <div class="col-8">
	                    <div class="info-box"><%= dto.getSeatName() %>&nbsp;</div>
	                </div>
	            </div>
	            
	            <div class="info-item-area mb-3 row">
	                <label class="col-4 col-form-label text-center fs-20">구매 가격</label>
	                <div class="col-8">
	                    <div class="info-box"><%= Common.getIntegerToString(dto.getTicketPrice()) %>원</div>
	                </div>
	            </div>
	            
	            <div class="info-item-area mb-3 row">
	                <label class="col-4 col-form-label text-center fs-20">구매 시간</label>
	                <div class="col-8">
	                    <div class="info-box"><%= Common.getDateToString(dto.getOrderTime()) %>&nbsp;</div>
	                </div>
	            </div>
	            
	            <div class="info-item-area mb-3 row">
	                <label class="col-4 col-form-label text-center fs-20">남은 시간</label>
	                <div class="col-8">
	                    <div class="info-box"><%= Common.getRemainingTime(dto.getEndTime()) %>&nbsp;</div>
	                </div>
	            </div>
	            
	        </div>
	    </div>
	        
	        <div class="content-area mx-auto mt-5 mb-10">
		        <div class="text-end">
		        <a href="<%= Common.getUrl() %>" class="btn btn-cyan-700 px-4">메인</a>
		        </div>
	        </div>
    </main>
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>