<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<title>project💻 - ALOHA CLASS🌴</title>
</head>

<body>
	<!-- header 포함하기 -->
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

		<main>
			<div class="container mt-5">
				<h2 class="mb-4 text-center">결제가 완료되었습니다.</h2>




<div class="d-flex flex-column mb-3">
	<div class="p-2">
		<div class="input-group mb-3">
			<span class="input-group-text" id="inputGroup-sizing-default">결제 일시</span>
			<input type="text" class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default">
		</div>
	</div>
	<div class="p-2">
		<div class="input-group mb-3">
			<span class="input-group-text" id="inputGroup-sizing-default">선택 시간</span>
			<input type="text" class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default">
		</div>
	</div>
	<div class="p-2">
		<div class="input-group mb-3">
			<span class="input-group-text" id="inputGroup-sizing-default">이용 시작 시간</span>
			<input type="text" class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default">
		</div>
	</div>
	<div class="p-2">
		<div class="input-group mb-3">
			<span class="input-group-text" id="inputGroup-sizing-default">이용 종료 예정 시간</span>
			<input type="text" class="form-control" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default">
		</div>
	</div>
	
	<div class="p-2">
		<div class="input-group mb-3">
			<a href="/resevation/list" class="w-100">
			<button type="button" class="btn btn-info w-100" onclick="order()">확인</button>
			</a>
		</div>
	</div> 
</div>



			</div>
		</main>

		<%-- [Contents] ######################################################### --%>

		<!-- footer 포함하기 -->
		<jsp:include page="/alljsp/footer.jsp" />

		<!-- script 포함하기 -->
</body>

</html>