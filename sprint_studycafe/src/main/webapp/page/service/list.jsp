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
    <link href="<%= root%>/allcss/list.css" rel="stylesheet">
</head>
<body>
	<%-- header 포함하기 --%>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
	<main>
		<div class="title-area">편의 시설 및 구비 용품</div>

		<div class="list-area">

			<%-- 게시판 테이블 --%>
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr class="text-center">
							<th scope="col">번호</th>
							<th scope="col">구분</th>
							<th scope="col">종류</th>
							<th scope="col">위치</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty resultList}">
		            		<tr>
		            			<td align="center" colspan="4">조회된 데이터가 없습니다.</td>
		            		</tr>
		            	</c:if>
						<c:forEach var="service" items="${resultList}">
		                    <tr class="text-center">
		                    <% if (role) { %>
		                    	<td><a href="<%= Common.getUrl(Common.SERVICE, Common.UPDATE) %>?no=${service.no}">${service.no}</a></td>
		                    	<td><a href="<%= Common.getUrl(Common.SERVICE, Common.UPDATE) %>?no=${service.no}">${service.typeName}</a></td>
		                    	<td><a href="<%= Common.getUrl(Common.SERVICE, Common.UPDATE) %>?no=${service.no}">${service.serviceId}</a></td>
		                    	<td><a href="<%= Common.getUrl(Common.SERVICE, Common.UPDATE) %>?no=${service.no}">${service.location}</a></td>
		                    <%  } else { %>
		                    	<td>${service.no}</td>
		                    	<td>${service.typeName}</td>
		                    	<td>${service.serviceId}</td>
		                    	<td>${service.location}</td>
		                    <%  } %>
		                    </tr>
		                </c:forEach>
						<c:forEach var="i" begin="0" end="${10 - fn:length(resultList)}">
		                    <tr class="text-center">
		                    	<td colspan="4">&nbsp;</td>
		                    </tr>
		                </c:forEach>		                
					</tbody>
				</table>
			</div>
	
			<div class="pagination">
				<span><a href="">1</a></span>
			</div>

			<% if (role) { %>
			<div class="text-end">
				<a href="<%= Common.getUrl(Common.SERVICE, Common.INSERT) %>" class="btn btn-cyan-700">등록</a>
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