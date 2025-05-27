<%@ include file="/alljsp/common.jsp" %>
<%@ page import="Config.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%= Common.TITLE %></title>
	<jsp:include page="/alljsp/link.jsp" />
	<link rel="stylesheet" href="<%= root %>/allcss/main.css">
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
    <main>
    <div class="main-container d-flex flex-column align-items-center w-100">
        <img src="<%= root %>/img/스프린트 스터디 카페 메인페이지.png" class="main-img img-fluid">
        <img src="<%= root %>/img/메인페이지 집중하는 사람들.png" class="main-img img-fluid">
        <img src="<%= root %>/img/메인페이지 좌석.png" class="main-img img-fluid">
    </div>
    </main>
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>