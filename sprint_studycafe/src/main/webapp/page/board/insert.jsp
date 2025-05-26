<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Type"%>
<%@page import="java.util.List"%>
<%@ page import="Config.Common"%>
<%@ include file="/alljsp/common.jsp" %>
<%@ include file="/alljsp/jstl.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%= Common.TITLE %></title>
	<jsp:include page="/alljsp/link.jsp" />
  	<style>
  	body {
  		padding-bottom: 100px;
    	 }
  	</style>
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<form action="<%= Common.getUrl(Common.BOARD, Common.INSERT) %>" method="post" >
  <div class="container my-5">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <h1 class="text-center mb-6 fs-50">1:1 문의</h1>
        <h5 class="text-center mt-3 mb-5 fs-25">문의내용</h5>
		
        <div class="mb-5">
       	  	<div class="row mb-3 border-bottom border-top">
			<label class="col-sm-2 col-form-label">구분</label>
          	<div class="col-sm-10 d-flex align-items-center gap-3">
			<%
				
				Object object = request.getAttribute("typelist");
	        	List<Type> typelist ;
	            	if ( object != null ) {
	            		typelist = (List<Type>) request.getAttribute("typelist");
	            	} else {
	            		typelist = new ArrayList<Type>();  
	            	}
	            	String check = "";
	   	 			for (int i = 0; i < typelist.size(); i++){
	   	 			Type type = typelist.get(i);
	   	 				if (i==0){
	   	 					check = "checked" ;
	   	 				} else { check ="" ;}
			%>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="typeNo" value="<%= type.getNo() %>" id="opt<%= i %>" <%= check %>>
					<label class="form-check-label" for="opt<%= i %>"><%= type.getTypeName() %></label>
				</div>
			<% } %>
			</div>
			</div>
          <div class="row mb-3 border-bottom pb-3">
            <label for="title" class="col-sm-2 col-form-label">제목</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요.">
            </div>
          </div>

          <div class="row mb-3 border-bottom pb-3">
            <label for="content" class="col-sm-2 col-form-label">내용</label>
            <div class="col-sm-10">
              <textarea class="form-control" id="content" name="content" rows="6" placeholder="내용을 입력하세요." style="resize: none;"></textarea>
            </div>
          </div>

          <div class="row mb-3 border-bottom">
            <label class="col-sm-2 col-form-label">고객정보</label>
          </div>

          <div class="col row mb-3">
            <label for="phone" class="col-sm-2 col-form-label">전화번호</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" id="phone" name="phonenumber" placeholder="-없이 입력하세요.">
            </div>
          </div>
        </div>

        <div class="mb-4 mt-5">
          <h6 class="fw-bold mt-10">개인정보 수집에 대한 동의</h6>
          <p class="small text-muted">
            문의를 통해 수집된 개인정보는 문의처리를 위해서만 사용되며, 수집된 개인정보는 문의처리 목적 외에 사용되지 않습니다.
          </p>
          <textarea class="form-control mb-3" rows="6" readonly style="resize: none;">
1. 수집 항목
- 이름, 전화번호

2. 이용 목적
- 문의 및 요청사항 처리, 결과 회신

3. 보유 기간
- 처리 완료 후 1년 보관

4. 동의 거부 시 불이익
- 동의를 거부하실 수 있으나, 이 경우 문의처리 서비스 이용이 제한될 수 있습니다.
          </textarea>

           <div class="checklabel text-end">
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="agree" id="agreeNo">
            <label class="form-check-label" for="agreeNo">동의하지 않음</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="agree" id="agreeYes">
            <label class="form-check-label" for="agreeYes">동의함</label>
          </div>
          </div>
        </div>

        <div class="text-center">
       	<input type="hidden" name="no" value="${board.no}">
          <button type="button" class="btn btn-outline-secondary me-2 px-4 btn-cyan-700-55">취소</button>
          <button type="submit" class="btn btn-primary px-4 btn-cyan-700:hover btn-cyan-700">등록</button>
        </div>

      </div>
    </div>
  </div>
  </form>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
<%-- 	<jsp:include page="/layout/script.jsp" /> --%>
</body>
</html>