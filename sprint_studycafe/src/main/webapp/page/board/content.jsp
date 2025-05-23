<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>문의사항 답변</title>
<%-- 	<jsp:include page="/layout/meta.jsp" /> --%>
<%-- 	<jsp:include page="/layout/link.jsp" /> --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<link href="<%= root%>/allcss/insert.css" rel="stylesheet">
  	<link href="<%= root%>/allcss/all.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
 <div class="container">
    <div class="row justify-content-center">
    <div class="col-md-7">
    <div class="content-box">
        <div class="content-title">문의내용</div>
        <form>
        <div class="row mb-5 pb-2 border-bottom">
        <label for="title" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
        <input type="text" class="form-control" id="title">
        </div>
        </div>
        <div class="row mb-5 pb-2 border-bottom">
        <label for="floatingTextarea2" class="col-sm-2 col-form-label d-flex align-items-center justify-content-center">내용</label>
        <div class="col-sm-10">
        <textarea class="form-control" id="floatingTextarea2" style="resize: none; height: 300px;"></textarea>
        </div>
        </div>
        <div class="d-grid gap-2">
          <button type="submit" class="btn btn-signup btn-cyan-700:hover btn-cyan-700">수정</button>
          <button type="button" class="btn btn-cancel">삭제</button>
        </div>
    </form>
    </div>
    </div>
    </div>
</div>
	
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
<%-- 	<jsp:include page="/layout/script.jsp" /> --%>
</body>
</html>