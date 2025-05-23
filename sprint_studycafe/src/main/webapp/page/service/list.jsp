<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>

<%@ page import="java.util.List"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%= Common.TITLE %></title>
	<jsp:include page="/alljsp/link.jsp" />
</head>
<body>
	<% 
		role = true; 
		// List<Service> serviceList = Service.getTestList();
		// request.setAttribute("serviceList" ,serviceList);
	%>
	<%-- header 포함하기 --%>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
	<main>
		<div class="container">
			<div class="px-4 pt-5 my-5 text-center border-bottom">
				<h2 class="mb-4 text-center">편의 시설 및 구비 용품</h2>
			</div>
			
			<%-- 게시판 테이블 --%>
	
			<table class="table table-hover">
				<thead class="table-dark">
					<tr class="text-center">
						<th scope="col">번호</th>
						<th scope="col">구분</th>
						<th scope="col">종류</th>
						<th scope="col">위치</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${resultList.isEmpty()}">
	            		<tr>
	            			<td align="center" colspan="4">조회된 데이터가 없습니다.</td>
	            		</tr>
	            	</c:if>
					<c:forEach var="service" items="${resultList}">
	                    <tr class="text-center">
	                    <% if (role) { %>
	                    	<td><a href="<%= Common.getUrl(Common.SERVICE, Common.UPDATE) %>?no=${service.no}">${service.no}</a></td>
	                    	<td><a href="<%= Common.getUrl(Common.SERVICE, Common.UPDATE) %>?no=${service.no}">${service.typeNo}</a></td>
	                    	<td><a href="<%= Common.getUrl(Common.SERVICE, Common.UPDATE) %>?no=${service.no}">${service.serviceId}</a></td>
	                    	<td><a href="<%= Common.getUrl(Common.SERVICE, Common.UPDATE) %>?no=${service.no}">${service.location}</a></td>
	                    <%  } else { %>
	                    	<td>${service.no}</td>
	                    	<td>${service.typeNo}</td>
	                    	<td>${service.serviceId}</td>
	                    	<td>${service.location}</td>
	                    <%  } %>
	                    </tr>
	                </c:forEach>
				</tbody>
			</table>
	
			<% if (role) { %>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-end mb-5">
				<a href="<%= Common.getUrl(Common.SERVICE, Common.INSERT) %>" class="btn btn-cyan-700 btn-lg px-4 me-sm-3">등록</a>
			</div>
			<% } %>
			
		</div>
	</main>	

	<%-- [Contents] ######################################################### --%>

	<!-- footer 포함하기 -->
	<jsp:include page="/alljsp/footer.jsp" />

	<!-- script 포함하기 -->

</body>
</html>