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
		.title {
			font-size: 24px;
			margin-bottom: 40px;
		}
		
		.table thead th {
			color: #5ecbe1;
		}
	</style>
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	<div class="list-box">

		<div class="title-area">
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
									<c:when test="${user.admin_kbn}">
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
				</tbody>
			</table>
		</div>
		<div class="pagination">
			<span>1</span> <span>2</span> <span>3</span> <span>4</span> <span>5</span>
			<span>6</span> <span>7</span> <span>8</span> <span>9</span> <span>10</span>
		</div>

		<a href="<%=root%>/main.jsp" class="btn btn-main btn-cyan-700">메인</a>
	</div>


	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>