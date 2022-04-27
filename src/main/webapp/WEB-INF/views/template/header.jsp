<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<script>
	$(function() {
		    /*
 			var windowWidth = $(window).width();
			if(windowWidth < 768) {
				$('.ct1').removeClass('container');
				$('.ct1').addClass('container-fluid');
			} else {
				$('.ct1').removeClass('container-fluid');
				$('.ct1').addClass('container');
			}
			*/
			
		$(window).resize(function() {
			var windowWidth = $(window).width();
			if(windowWidth < 768) {
				$('.ct1').removeClass('container');
				$('.ct1').addClass('container-fluid');
			} else {
				$('.ct1').removeClass('container-fluid');
				$('.ct1').addClass('container');
			}
		});
	});
</script>
<header>
	<%
		// 로그인이 되었을때 안되었을때 다르게 보이게 하기
		// 세션 체크
		
		String userId = null;
	
		if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
		}
	%>
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <a href="index" class="logo col-3 col-lg-5">
                    <img class="header-logo" src="${pageContext.request.contextPath}/resources/imgs/tripON_logo_black.png" alt="trip-on">
                </a>
                <ul class="sub-menu col-9 col-lg-7">
                	
                	<%
                		// 로그인 하지 않았을 때 보여지는 화면
                		if(userId == null){
                	%>
                
		                    <li class="col-5">
		                        <a href="sign">회원가입</a>
		                    </li>
		                    <li class="col-4 col-sm-3">
		                        <a href="login">로그인</a>
		                    </li>
                    <% 
                    	// 로그인이 되어 있는 상태에서 보여주는 화면
                		} else {
                    
                    %>
                    		<li class="col-5">
								<span><strong>${userName}</strong> <span><br></span>님 환영합니다.</span>
		                    </li>
		                    <li class="col-4 col-sm-3">
		                        <a class="btn logout-btn" href="logout">로그아웃</a>
		                    </li>
                    
					<%
                		}
					
					%>
                    <li class="col-3">
                        <form action="" class="search">
                            <button type="submit">
                                <div>&nbsp;</div>
                            </button>
                            <input type="text" placeholder="Search">
                        </form>
                    </li>
                </ul>
                <div class="line"></div>
            </div>
        </div>
    </div>
    <div class="container">
        <ul class="main-menu">
            <li>
            <a href="user_categoryPage">여행상품</a>
            </li>
            <span>|</span>
            <li>
                <a href="info_managementPage">마이페이지</a>
            </li>
            <span>|</span>
            <li>
                <a href="/getNoticeList">공지사항</a>
            </li>
            <span>|</span>
            <li>
                <a href="faq">자주 묻는 질문</a>
            </li>
            <span>|</span>
        </ul>
    </div>
</header>