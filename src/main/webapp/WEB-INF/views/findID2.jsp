<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findID2.css">
</head>
<body>
<%@ include file="./template/find_header.jsp" %>

<div class="container">
<div class="findID">
<h2>아이디 찾기</h2>
<br><br>
<h1>입력하신 정보와</h1><h1>일치하는 아이디 정보입니다.</h1>
<br><br>

<form action="/login">
	
	<h3>아이디 찾기 결과</h3>
	<div class="subject_underline"></div>
	<br>
	<h4 class="hc">tripON ID</h4>

	<h5>${user.mem_id}</h5>

	<div class="subject_underline2"></div>
		
	<div class="submit">
		<input type="submit" value="확인">
   	</div>

</form>
</div>
</div>
</body>
<%@ include file="./template/footer.jsp" %>
</html>