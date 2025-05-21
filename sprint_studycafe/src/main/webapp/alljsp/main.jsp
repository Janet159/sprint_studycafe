<%-- <%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>project💻 - ALOHA CLASS🌴</title>
	<link rel="stylesheet" href="../allcss/main.css">
    <link rel="stylesheet" href="../allcss/all.css">
</head>
<%-- <jsp:include page="/layout/meta.jsp" /> --%>

</head>
<body>
	<jsp:include page="header.jsp" />
	<%-- [Contents] ######################################################### --%>
    <main>
    <div class="main-container d-flex flex-column align-items-center w-100">
        <img src="../img/스프린트 스터디 카페 메인페이지.png" class="main-img img-fluid">
        <img src="../img/메인페이지 집중하는 사람들.png" class="main-img img-fluid">
        <img src="../img/메인페이지 좌석.png" class="main-img img-fluid">
    </div>
    </main>
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="footer.jsp" />
<%-- 	<jsp:include page="/layout/script.jsp" /> --%>
</body>
</html>