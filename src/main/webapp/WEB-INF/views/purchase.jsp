<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script><!-- jQuery CDN --->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

var chk = false;

    $(document).ready(function(){
    	var IMP = window.IMP;
    	IMP.init('${impKey}');
	    $("#checkBoxId").change(function(){
	        if($("#checkBoxId").is(":checked")){
	            $('#purchaseFormButton').css('background-color', '#5F04F9')
	        }else{
	            $('#purchaseFormButton').css('background-color', 'gray')
	        }
	    });
	    
	    $("#emailSelect").change(function() {
	        var select = $('#emailSelect').val();
	        if(select == "") {
	            $("#afterEmail").val("");
	            $("#afterEmail").attr("readonly", false);
	        } else {
	            $("#afterEmail").val(select);
	            $("#afterEmail").attr("readonly", true);
	        }
	    });
	
	    $("#purchaseFormButton").on('click', function(){
	    	alert("111");
	        var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	        var getName= RegExp(/^[가-힣]+$/);
	        var getNum = /^[0-9]*$/;
	
	        var status = 1;
	
	        if($("#inputName").val().length < 1) {
	            $('#errorName').css('visibility', 'visible');
	            $('#errorName').text("이름을 입력해주세요.");
	            status = 0;
	        } else if(!getName.test($("#inputName").val())) {
	            $('#errorName').css('visibility', 'visible');
	            $('#errorName').text("한글만 입력해주세요");
	            status = 0;
	        } else {
	            $('#errorName').css('visibility', 'hidden');
	        }
	
	        if($("#inputPhone").val().length < 1) {
	            $('#errorPhone').css('visibility', 'visible');
	            $('#errorPhone').text("전화번호를 입력해주세요.");
	            status = 0;
	        } else if(!($.isNumeric($('#inputPhone').val()))) {
	            $('#errorPhone').css('visibility', 'visible');
	            $('#errorPhone').text("숫자만 입력하세요.");
	            status = 0;
	        } else {
	            $('#errorPhone').css('visibility', 'hidden');
	        }
	        
	        var umail = $("#beforeEmail").val() + "@" +  $("#afterEmail").val();
	
	        if($("#beforeEmail").val().length < 1 || $("#afterEmail").val().length < 1 || !getMail.test(umail)) {
	            $('#errorEmail').css('visibility', 'visible');
	            status = 0;
	        } else {
	            $('#errorEmail').css('visibility', 'hidden');
	            $('#umail').val(umail);
	        }
	
	        if($('#checkBoxId').is(':checked') == false && status == 1) {
                alert("약관에 동의해주셔야 결제가 진행됩니다.");
                status = 0;
	        } 
	        
	        
	        
	        if(status == 0) {
	            return false;
	        } else {
	        	IMP.request_pay({
	    			pg: 'inicis', // 자신이 설정한 pg사 설정
	    			pay_method: 'card',
	    			merchant_uid: 'merchant_' + new Date().getTime(),
	    			name: $('#productName').text(),
	    			amount: parseInt($("#finalprice").text()),
	    			buyer_email: umail ,
	    			buyer_name: $("#inputName").val() ,
	    			buyer_tel: $("#inputPhone").val() ,
	    			/* buyer_addr: $("#uaddr").val() , */
// 	    			buyer_postcode: '123-456',
	    			m_redirect_url: 'http://localhost:8080/payments/complete'
	    			}, function (rsp) {
	    				console.log(rsp);
	    				if (rsp.success) {
	    					var msg = '결제가 완료되었습니다.';
	    					msg += '\n고유ID : ' + rsp.imp_uid;
	    					msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    					msg += '\n결제 금액 : ' + rsp.paid_amount;
	    					msg += '\n카드 승인번호 : ' + rsp.apply_num;
	    					
	    					$("#imp_uid").val(rsp.imp_uid);
	    					$("#merchant_uid").val(rsp.merchant_uid);
	    					chk = true;
	    				} else {
	    					var msg = '결제에 실패하였습니다.';
	    					msg += '\n에러내용 : ' + rsp.error_msg;
	    				}
	    				alert(msg);
	    				if(chk==true) orderList();
	    		});
	        }
	
	   	});
	});
    
    function orderList(){
    	alert('주문내역 처리할 곳. 컨트롤러 호출');
    	let fm = document.fm;
    	fm.action ="purchaseok";
    	fm.method="post";
    	fm.submit();
    }
    </script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/purchase.css">
