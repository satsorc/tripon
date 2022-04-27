<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_noticedetail.css">
<script>
	$(function() {
		$('.delete-btn').click(function(){
			var result = confirm("삭제하시겠습니까?");
			if(result == true) {
				$('#delete-form').submit();
			}
		});
	});
</script>
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>

		<div class="newntcbtn">
			<button type="button" class="btn btn-secondary" onclick="javascript:location.href='/admin/getNoticeList'">목록</button>
		</div> 
		<div class="backcol" style=display:block;>
			<div class="ntcmng">
					<div class="menu_flex">  
						<h2>${notice.ntc_title}</h2>
					</div>
			</div>
				<div class="writer_date">작성자 : ${notice.ntc_mem_id}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;작성일 : ${notice.ntc_regdate}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;조회수 : ${notice.ntc_count}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;공지대상 : ${notice.ntc_target}</div>
				<div>${notice.ntc_content}</div>
		</div>
		
		<div class="updatebtn">
			<form action="/admin/admin_noticeUpdate" method="post">
				<input type="hidden" name="ntc_seq" value="${notice.ntc_seq}">
				<input type="hidden" name="ntc_title" value="${notice.ntc_title}">
				<input type="hidden" name="ntc_content" value="${notice.ntc_content}">
				<input type="hidden" name="ntc_target" value="${notice.ntc_target}">
					<button type="submit" class="btn btn-secondary"> 글 수정</button>
			</form>
			<form id="delete-form" action="/admin/deleteNotice" method="post">
				<input type="hidden" name="deleteSeq" value="${notice.ntc_seq}">
					<button type="button" class="btn btn-danger delete-btn" style="margin-left: 10px;"> 삭제</button>
			</form>
		</div>

<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>