<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/info_managementPage.css">
</head>
</head>
<script>
    $(function() {
// 	   	window.onpopstate = function(event) {
//    		window.history.pushState(null, '', location.href);
// 	   		console.log('go back!');
// 	   		history.go(1);
// 	   	};
		if($('#nickname-input').val() == '') {
			history.go(1);
		}
    	
		var nicknameCheckBoo = false;
		var phonenumCheckBoo = false;
		var passwordCheckBoo = false;
		var nickname, oldPassword, newPassword, phoneNumber, authenticationNumber;
		var ni_icf = $('#nickname-input + .invalid-check-feedback');
		var pi_icf_1 = $('#phonenum-input-1 + .invalid-check-feedback');
		var pi_icf_2 = $('#phonenum-input-2 + .invalid-check-feedback');
		
    	$('.invalid-check-feedback').hide();
    	$('.certification-group-2').hide();
    	
    	// '수정' 버튼 클릭 시 input 요소 나타내고, '수정 취소' 버튼 클릭 시 input 요소 사라지게 하기
        $('.update-btn').click(function() {
            var id = $(this).attr("id");
            $('button#' + id + '+ div.update-group').toggle();
            $(this).toggle();
        });
        $('.cancel-btn').click(function() {
            $(this).parent().prev().toggle();
            $(this).parent().toggle();
            var parent_id = $(this).parent().attr('id');
            $('#' + parent_id + ' input').val('');
            $('#' + parent_id + ' .invalid-check-feedback').text('');
            nicknameCheckBoo = false;
        });
        
        $('.nicknameCheck-btn').click(function() {
	        nickname = $('#nickname-input').val();
	        $.ajax({
	        	async: true,
	        	type: 'POST',
	        	data: nickname,
	        	url: 'nicknameCheck',
	        	dataType: 'json',
	        	contentType: 'application/json; charset=UTF-8',
	        	success: function(data) {
	        		if(data > 0) {
	        			$(ni_icf).text('* 이미 사용 중인 닉네임입니다.');
	        			$(ni_icf).css('color', '#ff6500');
	        			$(ni_icf).show();
		        		nicknameCheckBoo = false;
	        		} else {
	        			$(ni_icf).text('* 사용 가능한 닉네임입니다.');
	        			$(ni_icf).css('color', '#5f04f9');
	        			$(ni_icf).show();
		        		nicknameCheckBoo = true;
	        		}
	        	},
	        	error : function() {
	        		console.log('error');
	        		$(ni_icf).text('* 닉네임을 입력해주세요.');
	        		$(ni_icf).show();
	        		$(ni_icf).css('color', '#ff6500');
	        	}
	        });
        });
        
        // '닉네임 변경 input 요소에 포커싱 시 '중복확인' 버튼 활성화, 다른 곳에 포커싱이 옮겨졌을 시 '중복확인' 버튼 비활성화
        $('#nickname-input').focus(function() {
        	$('.nicknameCheck-btn').removeAttr('disabled');
        });
        
        // form 태그의 기본 서브밋을 조건처리 하기 위한 함수
        var nicknameFormBoo = false;
        $('#nickname-form').submit(function() {
        	return nicknameFormBoo;
        });
        
        // '수정완료' 버튼을 클릭 시 입력받은 값의 유효성 검사를 실시하고 form 태그의 submit을 호출
        $('.nickname-submit-btn').click(function() {
        	console.log($('#nickname-input').val());
        	if($('#nickname-input').val() == '' && nicknameCheckBoo == false) {
        		$(ni_icf).text('* 닉네임을 입력해주세요.');
        		$(ni_icf).css('color', '#ff6500');
        		$(ni_icf).show();
        		return false;
        	} else if(nicknameCheckBoo == false) {
        		$(ni_icf).text('* 중복확인을 해주세요.');
        		$(ni_icf).css('color', '#ff6500');
        		$(ni_icf).show();
        		return false;
        	} else if($('#nickname-input').val() != nickname) {
        		$(ni_icf).text('* 중복확인을 해주세요.');
        		$(ni_icf).css('color', '#ff6500');
        		$(ni_icf).show();
        		return false;
        	} else {
        		nicknameFormBoo = true;
        	}
        	console.log('아직 있지롱');
        	$('#nickname-form').submit();
        	$('#nickname-input').val('');
        });
        $('.nickname-cancel-btn').click(function() {
        	
        });
        
        
        
        
        $('#phonenum-input-1').focus(function() {
        	$('.certification-btn-1').removeAttr('disabled');
        });
        
        $('.certification-btn-1').click(function() {
        	phoneNumber = $('#phonenum-input-1').val();
        	console.log(phoneNumber);
        	$.ajax({
        		async: true,
        		type: 'POST',
        		data: phoneNumber,
        		url: 'AuthenticatePhoneNumber',
        		dataType: 'json',
        		contentType: 'application/json; charset=UTF-8',
        		success: function(data) {
        			authenticationNumber = data;
        			console.log(authenticationNumber);
        			$('.certification-group-2').show();
        			$(pi_icf_1).hide();
        		},
        		error: function() {
        			console.log('error');
        			$(pi_icf_1).text('* 휴대폰 번호를 입력해주세요.');
	        		$(pi_icf_1).show();
	        		$(pi_icf_1).css('color', '#ff6500');
        		}
        	});
        });
        
        $('#phonenum-input-2').focus(function() {
        	$('.certification-btn-2').removeAttr('disabled');
        });
        $('.certification-btn-2').click(function() {
        	var inputNumber = $('#phonenum-input-2').val();
        	console.log(inputNumber);
        	if(inputNumber == authenticationNumber) {
        		$(pi_icf_2).text('* 인증 성공!');
        		$(pi_icf_2).show();
        		$(pi_icf_2).css('color', '#5f04f9');
        	} else if(inputNumber == '') {
        		$(pi_icf_2).text('* 인증번호를 입력해주세요.');
        		$(pi_icf_2).show();
        		$(pi_icf_2).css('color', '#ff6500');
        	}
        });
        
        $('.phonenum-submit-btn').click(function() {
        });
        
        
    });
