<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user_categoryPage.css">
<script src="${pageContext.request.contextPath}/resources/js/user_detailsPage.js"></script>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
</head>
<body>
<%@ include file="./template/header.jsp" %>
<!-- header -->

<section>
    <div class="jumbo">
        <div class="jumbotron">
            <div class="container">
        	<%-- <img alt="" src="${pageContext.request.contextPath}/resources/imgs/world_jumbo.jpeg"> --%>
                <h1 class="display-4">${category.category_name}</h1>
                
            </div>
        </div>
    </div>
    

    <div class="content-body">
        <!-- <h1>CATEGORIES</h1> -->
        <div class= "container">
            <div class="content-body row justify-content-md-center">
                <c:forEach items="${activityList}" var="activity">
                
                
	                <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12">
	                    <a href="getUser_detailsPage?act_num=${activity.act_num}" title="">
	                    <div class="card item">
	                        <img src="${pageContext.request.contextPath}/resources/imgs/${activity.act_mainpicture}" class="card-img-top" alt="이미지">
		                    <div class="card-body">
			                   <p class="card-text"><strong>${activity.act_maintitle}</strong><br>
	                           <span class="subtitle">(${activity.act_subtitle})</span><br>
	                           <strong class="delPrice">&#8361;&nbsp;<del>${activity.act_optprice1*2}</del></strong><br>
	                           &#8361;&nbsp;${activity.act_optprice1}부터
	                        </div>
		                    </div>
	                    </a>
	                    </div>
                </c:forEach>             
            </div>      <!-- content-body row -->
        </div>      <!-- container -->
	</div>      <!-- content-body -->
<%--                     <div class="activity-group">
                        <ul class="activity-list col-12 row">
                            <li class="col-8 col-sm-6 col-md-4 col-lg-3">
	                    <a href="getUser_detailsPage?act_num=${activity.act_num}" title="">
	                        <div class="activity-img">
                           	<img src="${pageContext.request.contextPath}/resources/imgs/${activity.act_mainpicture}" class="card-img-top" alt="이미지">
                           	</div>
                           <div class="activity-desc">${activity.act_maintitle}<br>
                           (${activity.act_subtitle})<br><br>
                           <strong>&#8361;&nbsp;<del>${activity.act_optprice1*2}</del></strong><br>
                           &#8361;&nbsp;${activity.act_optprice1}부터</div>
                    </a>
                    </li>
                    </ul>
                    </div> --%>
</section>


<%@ include file="./template/footer.jsp" %>
</body>
</html>