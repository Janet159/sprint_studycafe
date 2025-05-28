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
                <div class="gallery pb-6">
                    <h1 class="text-center fs-50 text-cyan-700 fw-bold my-3">내부 시설</h1>
                    <p class="fz-normal text-center fs-30 text-muted my-2">
                        스터디카페 전경
                    </p>
                <!-- 카드 디자인 레이아웃 -->
				<div class="d-flex align-items-start gap-5">
				    <!-- 2. 중간 + 작은 카드 2개 (세로 방향) -->
				    <div class="d-flex flex-column gap-5">
				        <div class="d-flex justify-content-center align-items-center m-img card flex-grow-1">
				            <a href="#"><img src="<%= root %>/img/스스갤러리1.png" alt="new2" class="img-fluid"></a>
				        </div>
				
				        <div class="d-flex justify-content-between align-items-center gap-5">
				            <div class="d-flex justify-content-center align-items-center s-img card flex-grow-1">
				                <a href="#" class="d-flex flex-column justify-content-center align-items-center gap-3">
				                    <img src="<%= root %>/img/스스갤러리3.png" alt="10" class="img-fluid">
				                </a>
				            </div>
				            <div class="d-flex justify-content-center align-items-center s-img card flex-grow-1">
				                <a href="#" class="d-flex flex-column justify-content-center align-items-center gap-3">
				                    <img src="<%= root %>/img/스스갤러리4.png" alt="20" class="img-fluid">
				                </a>
				            </div>
				        </div>
				    </div>
				
				    <!-- 3. 중간 + 작은 카드 2개 (세로 방향) -->
				    <div class="d-flex flex-column gap-5">
				        <div class="d-flex justify-content-center align-items-center m-img card flex-grow-1">
				            <a href="#"><img src="<%= root %>/img/스스갤러리2.png" alt="new3" class="img-fluid"></a>
				        </div>
				
				        <div class="d-flex justify-content-between align-items-center gap-5">
				            <div class="d-flex justify-content-center align-items-center s-img card flex-grow-1">
				                <a href="#" class="d-flex flex-column justify-content-center align-items-center gap-3">
				                    <img src="<%= root %>/img/스스갤러리5.png" alt="30" class="img-fluid">
				                </a>
				            </div>
				            <div class="d-flex justify-content-center align-items-center s-img card flex-grow-1">
				                <a href="#" class="d-flex flex-column justify-content-center align-items-center gap-3">
				                    <img src="<%= root %>/img/스스갤러리6.png" alt="40" class="img-fluid">
				                </a>
				            </div>
				        </div>
				    </div>
				
				</div>

                </div>
                <div class="position-relative text-center">
		        <img src="<%= root %>/img/메인페이지 집중하는 사람들.png" class="main-img img-fluid">
		          <div class="position-absolute top-50 start-50 translate-middle text-cyan-55 fw-bold fs-35 text-shadow">
				    집중이 잘되는 분위기와 조명
				  </div>
				 </div>
                <div class="position-relative text-center">
		        <img src="<%= root %>/img/메인페이지 좌석.png" class="main-img img-fluid">
		          <div class="position-absolute top-50 start-50 translate-middle text-cyan-55 fw-bold fs-35 text-shadow">
				    쾌적한 공부 환경
				  </div>
			  	</div>
		    </div>
	    </div>
    </main>
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>