</head>
<body>
<%@ include file="./template/header.jsp" %>
    <form name="fm">
    <div class="container" id="body">
        <div id="purchaseTitle" >
            <p>주문결제</p>
        </div>
        <div class="product">
            <div class="col-8 con con1"><p>주문 상품</p></div>
            <div class="col-4 con con2"><p>가격</p></div>
        </div>
        <br>
        <div class="row productContext">
            <div class="col-lg-8 col-sm-8 productCon">
                <div>
                    <img id="productImg" src="${pageContext.request.contextPath}/resources/imgs/img.jpg" alt="더미">
                </div>
                <div>
                    <div><b>상품이름 : </b><b id="productName">테스트</b></div>
                    <p id="productDate">예약일자 : 2000. 10. 10.</p>
                    <p id="productOption">상품옵션 : 테스트옵션</p>
                    <!-- <p>기타사항 : 기타사항 내용</p> -->
                    <p id="productCount">수량 : 1</p>
                </div>
            </div>
            <div class="col-lg-4 col-sm-4 productPrice">
                <br><br>
                <p>100원</p>
                <br><br>
            </div>
        </div>
        <hr>
        <br>
        <div id="secondBox">
            <div class="col-lg-7 col-sm-12 secondBoxUser">
                <div class="con conUser">
                    <p>주문자 정보</p>
                </div>
                <br>
                <div id="userinput">
                    <ul class="user">
                        <li>이름</li>
                        <li>전화번호</li>
                        <li>이메일</li>
                    </ul>
                    <div class="inputText">
                        <input name="unm" type="text" class="form-control" id="inputName" required>
                        <p class="errormessage" id="errorName">이름을 올바르게 입력해주세요.</p>
                        <input name="utel" type="text" class="form-control" id="inputPhone" required>
                        <p class="errormessage" id="errorPhone">전화번호를 올바르게 입력해주세요.</p>
                        <div class="email-input-group">
                            <input type="text" class="form-control" id="beforeEmail" required><span>&nbsp;@&nbsp;</span>
                            <input id="afterEmail" type="text" value="" class="form-control" readonly="readonly" required>
                            <select id="emailSelect">
                                <option value=" ">선택하세요</option>
                                <option value="naver.com">naver.com</option>
                                <option value="kakao.com">kakao.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="hotmail.com">hotmail.com</option>
                                <option value="">직접 입력</option>
                            </select>
                            <input id="umail" name="umail" type="hidden" value="">
                        </div>
                        <p class="errormessage" id="errorEmail">이메일을 올바르게 입력해주세요.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-1 blankbox">&nbsp;</div>
            <div class="col-lg-4 col-sm-12" id="purchaseBox">
                <div id="finalPurchase">
                    <p>최종 결제 금액</p>
                    <hr>
                    <div><p id="finalprice">100원</p></div>
                    <div id="purchaseCheck">
                        <input class="checkbox" id="checkBoxId" type="checkbox">
                        <label for="checkBoxId"></label>
                        <label id="checklabel" for="checkBoxId">구매하실 상품의 판매조건을 명확히 확인하였으며,<span><br></span> 이에 동의합니다. (전자상거래법 제8조 2항)</label>
                    </div>
                </div>
                <div id="purchaseButton">
                    <a id="purchaseFormButton">결제하기</a><br>
                    <a href="#">결제취소</a>
                </div>
            </div>
        </div>
        <br>
        <hr>
    </div>
    <input type="hidden" name="pur_impId" value="1">
    <input type="hidden" name="pur_merchantId" value="1">
    <input type="hidden" name="pur_num" value="1">
    <input type="hidden" name="pur_user_id" value="1">
    <input type="hidden" name="pur_user_name" value="1">
    <input type="hidden" name="pur_act_title" value="1">
    <input type="hidden" name="pur_price" value="1">
    <input type="hidden" name="pur_opt_name_1" value="1">
    <input type="hidden" name="pur_opt_name_2" value="1">
    <input type="hidden" name="pur_opt_name_3" value="1">
    <input type="hidden" name="pur_opt_name_4" value="1">
    <input type="hidden" name="pur_opt_count_1" value="1">
    <input type="hidden" name="pur_opt_count_2" value="1">
    <input type="hidden" name="pur_opt_count_3" value="1">
    <input type="hidden" name="pur_opt_count_4" value="1">
    <input type="hidden" name="pur_price" value="1">
    <input type="hidden" name="pur_statenum" value="1">
    <input type="hidden" name="pur_purchaseDate" value="1">
    <input type="hidden" name="pur_bookingDate" value="1">
</form>
<%@ include file="./template/footer.jsp" %>
</body>
</html>




