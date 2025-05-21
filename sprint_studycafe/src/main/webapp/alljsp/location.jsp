<%@ include file="/alljsp/common.jsp" %>
<%@ page import="Config.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%= Common.TITLE %></title>
	<jsp:include page="/alljsp/link.jsp" />
	<link rel="stylesheet" href="<%= root %>/allcss/location.css">
</head>
<body>
	<jsp:include page="/alljsp/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	<main>
        <div class="container-1360 location-container mx-auto">
            <p class="text-center fs-50 fw-bold text-black-70 mt-10">찾아오시는 길</p>
                <div style="display: flex; justify-content: center;" class="mt-5 pt-10">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.718723172975!2d126.71806287660146!3d37.490963472058205!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b7c4657c1fbbb%3A0xdc62da8af7b28c8a!2z7J247LKc6rSR7Jet7IucIOu2gO2Pieq1rCDrtoDtj4nrj5kgNTM0LTQ4!5e0!3m2!1sko!2skr!4v1747728552950!5m2!1sko!2skr"
                        width="800"
                        height="450"
                        style="border: 0; pointer-events: none;"
                        allowfullscreen=""
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>
                <div class="location-text d-flex justify-content-between">
                    <div class="location-text-detail d-flex flex-column mb-2">
                        <p class="fw-bold mb-0 fs-20 text-black-60">주소</p>
                        <p class="fw-bold mb-0 fs-20 text-black-60">찾아오시는 길</p>
                    </div>

                    <div class="location-text-detail d-flex flex-column mb-2">
                        <p class="mb-0 fs-15 mt-1 mb-2 text-black-40">경원대로 1366 7층 더조은컴퓨터아카데미 인천캠퍼스 지번 부평동 534-48</p>
                        <p class="mb-0 fs-15 text-black-40">부평역 3번 출구 도보 5분 거리</p>
                    </div>
                </div>
                <div class="my-10 pb-10"></div>

            </div>

        </div>
    </main>
		
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/alljsp/footer.jsp" />

</body>
</html>