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
    <div class="main-1920 d-flex flex-column align-items-center w-100">
    <div class="container-1360">
		<!-- 슬라이드 섹션 -->
		<section id="carouselSlide" class="carousel slide my-5" data-bs-ride="carousel" data-bs-interval="2500">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
	    	<a href="<%= root %>/reservation/list.jsp">
		      <img src="<%= root %>/img/slide1.jpg" class="d-block" alt="슬라이드1">
		    </a>
		    </div>
		    <div class="carousel-item">
	    	<a href="<%= root %>/service/list.jsp">
		      <img src="<%= root %>/img/slide2.jpg" class="d-block" alt="슬라이드2">
		    </a>
		    </div>
		    <div class="carousel-item">
	    	<a href="<%= root %>/alljsp/introduce.jsp">
		      <img src="<%= root %>/img/slide3.jpg" class="d-block" alt="슬라이드3">
		    </a>
		    </div>
		  </div>
		  <!-- 이전 / 다음 버튼 -->
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselSlide" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselSlide" data-bs-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </button>
		</section>
        <img src="<%= root %>/img/스프린트 메인페이지 최종.png" class="main-img img-fluid">
        <img src="<%= root %>/img/메인페이지 집중하는 사람들.png" class="main-img img-fluid">
        <img src="<%= root %>/img/메인페이지 좌석.png" class="main-img img-fluid">
    </div>
    </div>
    </main>
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>