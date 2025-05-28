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

		<div class="title-area">1:1 문의</div>
		<div class="sub-title-area">문의내용</div>

		<div class="container pb-10">
			<form action="<%=Common.getUrl(Common.BOARD, Common.INSERT)%>" method="post">
				<div class="content-area mx-auto">
					<%-- 구분 --%>
					<div class="row border-bottom border-top mb-3">
						<label class="col-2 col-form-label fw-bold">구분</label>
						<div class="col-10 d-flex align-items-center gap-3">
							<%
							String check = "";
							for (int i = 0; i < typelist.size(); i++) {
								Type type = typelist.get(i);
								check = (i == 0) ? "checked" : "";
							%>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="typeNo"
									value="<%=type.getNo()%>" id="opt<%=i%>" <%=check%>> <label
									class="form-check-label" for="opt<%=i%>"><%=type.getTypeName()%></label>
							</div>
							<%
							}
							%>
						</div>
					</div>

					<%-- 제목 --%>
					<div class="row border-bottom mb-3 pb-3">
						<label class="col-2 col-form-label fw-bold" for="title">제목</label>
						<div class="col-10">
							<input class=" form-control" type="text" id="title" name="title"
								placeholder="제목을 입력하세요." required>
						</div>
					</div>

					<%-- 내용 --%>
					<div class="row border-bottom mb-3 pb-3">
						<label
							class="col-2 col-form-label d-flex align-items-center justify-content-center fw-bold" for="content">내용</label>
						<div class="col-10">
							<textarea class="form-control" style="resize: none;" rows="6"
								id="content" name="content" placeholder="내용을 입력하세요." required></textarea>
						</div>
					</div>

					<%-- 고객 정보 --%>
					<div class="row border-bottom mt-4 mb-3 pb-3">
						<label class="col col-form-label text-start fs-20">고객정보</label>
					</div>

					<%-- 전화번호 --%>
					<div class="row border-bottom mb-3 pb-3">
						<label class="col-2 col-form-label fw-bold" for="phone">전화번호</label>
						<div class="col-4">
							<input class="form-control" type="text" id="phone"
								name="phonenumber" placeholder="-없이 입력하세요." maxlength="11"
								required>
						</div>
					</div>
				</div>

				<%-- 수집 동의 --%>
				<div class="content-area mx-auto mt-5 pt-0 pb-0 row d-flex flex-column">
					<div class="col fw-bold text-start fs-18 mb-1">개인정보 수집에 대한 동의</div>
					<p class="small text-muted text-end">문의를 통해 아래의 개인 정보를 수집합니다. 수집된 개인정보는 문의 외 목적으로 사용되지 않습니다.</p> 
					<textarea class="form-control mb-3" rows="6" readonly
						style="resize: none;">
개인 정보의 수집 목적 및 항목
① 수집 목적 : 원할한 고객 상담, 불편 사항 및 문의 사항 관련 의사소통 경로 확보
② 수집 항목
* 필수 입력 사항
- 이용자 식별을 위한 항목 : 성명, 연락처, 이메일, 아이디(로그인 시 수집)

개인 정보의 보유 및 이용 기간
입력하신 개인 정보는 소비자 보호에 관한 법률 등 관계 법률에 의해 다음과 같이 보유합니다.

보유기간 : 동의일로부터 3년
- 답변 완료 시 : 처리 완료 시점으로부터 3개월 보관 이후 분리 보관
- 답변 미 완료 시 : 접수 시점으로부터 3개월 보관 이후 분리 보관

※ 1:1 문의 서비스 제공을 위한 최소한의 개인정보이며 거부할 수 있습니다. 다만, 수집에 동의하지 않을 경우 서비스 이용이 제한됩니다.
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
				</div>
				
				<div class="content-area mx-auto pt-0">
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