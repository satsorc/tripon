<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_activity.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/manager_common.css">
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
<!-- header -->

<section>
      <div class="container">
        <hr>
        <form action="insertBoard.do" method="post" enctype="multipart/form-data"></form>
          <!-- ============ 카테고리목록 ============ -->
          <h2>카테고리 목록</h2>
          <div id="selectCategory" class="input-group col-4 mb-3">
            <select class="custom-select" id="inputGroupSelect01">
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
            <div class="input-group mb-3" id="">
              <div class="input-group-prepend">
                <span class="input-group-text">카테고리명</span>
              </div>
              <input
                type="text"
                class="form-control"
                name="title"
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
            <input type="file" class="form-control border" name="uploadFile" />
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
              name="title"
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
              name="title"
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
              name="writer"
              value="${userName}"
              required
            />
          </div>


          <!-- ============ 분류카테고리 썸네일 ============ -->
          <div class="input-group mb-3">
            <div class="input-group-prepend"> 
              <span class="input-group-text">상품 목록 썸네일</span>
                </div>
                <input type="file" class="form-control border" name="uploadFile" />
             </div>
          

          <hr />
         <!--   ===========날짜 선택============== 
          
          <h2>상품 이용날짜 옵션 추가 </h2>
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text">날짜 옵션 1</span>
            </div>
            <input
              type="text"
              class="form-control"
              name="title"
              placeholder="예: 2022년 1월 23일 ~6월 10일"
              required
            />
          </div>

          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text">날짜 옵션 2</span>
            </div>
            <input
              type="text"
              class="form-control"
              name="title"
              placeholder="예: 2022년 1월 23일 ~6월 10일"
              required
            />
          </div>

          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text">날짜 옵션 3</span>
            </div>
            <input
              type="text"
              class="form-control"
              name="title"
              placeholder="예: 2022년 1월 23일 ~6월 10일"
              required
            />
          </div>

          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text">날짜 옵션 4</span>
            </div>
            <input
              type="text"
              class="form-control"
              name="title"
              placeholder="예: 2022년 1월 23일 ~6월 10일"
              required
            />
          </div>
          <hr /> -->
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
                name="writer"
                value=""
                required
              />
              <div class="input-group-prepend">
                <span class="input-group-text">상품가격</span>
              </div>
              <input
                type="text"
                class="form-control"
                name="writer"
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
                name="writer"
                value=""
                required
              />
              <div class="input-group-prepend">
                <span class="input-group-text">상품가격</span>
              </div>
              <input
                type="text"
                class="form-control"
                name="writer"
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
                name="writer"
                value=""
                required
              />
              <div class="input-group-prepend">
                <span class="input-group-text">상품가격</span>
              </div>
              <input
                type="text"
                class="form-control"
                name="writer"
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
                name="writer"
                value=""
                required
              />
              <div class="input-group-prepend">
                <span class="input-group-text">상품가격</span>
              </div>
              <input
                type="text"
                class="form-control"
                name="writer"
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
              name="uploadFile"
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
              name="content"
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
              name="content"
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
              name="uploadFile"
              multiple
            />
          </div>

          <hr/>
          <!-- ============ 위치 관련 ============ -->
          <h2>위치관련</h2>
          
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text">상품 주소</span>
            </div>
            <textarea
              class="form-control"
              rows="2"
              id="announcement"
              name="content"
            ></textarea>
          </div>
          

          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text">위도</span>
            </div>
            <input
              type="text"
              class="form-control"
              name="writer"
              value=""
              required
            />
            <div class="input-group-prepend">
              <span class="input-group-text">경도</span>
            </div>
            <input
              type="text"
              class="form-control"
              name="writer"
              value=""
              required
            />
          </div>


          <div class="inner_btn">
            <button id="conComplete" type="submit" class="btn btn-primary">
              등록
            </button>
            <button id="conList" type="reset" class="btn btn-primary">
              <a href="admin_activityListPage.html">목록</a>
            </button>
          </div>
        </form>
        <!-- form => insertBoard.do -->
      </div>
      <!-- Container -->
    </section>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>