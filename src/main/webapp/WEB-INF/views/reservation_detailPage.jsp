<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation_detailPage.css">
</head>
<body>
<%@ include file="./template/header.jsp" %>

<div class="container" id="faq-page">
    <div id="menu-bar">
        <ul class="menu-list">
            <li>
                <a href="info_managementPage">내 정보 관리</a>
            </li>
            <li>
                <a href="reservationPage">예약 내역</a>
            </li>
        </ul>
    </div>
       
    <div id="rsv-detail-div">
        <div id="detail-div-title">
            <div class="card-body-status-1">
                <span>이용완료</span>
            </div>
            <div class="card-body-title">예약 내역1</div>
            <div class="card-body-content">호텔1</div>
        </div>
        <div id="detail-div-content">
            <div class="detail-div-content-1">
                <span>예약번호</span>
                <span>91009001</span>
            </div>
            <div class="detail-div-content-2">
                <span>예약자 이름</span>
                <span>홍길동</span>
            </div>
            <div class="detail-div-content-3">
                <span>예약자 휴대폰 번호</span>
                <span>01012345678</span>
            </div>
        </div>
        <div id="detail-div-price">
            <div class="detail-div-price-1">
                <span>결제정보</span>
            </div>
            <div class="detail-div-price-2">
                <span>총 결제금액</span>
                <span>200,000원</span>
            </div>
        </div>
        <div id="detail-div-button">
            <a href="javascript:void(0)" class="detail-div-button-cancel">예약 취소</a>
        </div>
    </div>
</div>

<%@ include file="./template/footer.jsp" %>
</body>
</html>