<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0"/> 
<meta http-equiv="Pragma" content="no-cache"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<%
	String conPath = request.getContextPath();
%>

	<link rel="stylesheet" type="text/css" href="<%=conPath %>/resources/css/header.css">
    <style type="text/css">

    	#profileimg{
        	width: 18%;
        	min-width:60px;
        	min-height:15px;
        	padding-left: 5%;
        	margin: 3%;
        	position: relative;
        	padding-top: 20%;
        	overflow: hidden;
        	text-align: center;
        	border : 1px solid white;
        	border-radius: 50%;
        }
        #profileimg .profileimg-cell{
        	position: absolute;
        	top: 0;
        	left: 0;
        	right: 0;
        	bottom: 0;
        	transform:translate(50%,50%);
        }
        #profileimg .profileimg-cell img{
        	transform:translate(-50%,-50%);

        }
        #profileimg img{
        	height: 100%;
        	width: auto;
        }
        #memeberinfo{
        	width: 55%;
        	margin-top: 3%;
        	margin-left: 5%;
        	padding: 1% 1% 1% 1%;
        	text-align: left;
        	line-height: 200%;
        }
        .mypage{
        	margin: auto;
        	width: 90%;
        	clear:both;

        }
        .myinfo .info{
        	float: left;
            font-size: 1em;
            font-weight: bolder;
        	padding: 1%;
        }

        .numinfo{
        	width: 98%;
        	padding: 1%;
        	text-align: center;
        	background-color: white;
        	font-weight: bolder;
        	border-top: 3px dotted #F2F2F2;
        	border-bottom: 3px dotted #F2F2F2;
        }
        .myinfo, .mysubpage{
        	background-color: white;
        	width: 98%;
        	max-width: 100%;
        	margin: auto;
        	padding: 1%;
        }
        .mypostlist{
        	background-color:white;
        }
        .mysubpage{
        	display: inline-block;
        	width: 98%;
        }

        .postmainimg, .numinfo .subnuminfo{
        	width: calc(31.3% - 3px);        /* 02-14 창훈 수정  원래 30.3% 이었음 이유 : 아이폰5에서 깨짐*/
        	float: left;
        	margin: 5px 1% 5px 1%;
        }

        .postmainimg{
        	position: relative;
        	padding-top: 30.3%;
        	overflow: hidden;
        	border: 1px solid #f2f2f2;
        	border-radius:5%;
        }
        .postmainimg .postmainimg-cell{
        	position: absolute;
        	top: 0;
        	left: 0;
        	right: 0;
        	bottom: 0;
        	transform: translate(50%,50%);
        }
        .postmainimg .postmainimg-cell img{
        	transform: translate(-50%,-50%);
        }

        .postmainimg img.img1, #profileimg img.img1{ /*상하가 긴 사진*/
        	width: 100%;
        	height: auto;
        	max-width: none;
        }
        .postmainimg img.img2,#profileimg img.img2{ /*좌우가 긴 사진*/
        	width: auto;
        	height: 100%;
        	max-height: none;
        }

        .clear{
        	clear:both;
        }
        .button{
	        -webkit-appearance: none;
        	border : 1px solid #000000;
        	font-size: 13px;
        	padding: 5px;
        	border-radius: 12px;
        	background-color: #ffffff;
        }
        
        #popup_layer{ 
        	width:60%;
        	max-width: 700px;
        	min-width: 260px;
        	margin-bottom:30px; 
        	background:#fff; 
        	border:solid 1px #ccc; 
        	position:fixed;
        	box-shadow: 0px 1px 20px #333; 
        	z-index: 99; 
        	display: none;
        	overflow-x : hidden;
        	overflow-y : scroll;
        	/* -ms-overflow-style: none; */
        }
        #popup_layer2{ 
        	width:60%;
        	max-width: 700px;
        	min-width: 260px;
        	margin-bottom:30px; 
        	background:#fff; 
        	border:solid 1px #ccc; 
        	position:fixed;
        	box-shadow: 0px 1px 20px #333; 
        	z-index: 99; 
        	display: none;
        	/* -ms-overflow-style: none; */
        }
        
        /* ::-webkit-scrollbar {
		display:none;
		} */
        
        
        #block, #block2{
        	margin: auto;
        	width: 100%;
        	clear:both;
        	background-color: #000000;
        	opacity: 0.8;
        	position: absolute;
        	top: 0;
        	display: none;
        	z-index: 98;
        	cursor: pointer; 
        }
        #popup_layer_img{
        	width: 100%;
        	height: auto%;
			position:relative;
        }
        
        
        /* 추가한거 */ 
        .precontents, precontents2{
        padding-top:5px;
        width : 100%;
        }
        .profileimg{
            width: 8%;
            margin: 1%;
            text-align: center;
            float: left;
        }
        .profileimg img{
            width: 100%;
        }
        .nameanddate{
        	width:78%;
        	margin:1%;
            float: left;
        }
        .profilename, .date{
            width: 50%;
            float: left;
            font-size:15px;
        }
        .profilename{
            text-align: left;
        }
        .date{
            text-align: right;s
        }
        a:hover{
        	color:blue;
        }
        a{
	        text-decoration: none;
        	color:#000000;
        	font-weight:bolder;
        }
        .images{
	        margin:auto;
        	width:100%;
        	padding:0;
        	position:relative;
        	background-color: #ffffff;
        	overflow : hidden;
        }
        div.moveleft, div.moveright{
        	opacity : 0.7;
        	width: 6%;
        	height:100%;
        }
        img.moveleft, img.moveright{
        	opacity : 0.5;
        	width: 100%;
        }
        .moveleft{
        	position:absolute;
        	left:5px;
        }
        .moveright{
        	position:absolute;
        	right:5px;
        }
        .imgbox{
	        width:100%;
        	height:100%;
        	float:left;	
        	position:absolute;
        	top : 0;
        	left : 0;
        }
        .imgbox2{
	        width: 100%;
        	height: 100%;
        	float:left;	
        	position:absolute;
        	top : 0;
        	left : 0;
        }
        .imgframe, .imgframe2{
        	width:100%;	/* 보더 뺴면 100%로  */
        	height:100%;
        	position:relative;
        }
        .imgframe .img1, .imgframe2 .img1{
			width:100%;
			height:auto;
			max-width:none;
			max-height: 700px;
			position:absolute;
			left:0;
			top:0;
        }
        .imgframe .img2, .imgframe .img2{
        	width: auto;
        	height: 100%;
        	max-height: none;
        }
        .imgframe img, .imgframe2 img{
        	border-radius:10px;
        }
		.react{
        	color : #2A9AB3;
        	font-size:20px;
        	text-align: left;
            padding: 5px 0 3px 0;
        }
        #good, #reply{
        	width:25px;
        	margin:-6px;
        	margin-left:4px;
        	
        }
        .cont{
        	background-color : #ffffff;
            text-align: left;
            border-bottom-style: dotted;
            margin: 0;
            padding: 5px;
        }
        .cont2{
            text-align: left;
            margin: 0;
            padding: 10px 5px;
            cursor: pointer;
            font-weight: border;
        }
        .userid{
            font-weight: bolder;
            text-align: center; 
        }
        .reply{
        	width:100%;
        	text-align: left;
        	position: relative;
        }
        .replyenter{
        	position: absolute;
        	right:0;
        	width: calc(10% - 4px);
        }
        .reply:nth-child(even){
            margin-top: 10px;
            background-color: white;
            margin: 0;
        }
        .reply:nth-child(odd){
            margin-top: 10px;
            background-color: #E0E0E0;
            margin: 0;

        }
        .replyarea{
        	text-align: left;
        	display: none;
        }
        .cancel_img{
        	width :8%;
        	margin:1%;
        	float:left;
        	text-align:right;
        }
        .pic_cancel{
        	width: 50%;
        	max-width:25px;
        	min-width:20px;
        	cursor: pointer;
        }
        
        #replyinput{
        	left:0;
        	width : 80%;
        	font-size : 18px;
        }
    </style>
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script type="text/javascript" src="<%=conPath %>/resources/js/imgclass.js"></script>
	<script type="text/javascript" src="<%=conPath %>/resources/js/button.js"></script>

	<script type="text/javascript">
		

		/* 댓글창 토글 jquery */
		$(document).on("click",".cont2", function(){
				$(this).parents(".postcontents").children(".replyarea").slideToggle("slow");
		});
		/* 여기까지  */

		window.onload = function(){
			
			/* 현재 프로필에 들어온 사람이 본인인지 방문객인지 판단하는 ajax */
			var id = "${member.member_id}";
			var sessionid = '<%=session.getAttribute("id") %>';
			if(id === sessionid){
				$("#button3,#button4").css("display","none");
			}else{
				$("#button1,#button2").css("display","none");
				$.ajax({
					url: "<%=conPath %>/memberFollowCheck",
					type:"POST",
					data:{
						num : "${member.member_number}"
					},
					success:function(data){
						var check = data;
						if(check === 'ok'){ // 팔로우 한 경우
							$("#button3").css("display","none");							
						}else{ 				// 팔로우 아닌경우
							$("#button4").css("display","none");
						}
					}
				});
			}
			/* 여기까지  */
			
			
			/* jquery mobile에서 링크 태그, form 태그가 ajax로 작동하는거 막는 jquery */
			$("a").each(function(){ $(this).attr("data-ajax","false"); });
	    	$("form").each(function(){ $(this).attr("data-ajax","false"); });
	    	$.mobile.loading().hide();
	    	/* 여기까지  */
	    	
	    	/* 이미지를 정사각형으로 만들어주는 jquery */
			$(".images").css({"height":$(".imgbox").width()});
			/* 여기까지  */
			
			/* 사진이 가로가 긴거 세로가 긴거 구별하는 jquery */
			$(".postmainimg-cell .img").each(function(){				
				fullimg($(this),$(".postmainimg-cell"));	// imgclass.js
			});
			
			$(".profileimg-cell .pfimg").each(function(){
				fullimg($(this),$(".profileimg-cell"));		// imgclass.js
			});
			/* 여기까지  */
			
			
			/* 팝업이 뜰때 배경이 뿌옇게 흐려지게 하는 jquery */			
			$("#block").css("height",$("body").height());
			$("#block2").css("height",$("body").height());
			/* 여기까지  */
			
			/* 수정요망 */
			$(".moveleft, .moveright").css("top",$(".images").height()/5);
	    	/* 여기까지  */
	    	
			var date = new Date();
			$(".profileimg-cell img").each(function(){
				$(this).attr("src",$(this).attr("src")+"?"+date.getTime());
			});
	    	
		};
		
		/* 포스트 팝업창 열기 */
		$(document).on("click",".postmainimg",function(){
			if($("#popup_layer").attr("class") === 'close'){
				
				$.ajax({
					url: "postdetailviewer",
					type:"POST",
					data:{
						postNum : $(this).attr("id")
					},
					success:function(html){
						$("#popup_layer").html(html);
						
						setTimeout(function(){
							$(".imgframe .img").each(function(){				
								frameimg($(this),$(".imgframe"));	// imgclass.js
							});
							$(".close").show();
							$(".close").removeClass("close").addClass("open");
							resizechange();
						},300);
					}
				});
			}
		});
		/* 프로필 팝업창 열기 */
		$(document).on("click","#profileimg",function(){
			if($("#popup_layer2").attr("class") === 'close2'){
				$("#popup_layer2").children(".popupsession2").css("display","block");
				$(".imgframe .img").each(function(){				
					frameimg($(this),$(".imgframe"));	// imgclass.js
				});
				$(".close2").show();
				$("#popup_layer2").css("height",$(window).height()*(0.6));
				$("#popup_layer2").css("width",$(window).width()*(0.6));
		    	var left = ( ($(window).width() - $("#popup_layer2").width()) / 2 );
				var top = ($(window).scrollTop() + ($(window).height() - $("#popup_layer2").height()) / 2 );
				$("#popup_layer2").css({'left':left,'top':top, 'position':'absolute'});
				$(".close2").removeClass("close2").addClass("open2")/* .addClass("recentopen") */;
				$(".imgframe .img1").each(function(){$(this).css("top",($(window).height()*(0.6) - $(this).height())/2); 
				});
			}
		});
		/* 여기까지 */

		/* 팝업창 닫기 */
		$(document).on("click","html",function(e){	
			if( e.target.id === "block" ){
				$(".popupsession").css("display","none");
				$(".open").css("display","none");
				$(".open").removeClass("open").addClass("close");
			}else if(e.target.id === "block2"){
				$(".popupsession2").css("display","none");
				$(".open2").css("display","none");
				$(".open2").removeClass("open2").addClass("close2");
			}
		});
		/* 여기까지 */
		
		/* 사진 옆에 X표 누르면 닫기 */
		$(document).on("click",".pic_cancel",function(e){
			
			$(".popupsession").css("display","none");
			$(".open").css("display","none");
			$(".open").removeClass("open recentopen").addClass("close");
			
			$(".popupsession2").css("display","none");
			$(".open2").css("display","none");
			$(".open2").removeClass("open2 recentopen").addClass("close2");
		});
		/* 여기까지 */
		
		
		
		$(window).resize(function(){
			resizechange();
		}).resize();
		
		/* 화살표 클릭으로 사진 이동 */		
		$(document).on("click","div.moveright",function(){
			$(this).parents(".images").children(".imgbox").css("top", parseInt($(this).parents(".images").children(".imgbox").css("top")) + $(".images").height() * (-1));
			if(Math.floor(parseInt($(this).parents(".images").children(".imgbox").css("top"))) < Math.floor(((-1) * $(".images").height() * ( ($(this).parents(".images").children(".imgbox").children(".imgframe")).length  ))) + 10 ){
				$(this).parents(".images").children(".imgbox").css("top", 0);
			}
		});
	    
	    $(document).on("click","div.moveleft",function(){
	    	$(this).parents(".images").children(".imgbox").css("top", parseInt($(this).parents(".images").children(".imgbox").css("top")) + $(".images").height());
	    	if(Math.floor(parseInt($(this).parents(".images").children(".imgbox").css("top"))) > Math.floor($(".images").height()) - 10){
	    		$(this).parents(".images").children(".imgbox").css("top", (-1) * $(".images").height() * (($(this).parents(".images").children(".imgbox").children(".imgframe")).length - 1));
	    	}
	    });
	    /* 여기까지  */
		    
		/* 슬라이드로 사진 이동 */
		$(document).on("swipeleft",".imgframe img",function(e){
	    	$(this).parents(".imgbox").css("top", parseInt($(this).parents(".imgbox").css("top")) + $(".images").height() * (-1));
	    	if(/* Math.floor(parseInt($(this).parents(".images").children(".imgbox").css("top"))) > Math.floor(((-1) * $(".images").height() * (2))) -10 &&  */Math.floor(parseInt($(this).parents(".imgbox").css("top"))) < Math.floor(((-1) * $(".images").height() * ( ( $(this).parents(".imgbox").children(".imgframe")).length  ))) + 10 ){
	    		$(this).parents(".imgbox").css("top", 0);
	    	}
	    });
		    
	    $(document).on("swiperight",".imgframe img",function(e){
	    	$(this).parents(".imgbox").css("top", parseInt($(this).parents(".imgbox").css("top")) + $(".images").height());
	    	if(Math.floor(parseInt($(this).parents(".imgbox").css("top"))) > Math.floor($(".images").height()) - 1/*  && Math.floor(parseInt($(this).parents(".images").children(".imgbox").css("top"))) < Math.floor($(".images").height()) + 10  */){
	    		$(this).parents(".imgbox").css("top", (-1) * $(".images").height() * (($(this).parents(".imgbox").	children(".imgframe")).length - 1));
	    	}
	    });
	    
	    /* 여기까지  */
		    
		
		// 팔로우 하기 및 취소하기
		// 팔로우
		$(document).on("click", "#button3", function(){
			$.ajax({
				url: "<%=conPath %>/memberFollow",
				type:"POST",
				data:{
					num :"${member.member_number}"
				},
				success:function(data){
					if(data === '1'){ // 팔로우 성공
						$("#button3").css("display","none");
						$("#button4").css("display","block");
					}else{	//팔로우 실패
						alert("팔로우에 실패했습니다. 다시 시도해주세요.")						
					}
				}
			});
		});
		// 팔로우 취소
		$(document).on("click", "#button4", function(){
			$.ajax({
				url: "<%=conPath %>/memberFollowCancel",
				type:"POST",
				data:{
					num :"${member.member_number}"
				},
				success:function(data){
					if(data === '1'){ // 팔로우 취소 성공
						$("#button4").css("display","none");
						$("#button3").css("display","block");
					}else{	//팔로우 실패
						alert("팔로우 취소에 실패했습니다. 다시 시도해주세요.")						
					}
				}
			});
		});
		/* 여기까지 */
		
		$(document).on("click", "#button4", function(){
			$.ajax({
				url: "<%=conPath %>/memberFollowCancel",
				type:"POST",
				data:{
					num :"${member.member_number}"
				},
				success:function(data){
					if(data === '1'){ // 팔로우 취소 성공
						$("#button4").css("display","none");
						$("#button3").css("display","block");
					}else{	//팔로우 실패
						alert("팔로우 취소에 실패했습니다. 다시 시도해주세요.")						
					}
				}
			});
		});
		
		$(document).on("click", "#seemore", function(){
			$.ajax({
				url: "<%=conPath %>/profileseemore",
				type:"POST",
				data:{
					stage : parseInt($(".postmainimg").length/6 + 1)
				},
				success:function(html){
					$(".mypostlist").append(html);
					
					if($(".postmainimg").length % 6 != 0){
			    		$("footer").show();
			    		$("#seemore").hide();
			    	}
					
					setTimeout(function(){
						$(".postmainimg-cell .img").each(function(){				
							fullimg($(this),$(".postmainimg-cell"));	// imgclass.js
						});
						
						$(".profileimg-cell .pfimg").each(function(){
							fullimg($(this),$(".profileimg-cell"));		// imgclass.js
						});
					},100);	
					
					resizechange();
					
					/* $(".numberofreply").each(function(){
			    		$(this).html($(".replybox").children(".reply").length);
			    	}); */
					
					
				}
			});
		});
		
		$(document).on("change","#replyinput",function(){
			var conPath = "<%=conPath %>";
	    	var memberNum = "<%=session.getAttribute("memberNum") %>";
	    	var text = $(this).val();
	    	var postNum = $(this).parents(".reply").children("#replypostnum").val();
	    	var $thisparents = $(".replybox");
	    	var $numberofreply = $(".numberofreply");
	    	var $this = $(this);
	    	$.ajax({
				url: conPath + "/replyAdd",
				type:"POST",
				data:{
					postNum : postNum,
					text : text
				},
				success:function(data){
					var check = data;
					if(check === '1'){ // 댓글 달기 성공
						$thisparents.prepend('<div class="reply"><a href="' + conPath + '/profile">' + '<%=session.getAttribute("memberName") %>' + '</a>&nbsp' + text + '</div>');
						$this.val("");
						$numberofreply.text(parseInt($numberofreply.text())+1);
					}else{ // 댓글 달기 실패
						$("#button4").css("display","none");
						alert("실패했습니다. 잠시 후 다시 시도해주세요")
					}
				}
			});
		});
		
		function resizechange(){
			var preheight = parseInt(($(".images").height()));
			$("#block").css("height",$("html").height());
			$("#popup_layer").css({'left':left,'top':top, 'position':'absolute'})
			$("#popup_layer").css("height",$(window).height()*(0.9));
			$("#popup_layer").css("width",$(window).width()*(0.9));
			var left = (($(window).width() - $("#popup_layer").width()) / 2 );
			var top = ($(window).scrollTop() + ($(window).height() - $("#popup_layer").height()) / 2 );111
			$("#popup_layer").css({'left':left,'top':top, 'position':'absolute'});
			$(".images").css({"height":$("#popup_layer").width()});
	    	$(".imgbox").each(function(){$(this).css("top", parseInt(($(".images")).height())*(-1)*(preheight/((-1)*(parseInt($(this).css("top"))))));});
			$(".imgframe .img1").each(function(){$(this).css("top",($("#popup_layer").width() - $(this).height())/2)});
			$(".moveleft, .moveright").css("top",$(".images").height()/5);
			
			/* 프로필 팝업 */
			var preheight2 = parseInt(($(".images2").height()));
	    	$("#block2").css("height",$("html").height());
			$("#popup_layer2").css({'left':left,'top':top, 'position':'absolute'})
			$("#popup_layer2").css("height",$(window).height()*(0.5));
			$("#popup_layer2").css("width",$(window).width()*(0.5));
			$("#popup_layer2").css({'left':left,'top':top, 'position':'absolute'});
			$(".images2").css({"height":$("#popup_layer2").width()});
	    	$(".imgbox2").each(function(){$(this).css("top", parseInt(($(".images2")).height())*(-1)*(preheight2/((-1)*(parseInt($(this).css("top"))))));});
			$(".imgframe2 .img1").each(function(){$(this).css("top",($(".images2").css("width") - $(this).height())/2)});
		};
		
		
	</script>
	
	

    <script type="text/javascript">
    	function profileupdate(){
    		var path = '<%=conPath %>';
    		location.href= path + "/profileModify";
    	}
    </script>
	
	<title></title>
