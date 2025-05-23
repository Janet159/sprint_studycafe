<%@page import="Config.Common"%>
<%@page import="DTO.Users"%>
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
     .title{ font-size: 24px; margin-bottom: 40px;
    }
     .table thead th {
	 color: #5ecbe1;
	}  
    </style>
</head>
<body>
    <% 
      List<Users> arrayList = Users.getTestList();
      
      request.setAttribute("arrayList" ,arrayList);
    %>
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
				<% 
				    for (int i = 0; i < arrayList.size(); i++){
				    	Users users = arrayList.get(i);
				%>
				<tr>
					<td><%= users.getName() %></td>
				    <td><%= users.getUserId() %></td>
				 	<td><%= users.isAdmin_kbn() %></td>
					<td><%= users.getEmail() %></td>
					<td><%= Common.getDateToString(users.getCreatedAt()) %></td>
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
<%-- 	<jsp:include page="/layout/script.jsp" /> --%>
</body>
</html>