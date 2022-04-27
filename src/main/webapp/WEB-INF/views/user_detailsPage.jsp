<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="./template/head.jsp" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user_detailsPage.css">
<script src="${pageContext.request.contextPath}/resources/js/user_detailsPage.js"></script>
<script type="text/javascript">
        var map = new naver.maps.Map('map', {
			center: new naver.maps.LatLng(37.3595504, 127.105399),
			zoom: 10
		});

		function initMap() {
			map = new naver.maps.Map('map', {
				center: new naver.maps.LatLng(37.3595704, 127.105399),
				zoom: 10
			});
		}
</script>
</head>
<body>

<%@ include file="./template/header.jsp" %>
<!-- header -->

<section>
	<div class="container">
	    <div class="row justify-content-md-center">
	        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
				<div class="productImg">
					<img src="${pageContext.request.contextPath}/resources/imgs/${activity.act_mainpicture}" class="d-block w-100" alt="${activity.act_mainpicture}">
				</div>
	        </div>
	        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
	            <form action="purchase" method="post" id="payMent" name="payMent">
	            <%-- <input type="hidden" name="cat_num" value="${activity.act_num}"> --%>
	                <h2>${activity.act_maintitle}</h2>
                    <h3>${activity.act_subtitle}</h3><hr>
					<select class="custom-select" id="dateScroll" name="dateScroll" onchange="dateOnChange(this)">
						<option selected hidden>날짜 선택</option>
						<%
						int x = 86400000;
						
						for(int i =0; i<=7; i++){
						Date nowTime = new Date(new Date().getTime() + i*x);
						SimpleDateFormat sf = new SimpleDateFormat("MM월 dd일");
						%>
						<option value= "date<%=(i+1)%>"><%=sf.format(nowTime)%></option>
						<%} %>

					</select>
	                <select class="custom-select" id="optionScroll" name="optionScroll" onchange="selectOnChange(this)">
						<option selected hidden>상품 선택</option>
	                    <option value="Option1" >${activity.act_optnum1}-상품가격: ₩${activity.act_optprice1}</option>
	                    <option value="Option2" <c:if test="${activity.act_optprice2==null}">hidden</c:if>>${activity.act_optnum2}-상품가격: ₩${activity.act_optprice2}</option>
	                    <option value="Option3" <c:if test="${activity.act_optprice3==null}">hidden</c:if>>${activity.act_optnum3}-상품가격: ₩${activity.act_optprice3}</option>
	                    <option value="Option4" <c:if test="${activity.act_optprice4==null}">hidden</c:if>>${activity.act_optnum4}-상품가격: ₩${activity.act_optprice4}</option>
	                </select>
					<div id="option_box01">
							<label id="innerDate01"></label>&nbsp;&nbsp;&nbsp;&nbsp;
						<div id="optionInner">
							<label id="inner01"></label>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" id="decrease01" onclick="count01('decrease')" value="-" disabled>
							<label id="quantity01">1</label>
							<input type="button" id="increase01" onclick="count01('increase')" value="+">
							<input type="button" id="delOption01" onclick="delOption('delOption01,1')" value="x">
						</div><hr>
					</div>
					<div id="option_box02">
						<div id="optionInner">
							<!-- <label id="innerDate02"></label>&nbsp;&nbsp;&nbsp;&nbsp; -->
							<label id="inner02"></label>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" id="decrease02" onclick="count02('decrease')" value="-" disabled>
							<label id="quantity02">1</label>
							<input type="button" id="increase02" onclick="count02('increase')" value="+">
							<input type="button" id="delOption02" onclick="delOption('delOption02',2)" value="x">
						</div><hr>
					</div>
					<div id="option_box03">
						<div id="optionInner">
							<label id="innerDate03"></label>&nbsp;&nbsp;&nbsp;&nbsp;
							<label id="inner03"></label>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" id="decrease03" onclick="count03('decrease')" value="-" disabled>
							<label id="quantity03">1</label>
							<input type="button" id="increase03" onclick="count03('increase')" value="+">
							<input type="button" id="delOption03" onclick="delOption('delOption03',3)" value="x">
						</div>
						<hr>
					</div>
					<div id="option_box04">
						<div id="optionInner">
							<label id="innerDate04"></label>&nbsp;&nbsp;&nbsp;&nbsp;
							<label id="inner04"></label>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" id="decrease04" onclick="count04('decrease')" value="-" disabled>
							<label id="quantity04">1</label>
							<input type="button" id="increase04" onclick="count04('increase')" value="+">
							<input type="button" id="delOption04" onclick="delOption('delOption04',4)" value="x">
						</div>
                    <hr>
                    </div>
	                <div class="price">
	                    <h4>총 상품 금액</h4>
	                    <h5>￦00,000원</h5><hr>
	                    <input type="submit" class="btn btn-primary" value="바로구매">
	                </div>
	            </form>
	        </div>
	    </div>      <!-- Row -->
	</div>      <!-- Container -->
	
	<div class="container">
	    <div class="row justify-content-md-center">
	        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
	            <div id="tabMenu">
	                <ul class="tab">
	                    <li><a href="#tab1" class="selected">상품정보</a></li>
	                    <li><a href="#tab2">공지사항</a></li>
	                    <li><a href="#tab3">FAQ</a></li>
                        <li><a href="#tab4">리뷰</a></li>
	                </ul>
	                <ul class="panel">
	                    <li id="tab1">
							<table>
								<thead>
									<tr><th><h5>상품정보</h5></th></tr>
								</thead>
								<tbody>
									<tr><td>${activity.act_content}</td></tr>
									<tr><td>상품글~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td></tr>
									<tr><td>상품글~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td></tr>
									<tr><td>상품글~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td></tr>
									<tr><td>상품글~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td></tr>
									<tr><td>상품글~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td></tr>
									<tr><td>상품글~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td></tr>
									<tr><td>상품글~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td></tr>
									<tr><td>상품글~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td></tr>
									<tr><td>상품글~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td></tr>
									<tr><td>상품글~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td></tr>
									<tr><td>상품글~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td></tr>
								</tbody>
							</table>
							<hr>
							<div class="row">
								<div id="NaverMap">
									<div id="map" style="width: 100%;height: 400px;"></div>
								</div>
							</div>
							<hr>
							<p>찾아가는 길 : 위치</p>
	                    </li>
	                    <li id="tab2">
	                        <table>
								<thead>
									<tr><th><h5>공지사항</h5></th></tr>
									<tr>
										<th>
											<h6>
											상품 유효기간 종료 시점까지 미 사용 시에는 환불이 불가합니다.<br>
											[취소/환불 규정]<br>
											*유효기간 내 미사용상품 100% 환불가능<br>
											*사용한 상품은 환불이 불가능합니다.<br><br>
											[취소/환불 접수]<br>
											구매일로부터 7일이내 **** 환불요청 (사용유무 확인 후 처리2~3일 소요)<br>
											${activity.act_announcement}
											</h6>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>공지글1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td>
									</tr>
									<tr>
										<td>공지글2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td>
									</tr>
									<tr>
										<td>공지글3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td>
									</tr>
									<tr>
										<td>공지글4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td>
									</tr>
								</tbody>
							</table>
	                    </li>
	                    <li id="tab3">
							<table>
								<thead>
									<tr><th><h5>FAQ</h5></th></tr>
									<tr>
										<th>FAQ로 수정</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>FAQ ~~~~~~~~~</td>
									</tr>
									<tr>
										<td>FAQ ~~~~~~~~~</td>
									</tr>
									<tr>
										<td>FAQ ~~~~~~~~~</td>
									</tr>
								</tbody>
							</table>
	                    </li>
                        <li id="tab4">
                       	<h5>액티비티 리뷰</h5>
                       	<hr/>
                       	<div class="container" id="admin_activityList">
    <table>
        <thead>
            <tr>
                <th class="col-9">리뷰</th>
                <th class="col-1">작성자</th>
                <th class="col-1">등록일</th>
                <th class="col-1">삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${activityList}" var="activity">
	            <tr onclick="location.href='admin_getActivity?act_num=${activity.act_num}'">
	                <td>${activity.act_maintitle}</td>
	                <td>${activity.act_writer}</td>
	                <td>${activity.act_regdate}</td>
	                <td><button type="button" class="btn btn-danger btn-sm" id="del_btn"><a href="admin_deleteActivity?act_num=${activity.act_num}">삭제</a></button></td>
	            </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="row justify-content-md-center" id="table_footer">
        <ul class="pagination">
            <li class="page-item <c:if test="${paging.nowPage <= 1}">disabled</c:if>"><a class="page-link" href="/admin/admin_getActivityList?nowPage=${paging.nowPage - 1}">Previous</a></li>
			
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<li class="page-item active"><a class="page-link">${p}</a></li>
					</c:when>
					<c:when test="${p != paging.nowPage}">
						<li class="page-item"><a class="page-link" href="/admin/admin_getActivityList?nowPage=${p}">${p}</a></li>
					</c:when>
				</c:choose>
			</c:forEach>
			
            <li class="page-item <c:if test="${paging.nowPage >= paging.lastPage}">disabled</c:if>"><a class="page-link" href="/admin/admin_getActivityList?nowPage=${paging.nowPage + 1}">Next</a></li>
        </ul>
    </div>
</div>
<hr/>
							<table>
								<thead>
									
									<tr>
										<th>
											<form action="#" method="post" id="reviewForm" name="reviewForm">
												<div class="row">
													<div class="col-xl-10 col-lg-10 col-md-10 col-sm-10 no-padding">
														<textarea placeholder="이 상품에 대해 리뷰를 작성해 주세요."></textarea>
													</div>
													<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2 no-padding">
														<input type="submit" name="" value="등록하기">
													</div>
												</div>
											</form>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>리뷰~~~~~~~~~~~~~~~~~~~</td>
									</tr>
									<tr>
										<td>리뷰~~~~~~~~~~~~~~~~~~~</td>
									</tr>
									<tr>
										<td>리뷰~~~~~~~~~~~~~~~~~~~</td>
									</tr>
								</tbody>
							</table>
	                    </li>
	                </ul>
	            </div>      <!-- TabMenu -->
			</div>     <!-- Col -->
		</div>      <!-- Row -->
	</div>      <!-- Container -->
</section>

<%@ include file="./template/footer.jsp" %>
</body>
</html>