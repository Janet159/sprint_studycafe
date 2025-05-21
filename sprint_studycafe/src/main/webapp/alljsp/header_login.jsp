<%-- <%@ include file="/layout/jstl.jsp" --%> 
<%@ include file="common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>project💻 - ALOHA CLASS🌴</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <link rel="stylesheet" href="../allcss/header.css">
    <link rel="stylesheet" href="../allcss/all.css">
    <link rel="stylesheet" href="../allcss/reset.css">
    <script src="<%=root %>/alljs/jquery-3.7.1.min.js"></script>
    <script src="<%=root %>/alljs/header.js"></script>
<%-- 	<jsp:include page="/layout/meta.jsp" />
</head>
<body>
	<%-- [Contents] ######################################################### --%>
	<main>
        <div class="container-1360 container header-container px-0"> 
            <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-1 border-bottom"> 
                <div class="col-md-3 mb-2 mb-md-0"> 
                    <a href="/" class="d-inline-flex link-body-emphasis"> 
                        <img src="<%=root %>/img/스프린트 스터디 카페 남색.png" alt="로고" width="110" height="110">
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
                    <div class="login-after d-flex col-md-3 text-end me-0 justify-content-end"> 
                        <!-- <button type="button" class="btn btn-outline-primary me-2 btn-cyan-700-55 fw-semibold">마이페이지</button>  -->
                        <div class="dropdown">
                        <button class="btn btn-outline-primary me-2 btn-cyan-700-55 fw-semibold dropdown-toggle" 
                                type="button" 
                                data-bs-toggle="dropdown" 
                                aria-expanded="false">
                            마이페이지
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item d-block px-2 text-start" href="#">회원정보</a></li>
                            <li><a class="dropdown-item d-block px-2 text-start" href="#">좌석정보</a></li>
                            <li><a class="dropdown-item d-block px-2 text-start" href="#">문의내역</a></li>
                            <li><a class="dropdown-item d-block px-2 text-start" href="#">구매내역</a></li>
                            <li><a class="dropdown-item d-block px-2 text-start" href="#">좌석현황</a></li>
                            <li><a class="dropdown-item d-block px-2 text-start" href="#">회원목록</a></li>
                        </ul>
                        </div>

                        <button type="button" class="btn btn btn-primary btn-red fw-semibold">로그아웃</button> 
                    </div> 
                </header> 
            </div> 
    </main>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>		
	
	<%-- [Contents] ######################################################### --%>
<%-- 	<jsp:include page="/layout/script.jsp" /> --%>
</body>
</html>