</head>
<body>
	<div class="header">
        <div id="headerleft">
            <div id="sidemenu"><a href="<%=conPath %>/postInsert"><img src="<%=conPath %>/resources/img/post.jpg" alt="" id="sidemenubar"></a></div>
        </div>
        <div id="headermiddle">
            <div id="logo"><a href="<%=conPath %>/main"><img src="<%=conPath %>/resources/img/logo1.png" alt=""></a></div>
            <!-- logo 글씨체 HY나무B -->
        </div>
        <div id="headerright">
            <div id="updateprofile"><a href="<%=conPath %>/profile"><img src="<%=conPath %>/resources/img/profile.jpg" alt=""></a></div>
        </div>
        <div id="search">
            <form action="<%=conPath %>/search" id="searchform"></form>
            	<div class="inputarea">
            		<input class="bar" type="text" name="search" size="20" form="searchform">
            		<div class="sm"><label for="abc" style="cursor: pointer;"><img class="sss" src="<%=conPath %>/resources/img/sm.png" alt=""><input type="submit" id="abc" style="display: none;" form="searchform"></label></div>
            	</div>
        </div>
        <div class="clear"></div>
    </div>
	
	<div class="mainbody">
		<div class="mypage">
			<div class="myinfo">
				<div class="info" id="profileimg"><div class="profileimg-cell"><img class="pfimg" src="resources/ProfilePic/${member.member_profile_pic }"></div></div>
				<div class="info" id="memeberinfo">
					${member.member_name }<br />${member.member_id }<br />
					<button class="button" id="button1" onclick="location.href='<%=conPath %>/profileModify'">프로필수정</button>
					<button class="button" id="button2" onclick="location.href='<%=conPath %>/logout'">로그아웃</button>
					<button class="button" id="button3" onclick="">팔로우</button>
					<button class="button" id="button4" onclick="">팔로우해제</button>
				</div>
				<div class="clear"></div>
			</div>

			<div class="numinfo">
				<div class="subnuminfo">게시글<br />${member.member_post_number }</div>
				<div class="subnuminfo">팔로워<br />${member.member_follower_number }</div>
				<div class="subnuminfo">팔로잉<br />${member.member_following_number }</div>
				<div class="clear"></div>
			</div>

			<div class="mypostlist">
	    		<c:forEach items="${post}" var="post" varStatus="status">
	    		<div class="postmainimg" id="${post.post_number }">
					<c:set var="pictureinfo" value="picture${post.post_number}" />
					<c:set var="picture" value="${requestScope[pictureinfo]}" />
					<div class="postmainimg-cell"><img class="img" src="resources/PostPic/${picture.picture_path}"></div>

				</div>
				</c:forEach>
				
			<div class="clear"></div>
			</div>
			
		</div>
	</div>
	
	<div>
    	
        <p><button class="button" id="seemore">게시글 더 보기</button></p>
       
    </div>
	

	<!-- post자세히 보기 -->
	<div id="popup_layer" class="close">
		
	</div>
	<div id="block" class="close"></div>
	<!-- post자세히 보기 종료 -->
		
	<!-- 프로필 팝업 -->
	<div id="popup_layer2" class="close2">
		<div class="popupsession2" style="display:none">
			<div class="imgbox2">
						
				<div class="imgframe">
					<img class="img" src="resources/ProfilePic/${member.member_profile_pic }">
					<img style="position:absolute;top:0;left:0;"  alt="" src="<%=conPath %>/resources/img/x.png" class="pic_cancel">
				 </div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div id="block2" class="close2"></div>
	<!-- 프로필 팝업 종료 -->
	
	<footer style="display:none;">
	<div class="clear"></div>
       	<p><b>더이상 게시글이 존재하지 않습니다.</b></p>
    </footer>
</body>
</html>