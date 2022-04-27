<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_faqList.css">
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>
<script type="text/javascript">
	$(function() {
		$('.faq-management-menu img').attr('src', '/resources/imgs/notice_management_black.png');
		$('.faq-management-menu a').css('color', '#000000');
		$('.faq-management-menu').css('border-color', '#5622ad');
	});
</script>
	<div class="faqmng">
          <h2>자주 묻는 질문 관리</h2>
          	<div class="top-tap-div">
          		<div class="top-tap">
          			<select class="form-control" id="sel1" name="sellist1">
				        <option>제목</option>
				        <option>내용</option>
				        <option>작성자</option>
				        <option>공지대상</option>
				      </select>
          			<div class="input-group mb-3">
			    		<input type="text" class="form-control" placeholder="Search" col="30">
			    		<div class="input-group-append">
			      			<button class="search-1 btn btn-success" type="submit">검색</button>  
		           			<button class="btn btn-secondary" id="rgtbtn" type="button" onclick="javascript:location.href='admin_insertNotice' ">글등록</button>
			    		</div>
					</div>
	          	</div>
		    </div>
	</div>

	<div class="container-fluid">
		<div class="faqList">
			<table class="table" style="width:100%">
				<thead>
					<tr>
			            <th>삭제</th>
			            <th>번호</th>
			            <th>제목</th>
			            <th>작성자</th>
			            <th>날짜</th>
			            <th>조회수</th>
	          		</tr>
		    	</thead>
		    	<tbody>
		      		<tr>
			            <td><input type="checkbox" name="checkall" class="td_all_chk"></td>
			            <td>1</td>
			            <td onclick="javascript:location.href='admin/noticePage';" style="cursor:pointer;">제목1</td>
			            <td>작성자1</td>
			            <td>2000.00.00</td>
			            <td>1</td>
	          		</tr>
					<tr>
			            <td><input type="checkbox" class="td_all_chk"></td>
			            <td>2</td>
			            <td onclick="javascript:location.href='admin/##############################';" style="cursor:pointer;">제목2</td>
			            <td>작성자2</td>
			            <td>2000.00.00</td>
			            <td>2</td>
					</tr>
					<tr>
			            <td><input type="checkbox" class="td_all_chk"></td>
			            <td>3</td>
			            <td onclick="javascript:location.href='admin/##############################';" style="cursor:pointer;">제목3</td>
			            <td>작성자3</td>
			            <td>2000.00.00</td>
			            <td>3</td>
					</tr>
					<tr>
			            <td><input type="checkbox" class="td_all_chk"></td>
			            <td>4</td>
			            <td onclick="javascript:location.href='admin/##############################';" style="cursor:pointer;">제목4</td>
			            <td>작성자4</td>
			            <td>2000.00.00</td>
			            <td>4</td>
					</tr>
					<tr>
			            <td><input type="checkbox" class="td_all_chk"></td>
			            <td>5</td>
			            <td onclick="javascript:location.href='admin/##############################';" style="cursor:pointer;">제목5</td>
			            <td>작성자5</td>
			            <td>2000.00.00</td>
			            <td>5</td>
					</tr>
					<tr>
			            <td><input type="checkbox" class="td_all_chk"></td>
			            <td>6</td>
			            <td onclick="javascript:location.href='admin/##############################';" style="cursor:pointer;">제목6</td>
			            <td>작성자6</td>
			            <td>2000.00.00</td>
			            <td>6</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="td_all_chk"></td>
						<td>7</td>
						<td onclick="javascript:location.href='admin/##############################';" style="cursor:pointer;">제목7</td>
						<td>작성자7</td>
						<td>2000.00.00</td>
						<td>7</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="td_all_chk"></td>
						<td>8</td>
						<td onclick="javascript:location.href='admin/##############################';" style="cursor:pointer;">제목8</td>
						<td>작성자8</td>
						<td>2000.00.00</td>
						<td>8</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="td_all_chk"></td>
						<td>9</td>
						<td onclick="javascript:location.href='admin/##############################';" style="cursor:pointer;">제목9</td>
						<td>작성자9</td>
						<td>2000.00.00</td>
						<td>9</td>
					</tr>
					<tr>
						<td><input type="checkbox" class="td_all_chk"></td>
						<td>10</td>
						<td onclick="javascript:location.href='admin/##############################';" style="cursor:pointer;">제목10</td>
						<td>작성자10</td>
						<td>2000.00.00</td>
						<td>10</td>
					</tr>
				</tbody>
			</table>
		</div>
	    <div class="deletebtn"> 
	    	<button type="button" class="btn btn-danger" onclick="alert('선택 항목을 삭제하시겠습니까?')">삭제</button>
	    </div>
	</div>
	
	<div>
	  <ul class="pagination">
	    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item"><a class="page-link" href="#">4</a></li>
	    <li class="page-item"><a class="page-link" href="#">5</a></li>
	    <li class="page-item"><a class="page-link" href="#">Next</a></li>
	  </ul>
	</div>
<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>