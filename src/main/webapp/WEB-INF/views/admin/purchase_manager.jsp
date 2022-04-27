<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/purchase_manager.css">
</head>
<body>
	<%@ include file="../template/manager_header.jsp" %>
	<script type="text/javascript">
		$(function() {
			$('.purchase-management-menu img').attr('src', '/resources/imgs/purchase_management_black.png');
			$('.purchase-management-menu a').css('color', '#000000');
			$('.purchase-management-menu').css('border-color', '#5622ad');
		});
	</script>
	
	<!-- 관리자 결제 페이지 HEADER -->
	<div class="container-fluid">
	         <div class="purchase-title">관리자 - 결제 페이지</div>
	</div>
	<br>
	
	<!-- 관리자 결제 페이지 CONTENTS -->
	<div class="container-fluid">
	         <div class="purchase-title-contents">관리자 결제 페이지입니다.</div>
	         <div class="purchase-title-contents">결제 목록을 확인하고 결제를 취소 할 수 있습니다.</div>
	</div>
	<br>
	
	<!-- large menu -->
	<div id="large-menu">
		<!-- 관리자 결제 페이지 BODY start-->
		<div class="purchase-body">
		<!-- 관리자 결제 페이지 BODY HEADER -->
		<div class="purchase-body-header"></div>
		
		<!-- 관리자 결제 페이지 TOP_MENU -->
		<div class="container-fluid">
		         <div class="purchase-top-menu list-group-item">
		         <div class="row">
		         	<div class="col-2">번호</div>
		            <div class="col-2">사용자 정보</div>
		            <div class="col-6">구입 상품</div>
		            <div class="col">관리</div>
		         </div>
		         </div>
		</div>
		
		<!-- 관리자 결제 페이지 LIST -->
		<c:forEach items="${puchaselist}" var="purchase">
		<div class="container-fluid">
		         <div class="purchase-list list-group-item">
		         <div class="row purchase-list-line">
		         	
		         	<div class="col-2">${purchase.pur_num}</div>
		            <div class="col-2">${purchase.pur_user_id}</div>
		            <div class="col-6">${purchase.pur_act_title}</div>
		            <div class="col">
		                  <button class="purchase-view btn btn-primary btn-sm" id="viewbtn-${purchase.pur_num}"><span>상세 보기</span></button>
		            </div>
	
		         </div>
		         </div>
		</div>
		
		<div class="container-fluid">
		         <div class="purchase-list-view list-group-item" id="view-${purchase.pur_num}">
		         <div class="row purchase-list-view-line">
		         	<div class="col-2"></div>
		            <div class="col-4">유저 ID : ${purchase.pur_user_id}</div>
		            <div class="col-4">유저 이름 : ${purchase.pur_user_name}</div>
		            <div class="col">
		               <!-- Button trigger modal -->
		               <button type="button" class="purchase-Order-Cancel-btn btn btn-danger btn-sm" data-toggle="modal" data-target="#exampleModal">
		                   	결제 취소
		               </button>
		            </div>
		            <div class="col-2"></div>
		            <div class="col-4">결제 고유 ID : ${purchase.pur_impid}</div>
		            <div class="col-4">결제 상태 : ${purchase.pur_statenum}</div>
		            <div class="col"></div>
		            <div class="col-2"></div> 
		            <div class="col-4">결제 날짜 : <fmt:formatDate value="${purchase.pur_purchasedate}" pattern="yyyy-MM-dd KK:mm:ss"/></div>
		            <div class="col-4">예약 날짜 : <fmt:formatDate value="${purchase.pur_bookingdate}" pattern="yyyy-MM-dd KK:mm:ss"/></div>
		            <div class="col"></div>
		            
		            
		            <div class="col-2"></div>
		            <div class="col-4">상품 이름 : ${purchase.pur_act_title}</div>
		            <div class="col-4">상품 가격 : ${purchase.pur_price}</div>
		            <div class="col"></div>
		            <div class="col-2"></div>
		            <div class="col-4">패키지 옵션 1 : ${purchase.pur_opt_name_1}</div>
		            <div class="col-4">패키지 옵션 1 수량 : ${purchase.pur_opt_count_1}</div>
		            <div class="col"></div>
		            <div class="col-2"></div>
		            <div class="col-4">패키지 옵션 2 : ${purchase.pur_opt_name_2}</div>
		            <div class="col-4">패키지 옵션 2 수량 : ${purchase.pur_opt_count_2}</div>
		            <div class="col"></div>
		            <div class="col-2"></div>
		            <div class="col-4">패키지 옵션 3 : ${purchase.pur_opt_name_3}</div>
		            <div class="col-4">패키지 옵션 3 수량 : ${purchase.pur_opt_count_3}</div>
		            <div class="col"></div>
		            <div class="col-2"></div>
		            <div class="col-4">패키지 옵션 4 : ${purchase.pur_opt_name_4}</div>
		            <div class="col-4">패키지 옵션 4 수량 : ${purchase.pur_opt_count_4}</div>
		            <div class="col"></div>
		         </div>
		         </div>
		</div>
		
		</c:forEach>
		<!-- 관리자 결제 페이지 LIST [결제 취소됨]-->
	<!-- 	<div class="container-fluid"> -->
	<!-- 	         <div class="purchase-list list-group-item"> -->
	<!-- 		         <div class="row"> -->
	<!-- 		         	<div class="col-sm-2">1</div> -->
	<!-- 		            <div class="col-sm-2">사용자1</div> -->
	<!-- 		            <div class="col-sm-6">상품1</div> -->
	<!-- 		            <div class="canceltext col-sm">결제 취소</div> -->
	<!-- 		         </div> -->
	<!-- 	         </div> -->
	<!-- 	</div> -->
		
		<!-- 관리자 결제 페이지 BODY FOOTER -->
		<div class="container-fluid">
		<div class="purchase-body-footer"></div>
		</div>
		
		<!-- 관리자 결제 페이지 BODY end.-->
		</div>
		<br>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
				정말 결제를 취소하시겠습니까?
				</div>
				<div class="modal-footer">
				<button type="button"class="purchase-Order-Cancel-btn btn btn-danger btn-sm" id="">결제 취소</button>
				<button type="button" class="purchase-exit-btn btn btn-dark  btn-sm" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal end. -->
	
	<div>
		<ul class="pagination justify-content-center">
			<li class='page-item <c:if test="${paging.nowPage <= 1 }">disabled</c:if>'><a class="page-link" href="/admin/userList?nowPage=${paging.nowPage - 1 }" style="color: #8b8b8d;">Previous</a></li>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="page-item active"><a class="page-link">${p }</a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li class="page-item"><a class="page-link" href="/admin/userList?nowPage=${p }">${p }</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<li class='page-item <c:if test="${paging.nowPage >= paging.endPage }">disabled</c:if>'><a class="page-link" href="/admin/userList?nowPage=${paging.nowPage+1}" style="color: #8b8b8d;">Next</a></li>
			</ul>				
		</div>
	
	<!-- 관리자 페이지 LIST VIEW JSP-->
	<script>
	  const items = document.querySelectorAll('.purchase-view');
	
	  function openCloseView() {
	    const viewerId = this.id.replace('viewbtn', 'view');
	
	    if(document.getElementById(viewerId).style.display === 'block') {
			document.getElementById(viewerId).style.display = 'none';
	    } else {
			document.getElementById(viewerId).style.display = 'block';
	    }
	  } 
	  items.forEach(item=>item.addEventListener('click', openCloseView));
	  
	 </script>
	 
	<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>