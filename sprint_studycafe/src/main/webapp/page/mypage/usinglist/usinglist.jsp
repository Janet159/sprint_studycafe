<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>마이페이지</title>
	<jsp:include page="/alljsp/link.jsp" />
    <link href="usinglist.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	  <div class="border-box">
    <div class="title">실시간 사용현황</div>

    <div class="table-responsive">
      <table class="table">
        <colgroup>
            <col style="width: 25%;">
            <col style="width: 25%;">
            <col style="width: 25%;">
            <col style="width: 25%;">
          </colgroup>
        <thead>
          <tr>
            <th>이름</th>
            <th>아이디</th>
            <th>좌석번호</th>
            <th>이용시간</th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
    </div>

    <button class="btn btn-main">메인</button>
  </div>
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
<%-- 	<jsp:include page="/alljsp/script.jsp" /> --%>
</body>
</html>