//     (function() {
//         window.addEventListener('load', function() {
//             var forms = document.getElementsByClassName('needs-validation');
//             var validation = Array.prototype.filter.call(forms, function(form) {
//                 form.addEventListener('submit', function(event) {
//                     if (form.checkValidity() === false) {
//                         event.preventDefault();
//                         event.stopPropagation();
//                     }
//                     form.classList.add('was-validated');
//                 }, false);
//             });
//         }, false);
//     })();
</script>
<body>
<%@ include file="./template/header.jsp" %>

<div class="container" id="faq-page">
     <div id="menu-bar">
         <ul class="menu-list">
             <li>
                 <a href="info_managementPage">내 정보 관리</a>
             </li>
             <li>
                 <a href="reservationPage">예약 내역</a>
             </li>
         </ul>
     </div>
     <div id="info-mng-div">
         <div class="info-main">
             <p>내 정보 수정</p>
         </div>
         <div class="information-update-input-group">

             <form action="updateMember" id="nickname-form" method="post">
                 <div class="form-group">
                     <div class="text-group">
                         <span>닉네임</span>
                         <span>암행어사</span>
                     </div>
                     <button type="button" class="btn update-btn" id="update-btn1">수정</button>
                     <div class="update-group" id="ug1">
                   		 <div class="nicknameCheck-group">
	                   		 <div class="nickname-input-group">
			                     <input id="nickname-input" type="text" class="form-control" placeholder="체크인시 필요한 정보입니다." name="mem_nickname" required>
			                     <div class="invalid-check-feedback"></div>
	                   		 </div>
                             <button type="button" class="btn nicknameCheck-btn" disabled="disabled">중복확인</button>
                   		 </div>
	                     <button type="button" class="btn submit-btn nickname-submit-btn">수정 완료</button>
	                     <button type="button" class="btn cancel-btn">수정 취소</button>
                     </div>
                 </div>
             </form>
             <form action="#" id="phonenumber-form" method="post">
                 <div class="form-group">
                     <div class="text-group">
                         <span>휴대폰 번호</span>
                         <span>010****5678</span>
                     </div>
                     <button type="button" class="btn update-btn" id="update-btn3">수정</button>
                     <div class="update-group" id="ug3">
                         <div class="certification-group-1">
                             <div class="phonenum-input-group">
                                 <input id="phonenum-input-1" type="text" class="form-control" placeholder="체크인시 필요한 정보입니다." name="uname" required>
                                 <div class="invalid-check-feedback">휴대폰 번호를 입력하세요.</div>
                             </div>
                             <button type="button" class="btn certification-btn-1" disabled="disabled">인증번호 전송</button>
                         </div>
                         <div class="certification-group-2">
                             <div class="phonenum-input-group">
                                 <input id="phonenum-input-2" type="text" class="form-control" placeholder="인증번호를 입력하세요." name="uname" required>
                                 <div class="invalid-check-feedback">휴대폰 번호를 입력하세요.</div>
                             </div>
                             <button type="button" class="btn certification-btn-2" disabled="disabled">인증번호 확인</button>
                         </div>
                         <button type="submit" class="btn phonenum-submit-btn">수정 완료</button>
                         <button type="button" class="btn cancel-btn">수정 취소</button>
                     </div>
                 </div>
             </form>
             <form action="#" class="needs-validation" novalidate>
                 <div class="form-group">
                     <div class="text-group">
                         <span>비밀번호 변경</span>
                         <span></span>
                     </div>
                     <button type="button" class="btn update-btn" id="update-btn4">수정</button>
                     <div class="update-group password-group" id="ug4">
                         <div class="form-group">
                             <label for="prev-password">기존 비밀번호</label>
                             <input type="password" class="form-control" placeholder="기존 비밀번호를 입력해 주세요." id="prev-password" name="uname" required>
                             <div class="invalid-check-feedback">기존 비밀번호를 입력하세요.</div>
                         </div>
                         <div class="form-group">
                             <label for="prev-password">새 비밀번호</label>
                             <input type="password" class="form-control" placeholder="비밀번호(최소 8자 이상)" id="prev-password" name="uname" required>
                             <div class="invalid-check-feedback">새 비밀번호를 입력하세요.</div>
                         </div>
                         <div class="form-group">
                             <label for="prev-password">새 비밀번호 확인</label>
                             <input type="password" class="form-control" placeholder="변경할 비밀번호를 재입력해 주세요." id="prev-password" name="uname" required>
                             <div class="invalid-check-feedback">새 비밀번호를 입력하세요.</div>
                         </div>
                         <button type="submit" class="btn submit-btn">수정 완료</button>
                         <button type="button" class="btn cancel-btn">수정 취소</button>
                     </div>
                 </div>
             </form>

         </div>
     </div>
 </div>

<%@ include file="./template/footer.jsp" %>
</body>
</html>