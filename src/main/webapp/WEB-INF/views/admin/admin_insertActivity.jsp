<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_insertActivity.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/manager_common.css">
<script type="text/javascript">
	$(document).ready(function() {

	    $('#category').hide();
	    $('#mainCategory').hide();
	    $('#addCategory').click(function() {
	        $('#category').toggle();
	        $('#mainCategory').toggle();
	    });

	    $('#addOption01').hide();
	    $('#addOption02').hide();
	    $('#addOption03').hide();
	    $("#addOption").click(function() {
	        $('#addOption01').toggle();
	        $('#addOption02').toggle();
	        $('#addOption03').toggle();
	    });
	    
	});
</script>
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>
<script type="text/javascript">
	$(function() {
		$('.package-management-menu img').attr('src', '/resources/imgs/package_management_black.png');
		$('.package-management-menu a').css('color', '#000000');
		$('.package-management-menu').css('border-color', '#5622ad');
	});
</script>

<section>
	<div class="container">
	<form action="admin_insertActivityPage.jsp" method="post" enctype="multipart/form-data">
	  <hr
	    action="insertBoard.do"
	    method="post"
	    enctype="multipart/form-data"
	  >
	    <!-- ============ 카테고리목록 ============ -->
	    <h2>카테고리 목록</h2>
	    <div id="selectCategory" class="input-group col-4 mb-3">
	      <select class="custom-select" id="inputGroupSelect01" name="cat_num">
	        <option selected>지역 선택</option>
	        <option value="1">서울</option>
	        <option value="2">강원도</option>
	        <option value="3">경기도</option>
	      </select>
	    </div>
	
	    <!-- ============ 카테고리명 ============ -->
	    <button id="addCategory" type="button" class="btn btn-primary">
	      새로운 카테고리 추가
	    </button>
	    <div id="category">
	      <div class="input-group mb-3">
	        <div class="input-group-prepend">
	          <span class="input-group-text">카테고리명</span>
	        </div>
	        <input
	          type="text"
	          class="form-control"
	          name="cat_name"
	          placeholder="카테고리명을 입력하세요."
	          required
	        />
	      </div>
	    </div>
	    <!-- ============ 메인카테고리 썸네일 ============ -->
	    <div class="input-group mb-3" id="mainCategory">
	      <div class="input-group-prepend">
	        <span class="input-group-text">카테고리 썸네일</span>
	      </div>
	      <input type="file" class="form-control border" name="cat_uploadFile" />
	    </div>
	
	    <hr />
	    <!-- ============ 상품명 ============ -->
	    <h2>상품명 & 작성자</h2>
	    <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text">상품명</span>
	      </div>
	      <input
	        type="text"
	        class="form-control"
	        name="act_maintitle"
	        placeholder="상품명을 입력하세요."
	        required
	      />
	    </div>
	    <!-- ============ 상품명정보 ============ -->
	    <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text">상품명설명</span>
	      </div>
	      <input
	        type="text"
	        class="form-control"
	        name="act_subtitle"
	        placeholder="상품정보를 입력하세요"
	        required
	      />
	    </div>
	
	    <!-- ============ 작성자 ============ -->
	    <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text">작성자</span>
	      </div>
	      <input
	        type="text"
	        class="form-control"
	        name="act_writer"
	        value="${userName}"
	        required
	      />
	    </div>
	
	
	    <!-- ============ 분류카테고리 썸네일 ============ -->
	    <div class="input-group mb-3">
	      <div class="input-group-prepend"> 
	        <span class="input-group-text">상품 목록 썸네일</span>
	          </div>
	          <input type="file" class="form-control border" name="act_thumbnail" />
	       </div>
	    
	
	    <hr />
	
	    <!-- ============ 상품옵션 ============ -->
	    <h2>상품 옵션 추가 & 입력</h2>
	    <button id="addOption" type="button" class="btn btn-primary">
	      상품옵션 추가
	    </button>
	    <div id="packagePlace">
	      <div class="input-group mb-3">
	        <div class="input-group-prepend">
	          <span class="input-group-text">상품옵션</span>
	        </div>
	        <input
	          type="text"
	          class="form-control"
	          name="opt_name"
	          value=""
	          required
	        />
	        <div class="input-group-prepend">
	          <span class="input-group-text">상품가격</span>
	        </div>
	        <input
	          type="text"
	          class="form-control"
	          name="opt_price"
	          value=""
	          required
	        />
	      </div>
	      <div class="input-group mb-3" id="addOption01">
	        <div class="input-group-prepend">
	          <span class="input-group-text">상품옵션</span>
	        </div>
	        <input
	          type="text"
	          class="form-control"
	          name="opt_name"
	          value=""
	          required
	        />
	        <div class="input-group-prepend">
	          <span class="input-group-text">상품가격</span>
	        </div>
	        <input
	          type="text"
	          class="form-control"
	          name="opt_price"
	          value=""
	          required
	        />
	      </div>
	      <div class="input-group mb-3" id="addOption02">
	        <div class="input-group-prepend">
	          <span class="input-group-text">상품옵션</span>
	        </div>
	        <input
	          type="text"
	          class="form-control"
	          name="opt_name"
	          value=""
	          required
	        />
	        <div class="input-group-prepend">
	          <span class="input-group-text">상품가격</span>
	        </div>
	        <input
	          type="text"
	          class="form-control"
	          name="opt_price"
	          value=""
	          required
	        />
	      </div>
	      <div class="input-group mb-3" id="addOption03">
	        <div class="input-group-prepend">
	          <span class="input-group-text">상품옵션</span>
	        </div>
	        <input
	          type="text"
	          class="form-control"
	          name="opt_name"
	          value=""
	          required
	        />
	        <div class="input-group-prepend">
	          <span class="input-group-text">상품가격</span>
	        </div>
	        <input
	          type="text"
	          class="form-control"
	          name="opt_price"
	          value=""
	          required
	        />
	      </div>
	    </div>
	
	    <hr/>
	    <!-- ============ 상품이미지등록 ============ -->
	    <h2>상품 관련</h2>
	    <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text"
	          >메인 이미지(사이즈 550x500 권장)</span
	        >
	      </div>
	      <input
	        type="file"
	        class="form-control border"
	        name="act_mainimg"
	        multiple
	      />
	    </div>
	    <!-- ============ 상품공지사항 ============ -->
	    <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text">공지사항</span>
	      </div>
	      <textarea
	        class="form-control"
	        rows="5"
	        id="announcement"
	        name="act_announcement"
	      ></textarea>
	    </div>
	    <!-- ============ 상품설명 ============ -->
	    <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text">상품설명</span>
	      </div>
	      <textarea
	        class="form-control"
	        rows="10"
	        id="act_desc"
	        name="act_content"
	      ></textarea>
	    </div>
	
	
	    <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text"
	          >상품 설명 이미지(사이즈 550x500 권장)</span
	        >
	      </div>
	      <input
	        type="file"
	        class="form-control border"
	        name="act_descimg"
	        multiple
	      />
	    </div>
	
	    <hr/>
	    <!-- ============ 위치 관련 ============ -->
	    <!-- <h2>위치관련</h2>
	    
	    <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text">상품 주소</span>
	      </div>
	      <textarea
	        class="form-control"
	        rows="2"
	        id="announcement"
	        name="act_address"
	      ></textarea>
	    </div> -->
	    
	
	    <!-- <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text">위도</span>
	      </div>
	      <input
	        type="text"
	        class="form-control"
	        name="act_latitude"
	        value=""
	        required
	      />
	      <div class="input-group-prepend">
	        <span class="input-group-text">경도</span>
	      </div>
	      <input
	        type="text"
	        class="form-control"
	        name="act_longitude"
	        value=""
	        required
	      />
	    </div> -->
	  </form>
	  <!-- form => insertBoard.do -->
	
	
	    <div class="inner_btn">
	      <button id="conComplete" type="submit" class="btn btn-primary">
	        등록
	      </button>
	      <button id="conList" type="reset" class="btn btn-primary">
	        <a href="admin_activityListPage.jsp">목록</a>
	      </button>
	    </div>
	</div>
	<!-- Container -->
	</section>



<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>