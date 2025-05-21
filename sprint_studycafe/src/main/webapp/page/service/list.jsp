<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>project💻 - ALOHA CLASS🌴</title>
</head>
<body>
	<%
		boolean role = false ;
	%>

	<!-- header 포함하기 -->
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
	<main>
	
	<div class="container">
		<div class="px-4 pt-5 my-5 text-center border-bottom">
			<h2 class="mb-4 text-center">편의 시설 및 구비 용품</h2>
		</div>
		
		<!-- 게시판 테이블 -->

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
				<c:if test="${ boardList.isEmpty() }">
            		<tr>
            			<td align="center" colspan="4">조회된 데이터가 없습니다.</td>
            		</tr>
            	</c:if>
				<c:forEach var="board" items="${boardList}">
                    <tr class="text-center">
                        <td><% if (role) { %><a herf="/config/update?no=${board.userNo}"><% } %> ${board.userNo}<% if (role) { %></a><% } %></td>
                        <td><% if (role) { %><a herf="/config/update?no=${board.userNo}"><% } %> ${board.userNo}<% if (role) { %></a><% } %></td>
						<td><% if (role) { %><a herf="/config/update?no=${board.userNo}"><% } %> ${board.userNo}<% if (role) { %></a><% } %></td>
						<td><% if (role) { %><a herf="/config/update?no=${board.userNo}"><% } %> ${board.userNo}<% if (role) { %></a><% } %></td>
                    </tr>
                </c:forEach>
			</tbody>
		</table>

		<% if (role) { %>
		<div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
			<a href="/board/create.jsp" class="btn btn-success btn-lg px-4 me-sm-3">등록</a>
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