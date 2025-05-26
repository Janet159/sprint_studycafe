<%@ include file="/alljsp/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- [Contents] ######################################################### --%>
<!-- <main> -->
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
					<a href="<%= root %>/page/reservation/list.jsp" class="header-menu d-inline-block nav-link px-2 text-dark fs-5 fw-bold">좌석구매</a>
					<ul class="submenu list-unstyled">
						<li class="menu-item"><a href="<%= root %>/page/reservation/list.jsp" class="d-inline-block text-secondary">좌석구매</a></li>
						<li class="menu-item"><a href="<%= root %>/page/reservation/list.jsp" class="d-inline-block text-secondary">좌석현황</a></li>
					</ul>
				</li>
				<li class = "position-relative">
				<a href="<%= root %>/page/board/notice.jsp" class="header-menu d-inline-block nav-link px-2 text-cyan-700 ">고객센터</a>
					<ul class="submenu list-unstyled">
						<li class="menu-item"><a href="<%= root %>/page/board/notice.jsp" class="d-inline-block text-secondary">공지사항</a></li>
						<li class="menu-item"><a href="<%= root %>/board/list.jsp" class="d-inline-block text-secondary">문의사항</a></li>
					</ul>
				</li> 
				<li class = "position-relative">
				<a href="<%= root %>" class="header-menu d-inline-block nav-link px-2 link-secondary ">이용권 구매</a>
					<!-- <ul class="submenu list-unstyled">
						<li class="menu-item"><a href="">서브메뉴1</a></li>
						<li class="menu-item"><a href="">서브메뉴2</a></li>
						<li class="menu-item"><a href="">서브메뉴3</a></li>
						<li class="menu-item"><a href="">서브메뉴4</a></li>
					</ul> -->
				</li> 
				<li class = "position-relative">
				<a href="<%= root %>/alljsp/introduce.jsp" class="header-menu d-inline-block nav-link px-2 link-secondary ">회사소개</a>
					<ul class="submenu list-unstyled">
						<li class="menu-item"><a href="<%= root %>/alljsp/introduce.jsp" class="d-inline-block text-secondary">회사소개</a></li>
						<li class="menu-item"><a href="<%= root %>/alljsp/location.jsp" class="d-inline-block text-secondary">방문위치</a></li>
					</ul>
				</li> 
				<li class = "position-relative">
				<a href="<%= root %>/service/list.jsp" class="header-menu d-inline-block nav-link px-2 link-secondary ">편의시설</a>
					<!-- <ul class="submenu list-unstyled">
						<li class="menu-item"><a href="">서브메뉴1</a></li>
						<li class="menu-item"><a href="">서브메뉴2</a></li>
						<li class="menu-item"><a href="">서브메뉴3</a></li>
						<li class="menu-item"><a href="">서브메뉴4</a></li>
					</ul> -->
				</li> 
			</ul>
	       	<%
			if( loginId == null || loginId.equals("") ) { 
			%>
			<!-- 비로그인 시 -->
			<div class="col-md-3 text-end"> 
				<a href="<%= root %>/page/users/login.jsp" class="btn btn-outline-primary me-2 btn-cyan-700-55 fw-semibold">로그인</a>
				<a href="<%= root %>/page/users/join.jsp" class="btn btn-outline-primary me-2 btn-cyan-700 fw-semibold">회원가입</a>
			</div>
	        <%
			}
        	else {
        	%>
			<!-- 로그인 시 -->
              <div class="login-after d-flex col-md-3 text-end me-0 justify-content-end"> 
              <div class="dropdown">
              <button class="btn btn-outline-primary me-2 btn-cyan-700-55 fw-semibold dropdown-toggle" 
                      type="button" 
                      data-bs-toggle="dropdown" 
                      aria-expanded="false">
                  마이페이지
              </button>
              <ul class="dropdown-menu">
            	<% if (role) { %>
                  <li><a class="dropdown-item d-block px-2 text-start" href="<%= root %>/page/users/userread.jsp">회원정보</a></li>
                  <li><a class="dropdown-item d-block px-2 text-start" href="<%= root %>/page/mypage/seatlist.jsp">좌석현황</a></li>
                  <li><a class="dropdown-item d-block px-2 text-start" href="<%= root %>/users/userlist.jsp">회원목록</a></li>
	    	    <% } else{ %> 
                  <li><a class="dropdown-item d-block px-2 text-start" href="<%= root %>/page/users/userread.jsp">회원정보</a></li>
                  <li><a class="dropdown-item d-block px-2 text-start" href="<%= root %>/page/mypage/seatread.jsp">좌석정보</a></li>
                  <li><a class="dropdown-item d-block px-2 text-start" href="<%= root %>/page/mypage/quelist.jsp">문의내역</a></li>
                  <li><a class="dropdown-item d-block px-2 text-start" href="<%= root %>/page/mypage/buylist.jsp">구매내역</a></li>
	    	    <% } %> 
              </ul>
              </div>

              <a href="<%= root %>/users/logout" class="btn btn btn-primary btn-red fw-semibold">로그아웃</a>
          	</div>
    	    <%
        	}
        	%> 
		</header> 
	</div> 
<!-- </main> -->