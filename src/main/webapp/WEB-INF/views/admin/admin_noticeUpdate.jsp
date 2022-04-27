<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../template/head.jsp" %>
<c:set var="ln" value="\n"/>
<c:set var="content" value="${param.ntc_content}"/>
<c:set var="newContent" value="${fn:replace(content, '<br>', '')}"/>

<c:set var="msg1" value=""/>
<c:set var="msg2" value=""/>
<c:if test="${param.ntc_target eq '사용자'}">
	<c:set var="msg1" value="selected"/>
</c:if>
<c:if test="${param.ntc_target eq '관리자'}">
	<c:set var="msg2" value="selected"/>
</c:if>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_noticeUpdate.css">
<script type="text/javascript">
	$(function() {
		$('.notice-management-menu img').attr('src', '/resources/imgs/notice_management_black.png');
		$('.notice-management-menu a').css('color', '#000000');
		$('.notice-management-menu').css('border-color', '#5622ad');
		
		$('.update-btn').click(function(){
			var result = confirm('수정하시겠습니까?');
			if(result == true){
				$('#update-form').submit();
			}
		});
	});
</script>
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>
	<div class="ntcmng">
		<div class="menu_flex">  
			<h2>글 수정</h2>
		</div>
		<div class="newntcbtn">
			<button type="button" class="btn btn-secondary" onclick="javascript:location.href='/admin/getNoticeList'">목록</button>
		</div> 
 	</div>		
	<form id="update-form" action="/admin/updateNotice" method="post">
		<input type="hidden" name="ntc_seq" value="${param.ntc_seq}">
		<div class="insertList">
			<div class="container-fluid">
				<table>
					<tr>
						<td>제목</td>
						<td colspan="3"> 
							<div class="form-group">
								<input type="text" class="form-control" id="usr" name="ntc_title" value="${param.ntc_title}">
							</div>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">
							<div class="form-group">
								<textarea class="form-control" rows="15" id="comment" name="ntc_content">${newContent}</textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td>공지대상</td>
						<td>
							<div class="form-group">
								<select id="target-select">
									<option value="choice">선택</option>
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${param.ntc_target eq '사용자'}"> --%>
<!-- 											<option value="사용자" selected>사용자</option> -->
<%-- 										</c:when> --%>
<%-- 										<c:otherwise> --%>
<!-- 											<option value="사용자">사용자</option> -->
<%-- 										</c:otherwise> --%>
<%-- 									</c:choose> --%>
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${param.ntc_target eq '관리자'}"> --%>
<!-- 											<option value="관리자" selected>관리자</option> -->
<%-- 										</c:when> --%>
<%-- 										<c:otherwise> --%>
<!-- 											<option value="관리자">관리자</option> -->
<%-- 										</c:otherwise> --%>
<%-- 									</c:choose> --%>
									
									<c:set var="msg1" value=""/>
									<c:set var="msg2" value=""/>
									<c:if test="${param.ntc_target eq '사용자'}">
										<c:set var="msg1" value="selected"/>
									</c:if>
									<c:if test="${param.ntc_target eq '관리자'}">
										<c:set var="msg2" value="selected"/>
									</c:if>
									
									<option value="사용자" ${msg1}>사용자</option>
									<option value="관리자" ${msg2}>관리자</option>
								</select>
							</div>
						</td>
						<td>첨부파일</td>
						<td >
							<div class="form-group">
								<div class="attachement">
									<table style="width:100%">
										<div class="form-group"> 
											<input disabled id="fileInput" name="uploadFile" filestyle="" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);" disabled="disabled"> 
											<div class="bootstrap-filestyle input-group"> 
												<input type="text" id="userfile" class="form-control" name="ntc_filename" disabled="disabled"> 
												<span class="group-span-filestyle input-group-btn" tabindex="0"> 
													<label for="fileInput" class="btn btn-default"> 
														<span class="glyphicon fa fa-upload"></span> 
													</label> 
												</span> 
											</div> 
										</div>
									</table>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
     <!-- <div class="attachement">
         <table style="width:100%">
             <div class="form-group"> 
                 <label for="InputSubject1">파일첨부</label> 
                 <input id="fileInput" filestyle="" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);"> 
                 <div class="bootstrap-filestyle input-group"> 
                     <input type="text" id="userfile" class="form-control" name="userfile" disabled=""> 
                     <span class="group-span-filestyle input-group-btn" tabindex="0"> 
                         <label for="fileInput" class="btn btn-default"> 
                             <span class="glyphicon fa fa-upload"></span> 
                         </label> 
                     </span> 
                 </div> 
             </div>
         </table>
     </div> -->
		<div class="savebtn">
			<button type="button" class="btn btn-success update-btn">저장</button>
		</div> 
	</form>


<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>