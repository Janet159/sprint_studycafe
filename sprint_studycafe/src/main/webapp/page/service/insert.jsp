<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>

<%@ page import="java.util.List"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Type"%>
<%@ page import="DTO.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<title><%= Common.TITLE %></title>
	<jsp:include page="/alljsp/link.jsp" />
</head>

<body>
	<%
		//List<Type> typeList = Type.getTestList();
		//request.setAttribute("typeList" ,typeList);
	%>
	<!-- header 포함하기 -->
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main>
		<div class="container">
			<div class="px-4 pt-5 my-5 text-center border-bottom">
				<h2 class="mb-4">편의 시설 등록</h2>
			</div>

			<form action="<%= Common.getUrl(Common.SERVICE, Common.INSERT) %>" method="post">

<div class="d-flex flex-column mb-3">
	<div class="p-2">
		<div class="input-group mb-3">
			<span class="input-group-text" id="inputGroup-sizing-default">구분</span>
			<c:forEach var="type" items="${typeList}" varStatus="index">
				<div class="form-check">
				<c:choose>
				    <c:when test="${index.first}">
				        <input class="form-check-input" type="radio" name="typeNo" id="type${index.index}" value="${type.no}" checked>
				    </c:when>
				    <c:otherwise>
				        <input class="form-check-input" type="radio" name="typeNo" id="type${index.index}" value="${type.no}">
				    </c:otherwise>
				</c:choose>
				<label class="form-check-label" for="type${index.index}">${type.typeName}</label>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="p-2">
		<div class="input-group mb-3">
			<span class="input-group-text" id="inputGroup-sizing-default">종류</span>
			<input type="text" class="form-control" aria-label="Sizing example input" name="serviceId"
				aria-describedby="inputGroup-sizing-default">
		</div>
	</div>
	<div class="p-2">
		<div class="input-group mb-3">
			<span class="input-group-text" id="inputGroup-sizing-default">위치</span>
			<input type="text" class="form-control" aria-label="Sizing example input" name="location"
				aria-describedby="inputGroup-sizing-default">
		</div>
	</div>
	<div class="p-2">
		<div class="input-group mb-3">
			<input type="submit" class="btn btn-cyan-700 w-100 mb-3" value="등록" />
		</div>
	</div> 
</div>

			</form>
		</div>
	</main>

	<%-- [Contents] ######################################################### --%>

	<!-- footer 포함하기 -->
	<jsp:include page="/alljsp/footer.jsp" />

	<!-- script 포함하기 -->

</body>
</html>