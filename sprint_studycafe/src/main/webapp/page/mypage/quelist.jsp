<%@page import="Config.Common"%>
<%@page import="DTO.Notice"%>
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
</head>
<body>
	<% 
	List<Notice> arrayList = Notice.getTestList();
	
	request.setAttribute("arrayList" ,arrayList);
	%>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	  <div class="border-box">
    <div class="title">마이페이지</div>
    <div class="table-responsive">
      <table class="table">
        <div class="title2">나의 문의내역</div>
        <thead>
          <tr>
            <th>번호</th>
            <th>구분</th>
            <th>제목</th>
            <th>등록일</th>
          </tr>
        </thead>
        <tbody>
			<% 
			 for (int i = 0; i < arrayList.size(); i++){
				 Notice question = arrayList.get(i);
			%>
			<tr>
				<td><%= question.getNo() %></td>
			    <td><%= question.getTypeNo() %></td>
			    <td><%= question.getTitle() %></td>
				<td><%= Common.getDateToString(question.getCreatedAt()) %></td>
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