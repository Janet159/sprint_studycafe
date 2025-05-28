<%@ include file="/alljsp/jstl.jsp"%>
<%@ include file="/alljsp/common.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<jsp:include page="/alljsp/link.jsp" />
<link href="<%=root%>/allcss/list.css" rel="stylesheet">
<style>
.table thead th {
	color: #168099;
}
</style>
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	<main>
		<div class="title-area">회원목록</div>
		<div class="list-area">

			<div class="table-responsive">
				<table class="table table-hover">
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
						<c:if test="${empty resultList}">
							<tr>
								<td colspan="5" class="text-center">조회된 회원이 없습니다.</td>
							</tr>
						</c:if>

						<c:forEach var="user" items="${resultList}">
							<tr class="text-center">
								<td>${user.name}</td>
								<td>${user.user_id}</td>
								<td><c:choose>
										<c:when test="${user.adminKbn}">
                                        관리자
                                    </c:when>
										<c:otherwise>
                                        사용자
                                    </c:otherwise>
									</c:choose></td>
								<td>${user.email}</td>
								<td><fmt:formatDate value="${user.createdAt}"
										pattern="yyyy-MM-dd HH:mm" /></td>
							</tr>
						</c:forEach>
						<c:forEach var="i" begin="0" end="${10 - fn:length(resultList)}">
							<tr class="text-center">
								<td colspan="5">&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="pagination">
				<span><a href="">1</a></span>
			</div>

			<div class="text-end">
				<a href="<%=root%>/main.jsp" class="btn btn-cyan-700">메인</a>
			</div>
		</div>
	</main>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>