<%@page import="DTO.Notice"%>
<%@page import="Config.Common"%>
<%@ include file="/alljsp/jstl.jsp" %>
<%@ include file="/alljsp/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>공지사항</title>
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
        <div class="content-title">공지사항</div>
        <div class="row mb-5 pb-3 border-bottom">
        <label for="title" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
        <input type="text" class="form-control" id="title" readonly value="${result.title}">
        </div>
        </div>
        <div class="row mb-5 pb-3 border-bottom">
	        <label for="floatingTextarea2" class="col-sm-2 col-form-label d-flex align-items-center justify-content-center">내용</label>
	        <div class="col-sm-10">
	        <textarea class="form-control readonly" id="floatingTextarea2" style="resize: none; height: 300px;" readonly>${result.content}</textarea>
	        </div>
        </div>
        	<% if (role) { %>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-end mb-5">
				<a href="<%= Common.getUrl(Common.NOTICE, Common.UPDATE) %>?no=${result.no}" class="btn btn-cyan-700 btn-lg px-4 me-sm-3">수정</a>
			</div>
			<% } %>
    </div>
    </div>
    </div>
</div>

	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
<%-- 	<jsp:include page="/layout/script.jsp" /> --%>
</body>
</html>