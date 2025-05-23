<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>
<%@ include file="/alljsp/jstl.jsp" %>
<%@ page import="Config.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>회원 가입</title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="join.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	  <div class="border-box">
    <div class="logo-wrapper">
      <img src="<%= root%>/img/스프린트 스터디 카페 남색.png" class="logo" alt="SPRINT Logo"/>
    </div>

    <div class="title">회원가입</div>

    <div class="form-box border-gray mt-5 mb-10">
      <form>
        <div class="mb-3 row align-items-center">
          <label class="col-3 col-form-label">아이디</label>
          <div class="col-9 d-flex">
            <input type="text" class="form-control me-2" />
            <button class="btn btn-check-id btn-cyan-700">중복확인</button>
          </div>
        </div>

        <div class="mb-3 row align-items-center">
          <label class="col-3 col-form-label">비밀번호</label>
          <div class="col-9">
            <input type="password" class="form-control" />
          </div>
        </div>

        <div class="mb-3 row align-items-center">
          <label class="col-3 col-form-label">비밀번호 확인</label>
          <div class="col-9">
            <input type="password" class="form-control" />
          </div>
        </div>

        <div class="mb-3 row align-items-center">
          <label class="col-3 col-form-label">이름</label>
          <div class="col-9">
            <input type="text" class="form-control" />
          </div>
        </div>

        <div class="mb-4 row align-items-center">
          <label class="col-3 col-form-label">이메일</label>
          <div class="col-9">
            <input type="email" class="form-control" />
          </div>
        </div>

        <div class="d-grid gap-2">
          <button type="submit" class="btn btn-signup btn-cyan-700">가입</button>
          <button type="button" class="btn btn-cancel">취소</button>
        </div>
      </form>
    </div>
  </div>
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>