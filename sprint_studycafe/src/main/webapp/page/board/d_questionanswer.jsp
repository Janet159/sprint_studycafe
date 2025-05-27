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
  <div class="container my-5">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <h1 class="text-center mb-6 fs-50">1:1 문의</h1>
        <h5 class="text-center mt-3 mb-5 fs-25">문의내용</h5>

        <div class="mb-5">

          <div class="row mb-3 border-bottom border-top">
            <label class="col-sm-2 col-form-label">구분</label>
            <div class="col-sm-10 d-flex align-items-center gap-3">
              <div class="form-check">
                <input class="form-check-input" type="radio" name="category" id="opt1">
                <label class="form-check-label" for="opt1">이용 문의</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="category" id="opt2">
                <label class="form-check-label" for="opt2">결제 문의</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="category" id="opt3">
                <label class="form-check-label" for="opt3">기타 문의</label>
              </div>
            </div>
          </div>

          <div class="row mb-3 border-bottom pb-3">
            <label for="title" class="col-sm-2 col-form-label">제목</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요.">
            </div>
          </div>

          <div class="row mb-3 border-bottom pb-3">
            <label for="content" class="col-sm-2 col-form-label">내용</label>
            <div class="col-sm-10">
              <textarea class="form-control" id="content" rows="6" placeholder="내용을 입력하세요." style="resize: none;"></textarea>
            </div>
          </div>

          <div class="row mb-3 border-bottom">
            <label class="col-sm-2 col-form-label">고객정보</label>
          </div>

          <div class="row mb-3">
            <label for="phone" class="col-sm-2 col-form-label">전화번호</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" id="phone" placeholder="-없이 입력하세요.">
            </div>
          </div>
        </div>
        
            <div class="row justify-content-center mt-4">
            <div class="title2 mt-3 mb-4 text-center text-cyan-700">답변내용</div>
             <div class="col-sm-10 mb-4">
            <textarea class="form-control" id="floatingTextarea3" style="resize: none; height: 150px;"></textarea>
            </div>
        </div>
      
        <div class="d-grid gap-2">
          <button type="submit" class="btn btn-signup btn-cyan-700">답변 업데이트</button>
        </div>

      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>	
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
<%-- 	<jsp:include page="/layout/script.jsp" /> --%>
</body>
</html>