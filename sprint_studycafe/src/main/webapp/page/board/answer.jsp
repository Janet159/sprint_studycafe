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
  	<link href="<%= root%>/allcss/insert.css" rel="stylesheet">
  	<style>
  	body {
  		padding-bottom: 100px;
    	 }
  	</style>
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
 <div class="container">
    <div class="row justify-content-center">
    <div class="col-md-7">
    <div class="content-box" style="height: 950px;">
        <div class="content-title">문의내용</div>
        <form>
        <div class="row mb-5 pb-4 border-bottom">
        <label for="title" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
        <input type="text" class="form-control" id="title">
        </div>
        </div>
        <div class="row mb-5 pb-5 border-bottom">
        <label for="floatingTextarea2" class="col-sm-2 col-form-label d-flex align-items-center justify-content-center">내용</label>
        <div class="col-sm-10">
        <textarea class="form-control " id="floatingTextarea2" style="resize: none; height: 300px;"></textarea>
        </div>
        </div>
        <div class="d-grid gap-2">
          <button type="submit" class="btn btn-signup btn-cyan-700">수정</button>
          <button type="button" class="btn btn-cancel">삭제</button>
        </div>
         <div class="row justify-content-center mt-2 mb-5 pb-2">
            <div class="title2 mt-3 mb-4 text-cyan-700">답변내용</div>
           	<div class="col-sm-10">
           	<textarea class="form-control" id="floatingTextarea3" style="resize: none; height: 130px;"></textarea>
            </div>
        </div>
    </form>
    </div>
    </div>
    </div>
</div>
	
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />
</html>