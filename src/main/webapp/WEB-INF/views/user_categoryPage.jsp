<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ include file="./template/head.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user_categoryPage.css">
<script src="${pageContext.request.contextPath}/resources/js/user_detailsPage.js"></script>
</head>
<body>
<%@ include file="./template/header.jsp"%>
<!-- header -->

<section>
    <div class="jumbo">
        <div class="jumbotron">
            <div class="container">
                <h1 class="display-4">카테고리</h1>
                <p class="lead">
                
                </p>
            </div>
        </div>
    </div>
    <div class="content-body">
        <!-- <h1>CATEGORIES</h1> -->
        <div class= "container">
            <div class="content-body row justify-content-md-center">
                <c:forEach items="${categoryList}" var="category">
                <!-- <div id="flex" class="around"> -->
                	<%-- <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12">
                       <div class="activity">
                           <div class="activity-img">
                           	<img src="${pageContext.request.contextPath}/resources/imgs/${category.category_img}" class="card-img-top" alt="${category.category_img}">
                           </div>
                           <div class="activity-desc">[트립온 초특가]에버랜드<br>
                           (바코드 바로 입장)<br><br>
                           <strong>&#8361;&nbsp;<del>28,000</del></strong><br>
                           &#8361;&nbsp;20,900부터</div>
                       </div>
                    </div> --%>
	                <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12">
	                    <a href="user_activityListPage?category_num=${category.category_num}" title="">
	                    <div class="card item">
	                    	<div class="thumb_img">
	                        <img class="_img" src="${pageContext.request.contextPath}/resources/imgs/${category.category_img}" class="card-img-top" alt="${category.category_img}">
		                    </div>
		                    <div class="card-body">
			                    <p class="card-text">${category.category_name}</p> 
		                    </div>
	                    </div>
	                    </a>
	                </div>
                </c:forEach>
                
            </div>      <!-- content-body row -->
        </div>      <!-- container -->
	</div>      <!-- content-body -->
</section>


<%@ include file="./template/footer.jsp" %>
</body>
</html>