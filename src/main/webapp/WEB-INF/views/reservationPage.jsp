<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservationPage.css">
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
       
    <div id="rsv-div">

        <div id="reserved-div">
            <div class="reserved-title">예약 내역</div>
            <div class="list_wrap row">
                <div class="rsv-detail col-12 col-lg-6">
                    <div class="card">
                        <img src="https://dummyimage.com/350x180/666/fff" alt="Card image">
                        <div class="card-body" onclick="location.href='reservation_detailPage'">
                            <div class="card-body-status-1">
                                <span>예약확정</span>
                            </div>
                            <div class="card-body-title">예약 내역1</div>
                            <div class="card-body-content">호텔1</div>
                        </div>
                    </div>
                </div>
                <div class="rsv-detail col-12 col-lg-6">
                    <div class="card">
                        <img src="https://dummyimage.com/350x180/666/fff" alt="Card image">
                        <div class="card-body" onclick="location.href='reservation_detailPage'">
                            <div class="card-body-status-1">
                                <span>예약확정</span>
                            </div>
                            <div class="card-body-title">예약 내역1</div>
                            <div class="card-body-content">호텔1</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="used-div">
            <div class="used-title">이용 내역</div>
            <div class="list_wrap row">
                <div class="rsv-detail col-12 col-lg-6">
                    <div class="card">
                        <img class="choonsik" src="https://dummyimage.com/350x180/666/fff" alt="Card image">
                        <form class="close" action="javascript:void(0)" method="post">
                            <button type="submit">&times;</button>
                        </form>
                        <div class="card-body" onclick="location.href='reservation_detailPage'">
                            <div class="card-body-status-2">
                                <span>이용완료</span>
                            </div>
                            <div class="card-body-title">예약 내역1</div>
                            <div class="card-body-content">호텔1</div>
                            <a href="javascript:void(0)" class="btn btn-light card-body-btn">다시 예약</a>
                        </div>
                    </div>
                 </div>
                <div class="rsv-detail col-12 col-lg-6">
                    <div class="card">
                        <img class="Rian" src="https://dummyimage.com/350x180/666/fff" alt="Card image">
                        <form class="close" action="javascript:void(0)" method="post">
                            <button type="submit">&times;</button>
                        </form>
                        <div class="card-body" onclick="location.href='reservation_detailPage'">
                            <div class="card-body-status-2">
                                <span>이용완료</span>
                            </div>
                            <div class="card-body-title">예약 내역1</div>
                            <div class="card-body-content">호텔2</div>
                            <a href="javascript:void(0)" class="btn btn-light card-body-btn">다시 예약</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="cencel-div">
            <div class="cancel-title">취소 내역</div>
            <div class="list_wrap row">
                <div class="rsv-detail col-12 col-lg-6">
                    <div class="card">
                        <img class="choonsik" src="https://dummyimage.com/350x180/666/fff" alt="Card image">
                        <form class="close" action="javascript:void(0)" method="post">
                            <button type="submit">&times;</button>
                        </form>
                        <div class="card-body" onclick="location.href='reservation_detailPage'">
                            <div class="card-body-status-2">
                                <span>예약취소</span>
                            </div>
                            <div class="card-body-title">예약 내역1</div>
                            <div class="card-body-content">호텔1</div>
                            <a href="javascript:void(0)" class="btn btn-light card-body-btn">다시 예약</a>
                        </div>
                    </div>
                 </div>
                <div class="rsv-detail col-12 col-lg-6">
                    <div class="card">
                        <img class="Rian" src="https://dummyimage.com/350x180/666/fff" alt="Card image">
                        <form class="close" action="javascript:void(0)" method="post">
                            <button type="submit">&times;</button>
                        </form>
                        <div class="card-body" onclick="location.href='reservation_detailPage'">
                            <div class="card-body-status-2">
                                <span>예약취소</span>
                            </div>
                            <div class="card-body-title">예약 내역1</div>
                            <div class="card-body-content">호텔2</div>
                            <a href="javascript:void(0)" class="btn btn-light card-body-btn">다시 예약</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="./template/footer.jsp" %>
</body>
</html>