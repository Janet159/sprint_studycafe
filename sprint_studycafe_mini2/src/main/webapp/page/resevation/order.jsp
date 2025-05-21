<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h2 class="mb-4 text-center">좌석 구매</h2>

			<div class="container text-center">
				<div class="row">
					<div class="col">
						<div class="card text-bg-info mb-3" style="max-width: 18rem;">
							<div class="card-header">1시간</div>
							<div class="card-body">
								<h6 class="card-title">1시간 : 2,000원</h6>
								<p class="card-text">퇴실 예정 시간 : 10:00</p>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card border-info mb-3" style="max-width: 18rem;">
							<div class="card-header">2시간</div>
							<div class="card-body">
								<h6 class="card-title">2시간 : 4,000원</h6>
								<p class="card-text">퇴실 예정 시간 : 11:00</p>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card border-info mb-3" style="max-width: 18rem;">
							<div class="card-header">4시간</div>
							<div class="card-body">
								<h6 class="card-title">4시간 : 7,000원</h6>
								<p class="card-text">퇴실 예정 시간 : 13:00</p>
							</div>
						</div>
					</div>
				</div>
				<%-- end row --%>
				<div class="row">
					<div class="col">
						<div class="card border-info mb-3" style="max-width: 18rem;">
							<div class="card-header">6시간</div>
							<div class="card-body">
								<h6 class="card-title">6시간 : 9,000원</h6>
								<p class="card-text">퇴실 예정 시간 : 15:00</p>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card border-info mb-3" style="max-width: 18rem;">
							<div class="card-header">8시간</div>
							<div class="card-body">
								<h6 class="card-title">8시간 : 10,000원</h6>
								<p class="card-text">퇴실 예정 시간 : 17:00</p>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card border-info mb-3" style="max-width: 18rem;">
							<div class="card-header">12시간</div>
							<div class="card-body">
								<h6 class="card-title">12시간 : 12,000원</h6>
								<p class="card-text">퇴실 예정 시간 : 21:00</p>
							</div>
						</div>
					</div>
				</div>
				<%-- end row --%>

				<div class="row">
					<div class="col-12">
						<form action="/resevation/order" method="post">
							<input type="hidden" value="1" />
							<button type="button" class="btn btn-info w-100 mb-3"
								onclick="order()">구매</button>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<a href="/resevation/list" class="btn btn-outline-info w-100">취소</a>
					</div>
				</div>
			</div>
			<%-- end container --%>

		</div>
	</main>

	<%-- [Contents] ######################################################### --%>

	<!-- footer 포함하기 -->
	<jsp:include page="/alljsp/footer.jsp" />

	<!-- script 포함하기 -->
	<script>
		function order() {
			/*
				1. 카드를 선택하면 히든에 티켓 아이디 저장
				2. 폼 submit
			 */
		}
	</script>
</body>
</html>