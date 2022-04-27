'use strict';


let selectCnt = 0;
let selectIdx = new Array;

// 날짜선택
function dateOnChange(event) {
	const text = event.options[event.selectedIndex].text;
	document.getElementById('innerDate01').innerText = text;
	document.getElementById('innerDate02').innerText = text;
	document.getElementById('innerDate03').innerText = text;
	document.getElementById('innerDate04').innerText = text;
}

// 상품선택
function selectOnChange(event) {
	selectCnt++;
	if (selectCnt == 5) selectCnt = 4;
	selectIdx[selectCnt-1] = event.selectedIndex;
	const text = event.options[event.selectedIndex].text;
	document.getElementById('inner0' + selectCnt).innerText = text;
	// console.log(selectCnt);
}

// 증가&감소 버튼
function count01(type) {
	const quantity01Element = document.getElementById('quantity01');
	let number = quantity01Element.innerText;

	if (type === 'increase') number = parseInt(number) + 1;
		else if (type === 'decrease') number = parseInt(number) - 1;

	let decrease01 = document.getElementById('decrease01');
	let increase01 = document.getElementById('increase01');
	if (number == 1) decrease01.disabled = true;
		else if (number !== 1) decrease01.disabled = false;
	if (number == 30) increase01.disabled = true;
		else if (number !== 30) increase01.disabled = false;

	quantity01Element.innerText = number;
}
function count02(type) {
	const quantity02Element = document.getElementById('quantity02');
	let number = quantity02Element.innerText;

	if (type === 'increase') number = parseInt(number) + 1;
		else if (type === 'decrease') number = parseInt(number) - 1;

	let decrease02 = document.getElementById('decrease02');
	let increase02 = document.getElementById('increase02');
	if (number == 1) decrease02.disabled = true;
		else if (number !== 1) decrease02.disabled = false;
	if (number == 30) increase02.disabled = true;
		else if (number !== 30) increase02.disabled = false;

	quantity02Element.innerText = number;
}
function count03(type) {
	const quantity03Element = document.getElementById('quantity03');
	let number = quantity03Element.innerText;

	if (type === 'increase') number = parseInt(number) + 1;
		else if (type === 'decrease') number = parseInt(number) - 1;

	let decrease03 = document.getElementById('decrease03');
	let increase03 = document.getElementById('increase03');
	if (number == 1) decrease03.disabled = true;
		else if (number !== 1) decrease03.disabled = false;
	if (number == 30) increase03.disabled = true;
		else if (number !== 30) increase03.disabled = false;

	quantity03Element.innerText = number;
}
function count04(type) {
	const quantity04Element = document.getElementById('quantity04');
	let number = quantity04Element.innerText;

	if (type === 'increase') number = parseInt(number) + 1;
		else if (type === 'decrease') number = parseInt(number) - 1;

	let decrease04 = document.getElementById('decrease04');
	let increase04 = document.getElementById('increase04');
	if (number == 1) decrease04.disabled = true;
		else if (number !== 1) decrease04.disabled = false;
	if (number == 30) increase04.disabled = true;
		else if (number !== 30) increase04.disabled = false;

	quantity04Element.innerText = number;
}

function delOption(type, idx) {		// 옵션초기화
	selectCnt--;
	let delOption = document.getElementById('dateScroll');
	let check = selectIdx[idx-1];
	
	$('#optionScroll option:eq(' +check+ ')').prop('hidden', false);
	delete selectIdx[idx-1];

	if (selectCnt == -1) selectCnt = 0;
	if (selectCnt == 0) $('#dateScroll option:eq(0)').prop('selected', true);
	if (type === 'delOption01') {
		$('#option_box01').hide();
		$('#inner01').text('');
		$('#quantity01').text(1);
	} else if (type === 'delOption02') {
		$('#option_box02').hide();
		$('#inner02').text('');
		$('#quantity02').text(1);
	} else if(type === 'delOption03') {
		$('#option_box03').hide();
		$('#inner03').text('');
		$('#quantity03').text(1);
	} else if(type === 'delOption04') {
		$('#option_box04').hide();
		$('#inner04').text('');
		$('#quantity04').text(1);
	}
	if (selectCnt == 0) {
		delOption.disabled = false;
		$('#optionScroll option[value*="상품선택"]').prop('hidden', false);
		$('#optionScroll option[value*="option1"]').prop('hidden', true);
		$('#optionScroll option[value*="option2"]').prop('hidden', true);
		$('#optionScroll option[value*="option3"]').prop('hidden', true);
		$('#optionScroll option[value*="option4"]').prop('hidden', true);
	} else if (selectCnt !== 4) {
		$('#optionScroll').prop('disabled', false);
	}
	// console.log(selectCnt);
}

$(document).ready(function() {

	// 옵션선택
	$('#payMent #option_box01').hide();
	$('#payMent #option_box02').hide();
	$('#payMent #option_box03').hide();
	$('#payMent #option_box04').hide();

	$('#optionScroll option[value*="상품선택"]').prop('hidden', false);
	$('#optionScroll option[value*="option1"]').prop('hidden', true);
	$('#optionScroll option[value*="option2"]').prop('hidden', true);
	$('#optionScroll option[value*="option3"]').prop('hidden', true);
	$('#optionScroll option[value*="option4"]').prop('hidden', true);

	$('#dateScroll option:selected').val();
	$('#dateScroll option').index($('#dateScroll option:selected'));
	$('#dateScroll').change(function() {		// 날짜선택
		
		$('#option_box01').show();
		$('#dateScroll').prop('disabled', true);
		$('#optionScroll option[value*="상품선택"]').prop('hidden', true);
		$('#optionScroll option[value*="option1"]').prop('hidden', false);
		$('#optionScroll option[value*="option2"]').prop('hidden', false);
		$('#optionScroll option[value*="option3"]').prop('hidden', false);
		$('#optionScroll option[value*="option4"]').prop('hidden', false);
	});

	$('#optionScroll option:selected').val();
	$('#optionScroll option').index($('#optionScroll option:selected'));
	$('#optionScroll').change(function() {		// 상품선택
		if (selectCnt == 4) $('#optionScroll').prop('disabled', true);
		$('#option_box0' + selectCnt).show();
		$('#optionScroll option:selected').prop('hidden', true);
		$('#optionScroll option:eq(0)').prop('selected', true);
	});
	
	// 탭메뉴
	$('ul.panel li:not(' +$('ul.tab li a.selected').attr('href')+ ')').hide();
	$('ul.tab li a').click(function() {
		$('ul.tab li a').removeClass('selected');
		$(this).addClass('selected');
		$('ul.panel li').hide();
		$($(this).attr('href')).show();
		return false;
	});

});