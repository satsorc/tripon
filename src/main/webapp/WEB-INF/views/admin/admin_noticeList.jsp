<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="rt" value="${noticeTotal.total}"/>
<c:set var="lc" value="${noticeTotal.listCnt}"/>
<c:set var="pageTotal" value="1"/>
<c:choose>
	<c:when test="${rt % lc eq 0}">
		<c:set var="pageTotal" value="${rt / lc}"/>
	</c:when>
	<c:otherwise>
		<c:set var="pageTotal" value="${rt / lc + 1}"/>
	</c:otherwise>
</c:choose>
<c:set var="pageNum" value="${param.pageNum}"/>
<c:if test="${param.pageNum eq null || param.pageNum eq 1}">
	<c:set var="pageNum" value="1"/>
</c:if>
<c:set var="msg1" value=""/>
<c:set var="msg2" value=""/>
<c:if test="${pageNum <= 1}">
	<c:set var="msg1" value=" disabled"/>
</c:if>
<c:if test="${pageNum + 1 > pageTotal}">
	<c:set var="msg2" value=" disabled"/>
</c:if>



<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_noticeList.css">
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>
<script type="text/javascript">
// 	history.pushState(null, null, location.href);
// 	window.onpopstate = function(event) {
// 		var prevUrl = document.referrer;
// 		console.log(prevUrl);
// 		alert(prevUrl);
// 		history.go();
// 	};
	$(function() {
		$('.notice-management-menu img').attr('src', '/resources/imgs/notice_management_black.png');
		$('.notice-management-menu a').css('color', '#000000');
		$('.notice-management-menu').css('border-color', '#5622ad');
		
		$('.delete-btn').click(function() {
			var checked = $('input[type=checkbox]:checked').length;
			if(checked == 0) {
				alert('항목을 선택해주세요.');
			} else {
				var result = confirm(checked + '개 항목이 선택되었습니다. 삭제하시겠습니까?');
				console.log(result);
				if(result == true) {
					$('#delete-form').submit();
				}
			}
		});
	});
</script>
	<div class="ntcmng">
		<h2>공지사항 관리</h2>
		<div class="top-tap-div">
			<form action="/admin/getNoticeList" method="get">
				<div class="top-tap">
					<select class="form-control" id="sel1" name="searchCondition">
						<option value="NTC_TITLE" selected>제목</option>
						<option value="NTC_CONTENT">내용</option>
						<option value="NTC_MEM_ID">작성자</option>
						<option value="NTC_TARGET">공지대상</option>
					</select>
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Search" name="searchKeyword">
						<div class="input-group-append">
							<button class="search-1 btn btn-success" type="submit">검색</button>  
							<button class="btn btn-secondary" id="rgtbtn" type="button" onclick="javascript:location.href='/admin/admin_insertNotice'">글등록</button>
						</div>
		    		</div>
				</div>
			</form>
		</div>
    </div>
	<form id="delete-form" action="/admin/deleteNotice" method="post">
		<div class="container-fluid">
			<div class="noticeList">
				<table class="table" style="width:100%">
					<thead>
						<tr>
				            <th style="width: 10%">삭제</th>
				            <th style="width: 30%">제목</th>
				            <th style="width: 15%">작성자</th>
				            <th style="width: 20%">작성일</th>
				            <th style="width: 10%">조회수</th>
				            <th style="width: 15%">공지대상</th>
		          		</tr>
			    	</thead>
			    	<tbody>
			    	<c:choose>
			    		<c:when test="${noticeList.size() < 1}">
			    			<tr>
			    				<td style="padding-top: 80px;" colspan="6">검색 결과가 없습니다.</td>
			    			</tr>
			    		</c:when>
			    		<c:otherwise>
				    		<c:forEach items="${noticeList}" var="notice">
					      		<tr>
						            <td style="padding: 20px 0px;"><input type="checkbox" name="deleteSeq" class="td_all_chk" value="${notice.ntc_seq}"></td>
						            <td style="padding: 20px 0px; cursor:pointer;" onclick="location.href='/admin/getNotice?ntc_seq=${notice.ntc_seq}';">${notice.ntc_title}</td>
						            <td style="padding: 20px 0px; cursor:pointer;" onclick="location.href='/admin/getNotice?ntc_seq=${notice.ntc_seq}';">${notice.ntc_mem_id}</td>
						            <td style="padding: 20px 0px; cursor:pointer;" onclick="location.href='/admin/getNotice?ntc_seq=${notice.ntc_seq}';">${notice.ntc_regdate}</td>
						            <td style="padding: 20px 0px; cursor:pointer;" onclick="location.href='/admin/getNotice?ntc_seq=${notice.ntc_seq}';">${notice.ntc_count}</td>
						            <td style="padding: 20px 0px; cursor:pointer;" onclick="location.href='/admin/getNotice?ntc_seq=${notice.ntc_seq}';">${notice.ntc_target}</td>
				          		</tr>
			                </c:forEach>
			    		</c:otherwise>
			    	</c:choose>
						
					</tbody>
				</table>
			</div>
		    <div class="bottombtn"> 
		    	<button type="button" class="btn btn-danger delete-btn">글 삭제</button>
		    </div>
		</div>
	</form>
	
	<div>
	  <ul class="pagination">
	    <li class="page-item${msg1}"><a class="page-link" href="/admin/getNoticeList?pageNum=${pageNum - 1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">Previous</a></li>
	    <c:forEach var="i" begin="1" end="${pageTotal}" step="1">
	    	<c:choose>
	    		<c:when test="${i eq pageNum}">
				    <li class="page-item active"><a class="page-link" href="/admin/getNoticeList?pageNum=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${i}</a></li>
	    		</c:when>
	    		<c:otherwise>
				    <li class="page-item"><a class="page-link" href="/admin/getNoticeList?pageNum=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${i}</a></li>
	    		</c:otherwise>
	    	</c:choose>
	    </c:forEach>
	    <li class="page-item${msg2}"><a class="page-link" href="/admin/getNoticeList?pageNum=${pageNum + 1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">Next</a></li>
	  </ul>
	</div>
<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>