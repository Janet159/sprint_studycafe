<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>마이페이지</title>
<%-- 	<jsp:include page="/layout/meta.jsp" /> --%>
<%-- 	<jsp:include page="/layout/link.jsp" /> --%>
    <link href="userlist.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	  <div class="border-box">
    
    <div class="title">
      <div class="d-flex justify-content-center">
        <div style="width: 60%; text-align: center;">회원목록</div>
      </div>
    </div>
  
    <div class="table-responsive">
      <table class="table">
        <colgroup>
          <col style="width: 20%;">
          <col style="width: 20%;">
          <col style="width: 20%;"> 
          <col style="width: 20%;">
          <col style="width: 20%;">
        </colgroup>
        <thead>
          <tr>
            <th>이름</th>
            <th>아이디</th>
            <th>권한</th>
            <th>이메일</th>
            <th>가입날짜</th>
          </tr>
        </thead>
        <tbody>
           <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tbody>
      </table>
    </div>

    
    <button class="btn btn-main">메인</button>
  </div>
	
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
<%-- 	<jsp:include page="/layout/script.jsp" /> --%>
</body>
</html>