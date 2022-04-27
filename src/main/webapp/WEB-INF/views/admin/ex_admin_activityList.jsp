<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_activityList.css">

</head>
<body>
<%@ include file="../template/manager_header.jsp" %>
<!-- header -->

<!-- Section Start -->
<h2>상품 관리 페이지</h2>
<div class="container" id="searchContainer">
    <form action="#" method="post">
        <div class="input-group col-mb-3">
            <select class="custom-select col-2">
                <option value="제목">제목</option>
                <option value="내용">내용</option>
            </select>
            <input type="text" class="form-control" placeholder="search here" aria-label="Recipient's username" aria-describedby="button-addon2">
            <div class="input-group-append">
                <button type="submit" class="btn btn-outline-secondary">검색</button>
            </div>
        </div>
    </form>
</div>
<div class="container" id="admin_activityList">
    <table>
        <thead>
            <tr>
                <th>상품번호</th>
                <th>상품명</th>
                <th>작성자</th>
                <th>등록일</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${activityList}" var="activity">
            <tr onclick="location.href='admin_getActivity?act_num=${activity.act_num}'">
                <td>${activity.act_num}</td>
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
            <li class="page-item <c:if test="${paging.nowPage >= paging.endPage}">disabled</c:if>"><a class="page-link" href="/admin/admin_getActivityList?nowPage=${paging.nowPage + 1}">Next</a></li>
        </ul>
        
        <div class="insert_btn">
            <a href="/admin/admin_insertActivity" class="btn btn-primary pull-right">상품등록</a>
        </div>
    </div>
</div>
<!-- Section End-->

<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>