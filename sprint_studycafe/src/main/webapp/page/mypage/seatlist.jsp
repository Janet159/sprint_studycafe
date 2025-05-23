<%@page import="DTO.Seats"%>
<%@page import="java.util.List"%>
<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>마이페이지</title>
	<jsp:include page="/alljsp/link.jsp" />
    <link href="<%= root%>/allcss/list.css" rel="stylesheet">
    <style>
    .table thead th {color: #5ecbe1;}
    </style>
</head>
<body>
    <% 
      List<Seats> arrayList = Seats.getTestList();
      
      request.setAttribute("arrayList" ,arrayList);
    %>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
		  <div class="border-box">
	    <div class="title">좌석현황</div>
	
	    <div class="table-responsive">
	    <table class="table">
<!-- 	      <colgroup> -->
<!-- 	          <col style="width: 25%;"> -->
<!-- 	          <col style="width: 25%;"> -->
<!-- 	          <col style="width: 25%;"> -->
<!-- 	          <col style="width: 25%;"> -->
<!-- 	       </colgroup> -->
	      <thead>
	        <tr>
	          <th>이름</th>
	          <th>아이디</th>
	          <th>이용여부</th>
<!-- 	          <th>이용시간</th> -->
	        </tr>
	      </thead>
	      <tbody>
         <% 
           	for (int i = 0; i < arrayList.size(); i++){
           		Seats seat = arrayList.get(i);
         %>
         <tr>
         	<td><%= seat.getSeatName()%></td>
         	<td><%= seat.getSeatId() %></td>
         	<td><%= seat.getUsingType() %></td>
<!--          	<td></td> -->
         </tr>
         <% } %>
	      </tbody>
	    </table>
	  </div>
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
	
	    <button class="btn btn-main">메인</button>
	  </div>
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
<%-- 	<jsp:include page="/alljsp/script.jsp" /> --%>
</body>
</html>