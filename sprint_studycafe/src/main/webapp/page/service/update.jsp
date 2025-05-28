<%@ include file="/alljsp/common.jsp"%>
<%@ include file="/alljsp/jstl.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Service"%>
<%@ page import="DTO.Type"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title><%=Common.TITLE%></title>
<jsp:include page="/alljsp/link.jsp" />
<link href="<%=root%>/allcss/insert.css" rel="stylesheet">
</head>
<body>

	<!-- header 포함하기 -->
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main>
		<h2 class="title-area">편의 시설 수정</h2>

		<div class="container">
			<div class="content-area mx-auto mb-10">

				<form action="<%=Common.getUrl(Common.SERVICE, Common.UPDATE)%>"
					method="post">

					<input type="hidden" name="no" value="${service.no}">

					<%-- 구분 --%>
					<div class="row border-top border-bottom mb-3">
						<label class="col-2 col-form-label fw-bold">구분</label>
						<div class="col-10 d-flex align-items-center gap-3">
							<c:forEach var="type" items="${typeList}" varStatus="index">
								<div class="form-check">
									<c:choose>
										<c:when test="${type.no == service.typeNo}">
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
							<input type="text" class="form-control" name="serviceId"
								value="${service.serviceId}">
						</div>
					</div>

					<%-- 위치 --%>
					<div class="row border-bottom mb-3 pb-3">
						<label class="col-2 col-form-label fw-bold">위치</label>
						<div class="col-10">
							<input type="text" class="form-control" name="location"
								value="${service.location}">
						</div>
					</div>

					<%-- 버튼 --%>
					<div class="w-100 d-flex flex-column gap-3 mt-5">
						<div class="col">
							<input type="submit" class="btn btn-cyan-700 w-100" value="수정" />
						</div>
						<div class="col">
							<a href="<%= Common.getUrl(Common.SERVICE, Common.DELETE) %>?no=${service.no}"
								class="btn btn-cancel w-100">삭제</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</main>

	<%-- [Contents] ######################################################### --%>

	<!-- footer 포함하기 -->
	<jsp:include page="/alljsp/footer.jsp" />

	<!-- script 포함하기 -->

</body>
</html>