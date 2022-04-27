<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/views/template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
<script>
	$(function() {
		$(window).resize(function() {
			var windowWidth = $(window).width();
			if(windowWidth < 1700) {
				$('#demo').addClass('col-12');
			} else {
				$('#demo').css('width', '1920px');
			}
		});
	});
</script>
</head>
<body>
<%@ include file="WEB-INF/views/template/header.jsp" %>

<!-- section -->
    <section>
        <div id="content" class="container-fluid">
        	<div class="demo-div container-fluid">
                <div id="demo" class="carousel slide" data-ride="carousel">
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                    </ul>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath}/resources/imgs/main_banner_01.jpg" alt="Los Angeles">
                            <div class="carousel-caption">
                                <h3></h3>
                                <p></p>
                            </div>   
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/resources/imgs/main_banner_01.jpg" alt="Chicago">
                            <div class="carousel-caption">
                                <h3></h3>
                                <p></p>
                            </div>   
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/resources/imgs/main_banner_01.jpg" alt="New York">
                            <div class="carousel-caption">
                                <h3></h3>
                                <p></p>
                            </div>   
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                </div>
            </div>
            <div id="popularCategory" class="container">
                <h2>인기 여행지</h2>
                <div class="container">
                    <div class="category-group">
                        <ul class="category-list col-12 row">
                            <li class="col-8 col-sm-6 col-md-4 col-lg-3">
                                <div class="category" onclick="javascript:location.href='/admin/manager_index';">서울</div>
                            </li>
                            <li class="col-8 col-sm-6 col-md-4 col-lg-3">
                                <div class="category">경기도</div>
                            </li>
                            <li class="col-8 col-sm-6 col-md-4 col-lg-3">
                                <div class="category">제주도</div>
                            </li>
                            <li class="col-8 col-sm-6 col-md-4 col-lg-3">
                                <div class="category">울릉도</div>
                            </li>
                        </ul>
                        <div class="next-btn1"></div>
                    </div>
                    <div>
                        <button type="button" class="btn">전체보기</button>
                    </div>
                </div>
            </div>
            <div id="popularActivity" class="container">
                <h2>인기 상품</h2>
                <div class="container">
                    <div class="activity-group">
                        <ul class="activity-list col-12 row">
                            <li class="col-8 col-sm-6 col-md-4 col-lg-3">
                                <div class="activity">
                                    <div class="activity-img"></div>
                                    <div class="activity-desc">[트립온 초특가]에버랜드<br>(바코드 바로 입장)<br><br><strong>&#8361;&nbsp;<del>28,000</del></strong><br>&#8361;&nbsp;20,900부터</div>
                                </div>
                            </li>
                            <li class="col-8 col-sm-6 col-md-4 col-lg-3">
                                <div class="activity">
                                    <div class="activity-img"></div>
                                    <div class="activity-desc">[트립온 초특가]에버랜드<br>(바코드 바로 입장)<br><br><strong>&#8361;&nbsp;<del>28,000</del></strong><br>&#8361;&nbsp;20,900부터</div>
                                </div>
                            </li>
                            <li class="col-8 col-sm-6 col-md-4 col-lg-3">
                                <div class="activity">
                                    <div class="activity-img"></div>
                                    <div class="activity-desc">[트립온 초특가]에버랜드<br>(바코드 바로 입장)<br><br><strong>&#8361;&nbsp;<del>28,000</del></strong><br>&#8361;&nbsp;20,900부터</div>
                                </div>
                            </li>
                            <li class="col-8 col-sm-6 col-md-4 col-lg-3">
                                <div class="activity">
                                    <div class="activity-img"></div>
                                    <div class="activity-desc">[트립온 초특가]에버랜드<br>(바코드 바로 입장)<br><br><strong>&#8361;&nbsp;<del>28,000</del></strong><br>&#8361;&nbsp;20,900부터</div>
                                </div>
                            </li>
                            <li>
                            </li>
                        </ul>
                        <div class="next-btn1"></div>
                    </div>
                    <div>
                        <button type="button" class="btn">더 보기</button>
                    </div>
                </div>
            </div>
            <div id="notice" class="container">
<!--                 <h2>공지사항</h2> -->
                <h2><a href="./NoticePage.html">공지사항</a></h2>
                <div class="container">
                    <div class="notice-group row">
                        <ul class="notice-list col-12">
                            <li>
                                <div class="notice-title">
                                    <div class="notice-tab1">공지사항 내역</div>
                                </div>
                                <div class="notice-line-group col-12">
                                    <div class="notice-line-1"></div>
                                    <div class="notice-line-2 col-12"></div>
                                </div>
                            </li>
                            <li>
                                <div class="notice">
                                    <div class="notice-title">안녕하세요 공지글입니다. 더미데이터</div>
                                    <div class="notice-date">2022-05-05</div>
                                </div>
                                <div class="notice-line"></div>
                            </li>
                            <li>
                                <div class="notice">
                                    <div class="notice-title">안녕하세요 공지글입니다. 더미데이터</div>
                                    <div class="notice-date">2022-05-05</div>
                                </div>
                                <div class="notice-line"></div>
                            </li>
                            <li>
                                <div class="notice">
                                    <div class="notice-title">안녕하세요 공지글입니다. 더미데이터</div>
                                    <div class="notice-date">2022-05-05</div>
                                </div>
                                <div class="notice-line"></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

<%@ include file="WEB-INF/views/template/footer.jsp" %>
</body>
</html>