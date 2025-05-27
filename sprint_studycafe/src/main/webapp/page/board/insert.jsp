<%@ include file="/alljsp/common.jsp"%>
<%@ include file="/alljsp/jstl.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Config.Common"%>
<%@ page import="DTO.Type"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%=Common.TITLE%></title>
	<jsp:include page="/alljsp/link.jsp" />
	<link href="<%=root%>/allcss/insert.css" rel="stylesheet">
	<style>
		body {
			padding-bottom: 100px;
		}
	</style>
</head>
<body>
	<%
	Object object = request.getAttribute("typelist");
	List<Type> typelist;
	if (object != null) {
		typelist = (List<Type>) request.getAttribute("typelist");
	} else {
		typelist = new ArrayList<Type>();
	}
	%>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main class="container-1360 ">
		<div class="container">
		
			<div class="title-area">1:1 문의</div>
			<div class="sub-title-area">문의내용</div>

			<form action="<%=Common.getUrl(Common.BOARD, Common.INSERT)%>" method="post">
				<div class="content-box mx-auto">
					<%-- 구분 --%>
					<div class="row mb-3 border-bottom border-top">
						<label class="col-sm-2 col-form-label">구분</label>
						<div class="col-sm-10 d-flex align-items-center gap-3">
							<%
							String check = "";
							for (int i = 0; i < typelist.size(); i++) {
								Type type = typelist.get(i);
								check = (i == 0) ? "checked" : "";
							%>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="typeNo"
									value="<%=type.getNo()%>" id="opt<%=i%>" <%=check%>>
								<label class="form-check-label" for="opt<%=i%>"><%=type.getTypeName()%></label>
							</div>
							<%
							}
							%>
						</div>
					</div>
					
					<%-- 제목 --%>
					<div class="row mb-3 border-bottom pb-3">
						<label for="title" class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" name="title"
								placeholder="제목을 입력하세요." required>
						</div>
					</div>

					<%-- 내용 --%>
					<div class="row mb-3 border-bottom pb-3">
						<label for="content" class="col-sm-2 col-form-label">내용</label>
						<div class="col-sm-10">
							<textarea class="form-control" id="content" name="content"
								rows="6" placeholder="내용을 입력하세요." style="resize: none;" required></textarea>
						</div>
					</div>

					<%-- 고객 정보 --%>
					<div class="row mb-3 border-bottom">
						<label class="col-sm-2 col-form-label">고객정보</label>
					</div>

					<%-- 전화번호 --%>
					<div class="col row mb-3">
						<label for="phone" class="col-sm-2 col-form-label">전화번호</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="phone"
								name="phonenumber" placeholder="-없이 입력하세요." maxlength="11"
								required>
						</div>
					</div>
				</div>

				<%-- 수집 동의 --%>
				<div class="content-box mx-auto pt-0">
					<h6 class="fw-bold mb-1">개인정보 수집에 대한 동의</h6>
					<p class="small text-muted text-start">문의를 통해 수집된 개인정보는 문의처리를 위해서만 사용되며,
						수집된 개인정보는 문의처리 목적 외에 사용되지 않습니다.</p>
					<textarea class="form-control mb-3" rows="6" readonly
						style="resize: none;">
1. 수집 항목
- 이름, 전화번호

2. 이용 목적
- 문의 및 요청사항 처리, 결과 회신

3. 보유 기간
- 처리 완료 후 1년 보관

4. 동의 거부 시 불이익
- 동의를 거부하실 수 있으나, 이 경우 문의처리 서비스 이용이 제한될 수 있습니다.
	          				</textarea>

					<%-- 개인정보 동의 --%>
					<div class="checklabel text-end">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="agree" id="agreeNo">
							<label class="form-check-label" for="agreeNo">동의하지 않음</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="agree" id="agreeYes" checked >
							<label class="form-check-label" for="agreeYes">동의함</label>
						</div>
					</div>
					
					<%-- 버튼 --%>
					<div class="mt-5">
						<input type="hidden" name="no" value="${board.no}">
						<a href="<%=Common.getUrl(Common.BOARD, Common.LIST)%>" class="btn btn-cancel px-4">취소</a>
						<button type="submit" class="btn btn-cyan-700 px-4">등록</button>
					</div>
				</div>
			</form>
		</div>
	</main>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</body>
</html>