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
<link href="<%=root%>/allcss/insert.css" rel="stylesheet">
</head>

<body>
	<!-- header 포함하기 -->
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main>
		<div class="title-area">편의 시설 등록</div>
		<div class="container">

			<form action="<%=Common.getUrl(Common.SERVICE, Common.INSERT)%>"
				method="post">

				<div class="content-area mx-auto mb-10">
					<%-- 구분 --%>
					<div class="row border-top border-bottom mb-3">
						<label class="col-2 col-form-label fw-bold">구분</label>
						<div class="col-10 d-flex align-items-center gap-3">
							<c:forEach var="type" items="${typeList}" varStatus="index">
								<div class="form-check">
									<c:choose>
										<c:when test="${index.first}">
											<input class="form-check-input" type="radio" name="typeNo"
												id="type${index.index}" value="${type.no}" checked>
										</c:when>
										<c:otherwise>
											<input class="form-check-input" type="radio" name="typeNo"
												id="type${index.index}" value="${type.no}">
										</c:otherwise>
									</c:choose>
									<label class="form-check-label" for="type${index.index}">${type.typeName}</label>
								</div>
							</c:forEach>
						</div>
					</div>

					<%-- 종류 --%>
					<div class="row border-bottom mb-3 pb-3">
						<label class="col-2 col-form-label fw-bold">종류</label>
						<div class="col-10">
							 <input type="text"
								class="form-control" name="serviceId" required>
						</div>
					</div>

					<%-- 위치 --%>
					<div class="row border-bottom mb-3 pb-3">
						<label class="col-2 col-form-label fw-bold">위치</label>
						<div class="col-10">
							 <input type="text"
								class="form-control" name="location" required>
						</div>
					</div>

					<%-- 버튼 --%>
					<div class="row border-bottom mt-5">
						<input type="submit" class="btn btn-cyan-700 w-100" value="등록" />
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