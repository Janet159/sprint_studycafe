<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<title>project💻 - ALOHA CLASS🌴</title>
</head>

<body>
	<% 
		boolean role = false ;
		int no = 10 ;
	%>

	<!-- header 포함하기 -->
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main>

		<div class="container">
			<div class="px-4 pt-5 my-5 text-center border-bottom">
				<h2 class="mb-4">편의 시설 수정</h2>
			</div>

			<form action="/config/update" method="post">

<div class="d-flex flex-column mb-3">
	<div class="p-2">
		<div class="input-group mb-3">
			<span class="input-group-text" id="inputGroup-sizing-default">구분</span>
			<c:forEach var="type" items="${typeList}">
				<div class="form-check">
				<input class="form-check-input" type="radio" name="type" id="type" checked>
				<label class="form-check-label" for="radioDefault2">${type.name}</label>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="p-2">
		<div class="input-group mb-3">
			<span class="input-group-text" id="inputGroup-sizing-default">종류</span>
			<input type="text" class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default">
		</div>
	</div>
	<div class="p-2">
		<div class="input-group mb-3">
			<span class="input-group-text" id="inputGroup-sizing-default">위치</span>
			<input type="text" class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default">
		</div>
	</div>

	<div class="p-2">
		<div class="input-group mb-3">
			<input type="submit" class="btn btn-info w-100 mb-3" value="수정" />
		</div>
		<div class="input-group mb-3">
			<a herf="/config/delete?no=<%=no%>" class="w-100">
			<button type="submit" class="btn btn-info w-100" >삭제</button>
			</a>
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