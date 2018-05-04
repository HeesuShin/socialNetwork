/* img 태그에 들어가는 클래스가 img 프래임보다 큰지 작은지 판단하는 함수들*
 * 
 */

$(document).ready(function(){
	
	window.fullimg = function($img, $imgframe){
		if($($img).get(0).naturalWidth <= $($img).get(0).naturalHeight){
			if($($img).get(0).naturalWidth >= $($imgframe).width()){
				$($img).removeClass("img");
				$($img).addClass("img1");
			}else{
				$($img).removeClass("img");
				$($img).addClass("img2");
			}
		}else{
			if($($img).get(0).naturalHeight >= $($imgframe).height()){
				$($img).removeClass("img");
				$($img).addClass("img2");
			}else{
				$($img).removeClass("img");
				$($img).addClass("img1");
			}
		}
	};
	
	
	window.frameimg = function($img, $imgframe){
		if($($img).get(0).naturalWidth < $($img).get(0).naturalHeight){
			if($($img).get(0).naturalHeight >= $($imgframe).height()){
				$($img).removeClass("img");
				$($img).addClass("img2");
			}else{
				$($img).removeClass("img");
				$($img).addClass("img1");
			}
		}else{
			if($($img).get(0).naturalWidth >= $($imgframe).width()){
				$($img).removeClass("img");
				$($img).addClass("img1");
			}else{
				$($img).removeClass("img");
				$($img).addClass("img2");
			}
		}
	};
	
	
});