'use strict';


let addPackageString = '<div class="input-group mb-3 "><div class="input-group-prepend"><span class="input-group-text">옵션 이름</span></div><input type="text" class="form-control innm" name="writer" value="${package_name}" required><div class="input-group-prepend"><span class="input-group-text">옵션 가격</span></div><input type="text" class="form-control innm" name="writer" value="${package_price}" required></div>';


console.log("abc");
$(document).ready(function() {
	var i=1; // 변수설정은 함수의 바깥에 설정!
  $("#addPackage").click(function() {
	  console.log("button pressed");
	  $(".package_place").append(addPackageString);
    

  });
});