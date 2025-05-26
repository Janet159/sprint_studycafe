<%@page import="DTO.Notice"%>
<%@page import="Config.Common"%>
<%@page import="DTO.Reservation"%>
<%@page import="java.util.List"%>
<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>고객센터</title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="<%= root%>/allcss/list.css" rel="stylesheet">
	<style>
	body {
		padding-bottom: 100px;
	 }
	</style></head>
<body>
	<% 
	//List<Notice> arrayList = Notice.getTestList();
	//request.setAttribute("arrayList" ,arrayList);
	List<Notice> arrayList = (List<Notice>) request.getAttribute("resultList");
	%>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	  <div class="border-box">
    <div class="title">고객센터</div>
    <div class="table-responsive">
      <table class="table">
        <div class="title2">공지사항</div>
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>등록일</th>
          </tr>
        </thead>
        <tbody>
     		<% 
		 for (int i = 0; i < arrayList.size(); i++){
				 Notice notice = arrayList.get(i); 
 			%>
			<tr>
				<td><%= notice.getNo() %></td>
			    <td><a href="<%= Common.getUrl(Common.NOTICE, Common.READ) %>?no=<%=notice.getNo()%>"><%= notice.getTitle() %></a></td>
			    <td><%= Common.getDateToString(notice.getCreatedAt()) %></td>
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
      
    <div class="btn-main">
   		<% if (role) { %>
			<a href="<%= Common.getUrl(Common.NOTICE, Common.INSERT) %>" class="btn btn-cyan-700">등록</a>
		<% } %> 
    <a href="<%=root %>" class="btn btn-cyan-700">메인</a>
    </div>
  </div>
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
<%-- 	<jsp:include page="/layout/script.jsp" /> --%>
</body>
</html>