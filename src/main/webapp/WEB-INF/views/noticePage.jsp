<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticePage.css">
</head>
<script>
$(document).ready(function(){
    $('.fa-angle-up').hide();
    $('li').click(function(){
        var id_check = $(this).attr("id"); //우리가 클릭한 요소의 id가져오기.
        // $('li#'+id_check+' + div.panel').toggle();
        $('li#'+id_check).children().last().toggle(); //<div class="panel"><p>예약 취소는 마이페이지 > 예약내역에서 직접 가능합니다.</p></div>
        $('li#'+id_check+' .fa-angle-down').toggle(); //<span><i class="fa fa-angle-down"></i></span>
        $('li#'+id_check+' .fa-angle-up').toggle(); //<span><i class="fa fa-angle-up"></i></span>
        $('li#'+id_check).siblings("li").children("div.panel").hide();
    });
});
</script>
<body>
<%@ include file="./template/header.jsp" %>

<div class="container" id="faq-page">
     <div id="menu-bar">
         <ul class="menu-list">
             <li>
                 <a href="notice" id="menu-item-1">공지사항</a>
             </li>
             <li>
                 <a href="faq" id="menu-item-2">자주 묻는 질문</a>
             </li>
         </ul>
     </div>
     <div id="faq-list-div">
         <div class="faq_list">
             <ul class="top_link">
                 <li>
                     <a href="#" class="top on"> TOP7</a>
                 </li>
                 <li>
                     <a href="#" class="use"> 이용문의</a>
                 </li>
                 <li>
                     <a href="#" class="quest"> 예약문의</a>
                 </li>
                 <li>
                     <a href="#" class="cansel"> 예약취소</a>
                 </li>
                 <li>
                     <a href="#" class="purchase"> 결제/영수증</a>
                 </li>
             </ul>
             <div class="line-group">
                 <div class="title-main-line"></div>
                 <div class="title-sub-line"></div>
             </div>
             <div class="container">
                 <ul class="list-group list-group-flush">
                 
                     <c:forEach items="${noticeList}" var="notice">
	                     <li class="list-group-item" id="q${notice.ntc_seq}">
	                         <div class="questlist">
	                             <p>${notice.ntc_title}</p>
	                             <div class="arrow">
	                                 <span class="fa fa-angle-down"></span>
	                                 <span class="fa fa-angle-up"></span>
	                             </div>
	                         </div>
	                         <div class="panel">
	                             <p>${notice.ntc_content}</p>
	                         </div>
	                     </li>
	                 </c:forEach>
                     
                 </ul>
             </div>
         </div>
     </div>
 </div>

<%@ include file="./template/footer.jsp" %>
</body>
</html>