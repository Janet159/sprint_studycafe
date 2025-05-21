<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>고객센터</title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="고객센터2.css" rel="stylesheet">
</head>
<body>
    <% 
      List<Board> boardList = Board.getTestList();
      
      request.setAttribute("boardList" ,boardList);
    %>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	  <div class="border-box">
    <div class="title">고객센터</div> 
   <div class="table-responsive">
      <table class="table">
        <div class="title2 text-cyan-700">문의사항</div>
        <thead>
          <tr>
            <th>번호</th>
            <th>답변</th>
            <th>구분</th>
            <th>제목</th>
            <th>등록일</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${boardList}">
         <tr>
         	<td>${board.no}</td>
         	<td>${board.isAnswered}</td>
         	<td>${board.typeNo}</td>
         	<td>${board.title}</td>
         	<td>${board.createdAt}</td>
         </tr>
         </c:forEach>
          <tr><td colspan="5">&nbsp;</td></tr>
          <tr><td colspan="5">&nbsp;</td></tr>
          <tr><td colspan="5">&nbsp;</td></tr>
          <tr><td colspan="5">&nbsp;</td></tr>
          <tr><td colspan="5">&nbsp;</td></tr>
          <tr><td colspan="5">&nbsp;</td></tr>
          <tr><td colspan="5">&nbsp;</td></tr>
          <tr><td colspan="5">&nbsp;</td></tr>
          <tr><td colspan="5">&nbsp;</td></tr>
        </tbody>
      </table>
    </div>
    <button class="btn btn-main text-cyan-700">메인</button>

    <div class="pagination">
        <span>1</span>
        <span>2</span>
        <span>3</span>
        <span>4</span>
        <span>5</span>
        <span>6</span>
        <span>7</span>
        <span>8</span>
        <span>9</span>
        <span>10</span>
      </div>
</div>
   
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
<%-- 	<jsp:include page="/layout/script.jsp" /> --%>
</body>
</html>