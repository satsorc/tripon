'use strict';

$(document).ready(function() {

    // 카테고리추가버튼
    $('#category').hide();
    $('#mainCategory').hide();
    $('#addCategory').click(function() {
        $('#category').toggle();
        $('#mainCategory').toggle();
    });

    // 상품옵션추가버튼
    $('#addOption01').hide();
    $('#addOption02').hide();
    $('#addOption03').hide();
    $("#addOption").click(function() {
        $('#addOption01').toggle();
        $('#addOption02').toggle();
        $('#addOption03').toggle();
    });

    
});