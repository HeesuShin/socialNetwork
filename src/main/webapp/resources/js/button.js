/* 버튼 이벤트 js *
 * 
 */

$(document).ready(function(){
	/* 버튼 색깔변경 jquery */
	$(".button").mouseover(function(){
		$(this).css({"color":"#ffffff","background-color":"#000000"});
	});

	$(".button").mouseout(function(){
		$(this).css({"color":"#000000","background-color":"#ffffff"});
	});
	/* 여기까지  */
});