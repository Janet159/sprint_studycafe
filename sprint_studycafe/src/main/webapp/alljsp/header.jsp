<%@ include file="/alljsp/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- [Contents] ######################################################### --%>
<main>
	<div class="container-1360 container header-container px-0"> 
		<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-1 border-bottom"> 
			<div class="col-md-3 mb-2 mb-md-0"> 
				<a href="<%= root %>" class="d-inline-flex link-body-emphasis"> 
					<img src="<%= root %>/img/스프린트 스터디 카페 남색.png" alt="로고" width="110" height="110">
				</a> 
			</div>
			<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0"> 
				<div class="back"></div>
				<li class = "position-relative">
					<a href="#" class="header-menu d-inline-block nav-link px-2 text-dark fs-5 fw-bold">좌석구매</a>
					<ul class="submenu list-unstyled">
						<li class="menu-item"><a href="" class="d-inline-block text-secondary">좌석구매</a></li>
						<li class="menu-item"><a href="" class="d-inline-block text-secondary">좌석현황</a></li>
					</ul>
				</li>
				<li class = "position-relative"><a href="#" class="header-menu d-inline-block nav-link px-2 text-cyan-700 ">고객센터</a>
					<ul class="submenu list-unstyled">
						<li class="menu-item"><a href="" class="d-inline-block text-secondary">공지사항</a></li>
						<li class="menu-item"><a href="" class="d-inline-block text-secondary">문의사항</a></li>
					</ul>
				</li> 
				<li class = "position-relative"><a href="#" class="header-menu d-inline-block nav-link px-2 link-secondary ">이용권 구매</a>
					<!-- <ul class="submenu list-unstyled">
						<li class="menu-item"><a href="">서브메뉴1</a></li>
						<li class="menu-item"><a href="">서브메뉴2</a></li>
						<li class="menu-item"><a href="">서브메뉴3</a></li>
						<li class="menu-item"><a href="">서브메뉴4</a></li>
					</ul> -->
				</li> 
				<li class = "position-relative"><a href="#" class="header-menu d-inline-block nav-link px-2 link-secondary ">회사소개</a>
					<ul class="submenu list-unstyled">
						<li class="menu-item"><a href="" class="d-inline-block text-secondary">회사소개</a></li>
						<li class="menu-item"><a href="" class="d-inline-block text-secondary">방문위치</a></li>
					</ul>
				</li> 
				<li class = "position-relative"><a href="#" class="header-menu d-inline-block nav-link px-2 link-secondary ">편의시설</a>
					<!-- <ul class="submenu list-unstyled">
						<li class="menu-item"><a href="">서브메뉴1</a></li>
						<li class="menu-item"><a href="">서브메뉴2</a></li>
						<li class="menu-item"><a href="">서브메뉴3</a></li>
						<li class="menu-item"><a href="">서브메뉴4</a></li>
					</ul> -->
				</li> 
			</ul> 
			<div class="col-md-3 text-end"> 
				<button type="button" class="btn btn-outline-primary me-2 btn-cyan-700-55 fw-semibold">로그인</button> 
				<button type="button" class="btn btn-primary btn-cyan-700 fw-semibold">회원가입</button>
			</div> 
		</header> 
	</div> 
</main>