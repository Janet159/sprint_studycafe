<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Type"%>
<%@page import="java.util.List"%>
<%@page import="DTO.Board"%>
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
  		padding-bottom: 200px;
    	 }
  	</style>
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
 <div class="container">
    <div class="row justify-content-center">
    <div class="col-md-7">
    <div class="content-box" style="height: 850px;">
        <div class="content-title">문의내용</div>
        <form action="<%= Common.getUrl(Common.BOARD, Common.UPDATE) %>" method="post">
        <div class="row mb-3 border-bottom border-top">
			<label class="col-sm-2 col-form-label">구분</label>
			<div class="col-sm-10 d-flex align-items-center gap-3">
			<%
				Board board = (Board) request.getAttribute("result");
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
	   	 				if (type.getNo() == board.getTypeNo()){
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
        <div class="row mb-5 pb-2 border-bottom">
        <label for="title" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
        <input type="text" class="form-control" id="title" name="title" value="${result.title}">
        </div>
        </div>
        <div class="row mb-5 pb-2 border-bottom">
        <label for="floatingTextarea2" class="col-sm-2 col-form-label d-flex align-items-center justify-content-center">내용</label>
        <div class="col-sm-10">
        <textarea class="form-control" id="floatingTextarea2" style="resize: none; height: 300px;" name="content">${result.content}</textarea>
        </div>
          <div class="col row mb-3 mt-4">
           		<label for="phone" class="col-sm-2 col-form-label">전화번호</label>
            <div class="col-sm-4">
            	<input type="text" class="form-control" id="phone" placeholder="-없이 입력하세요." name="phonenumber" value="${result.content}">
            </div>
          </div>
        </div>
        <div class="d-grid gap-2 mb-5">
          <input type="hidden" name="no" value="${no}"/>
          <button type="submit" class="btn btn-signup btn-cyan-700:hover btn-cyan-700">수정</button>
<!--           <button type="button" class="btn btn-cancel">삭제</button> -->
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