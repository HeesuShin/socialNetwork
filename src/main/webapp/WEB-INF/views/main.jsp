<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<%
	String conPath = request.getContextPath();
%>

	<link rel="stylesheet" type="text/css" href="<%=conPath %>/resources/css/header.css">
	
	<style type="text/css">
	
		.boardpage{	
		clear:both;
            width: 90%;
            margin: auto;
            padding-top: 10px;
            padding-bottom: 20px;
            background-color: #ffffff; 
            margin-bottom:30px;
        }
        .precontends{
        	width:100%;
            clear : both;
        }
        .postcontents{
        	margin:auto;
        	width : 94%;
        	clear : both;
            font-size:16px;
        }
        .boardimg{
            max-width : 100%;
            height: 100%;
        } 
        .profilimg{
            width: 45px; /* 8%; */
            text-align: center;
			margin:1%;
            float: left;
            position: relative;
        	padding-top: 45px; /* 8%; */
        	overflow: hidden;
        	border : 1px solid white;
        	border-radius: 50%;
        	text-align: center;
        }
        .profilimg .profileimg-cell{
        	position: absolute;
        	top: 0;
        	left: 0;
        	right: 0;
        	bottom: 0;
        	transform:translate(50%,50%);
        }
        .profilimg .profileimg-cell img{
        	transform:translate(-50%,-50%);

        }
        .profilimg img.img1{
        	height: 100%;
        	width: auto;
        }
        .profilimg img.img2{
        	height: auto;
        	width: 100%;
        }
        .profilname{
            width: 38%;
            padding : 3.5% 1% 0 1%;
            text-align: left;
            float: left;
            font-size:18px;
        }
        .date{
            width: 38%;
            padding : 3.5% 1% 0 1%;
            text-align: right;
            float: left;
            font-size:18px;
        }
        .clear{
        	clear:both;
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
        
        .imgframe{
        	width:100%;	/* 보더 뺴면 100%로  */
        	height:100%;
        	position:relative;
        }
        
        .imgframe .img1{
			width:100%;
			height:auto;
			max-width:none;
			position:absolute;
			left:0;
			top:0;
        }
        
        .imgframe .img2{
        	width: auto;
        	height: 100%;
        	max-height: none;
        }
        .imgframe img{
        	border-radius: 5px;
        }

        .cont{
            text-align: left;
            border-bottom-style: dotted;
            margin: 0;
            padding: 5px;
        }
        .cont2{
            text-align: left;
            margin: 0;
            padding: 5px;
            cursor: pointer;
        }
        .userid{
            font-weight: bolder;
            text-align: center; 
        }
        
        /* .reply{
        	text-align: left;
        	display: none;
        } */
	
        .reply:nth-child(even){
            margin-top: 10px;
            background-color: white;
            margin: 0;
            padding: 5px;
        }

        .reply:nth-child(odd){
            margin-top: 10px;
            background-color: #E0E0E0;
            margin: 0;
            padding: 5px;

        }
        .replyarea{
        	text-align: left;
        	display: none;
        }
        .clear{
            clear:both;
        }
        a:hover{
        	color:blue;
        }
        a{
	        text-decoration: none;
        	color:#000000;
        	font-weight:bolder;
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
        .button, input[type="submit"]{
	        -webkit-appearance: none;
        	border : 1px solid #000000;
        	font-size: 13px;
        	padding: 5px;
        	border-radius: 12px;
        	background-color: #ffffff;
        	
        }
        #replyinput{
        	width : 100%;
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

    
    
    window.onload = function(){
    	$(".boardpage img").each(function(){				//////// 나중에 최적화 시키기
			frameimg($(this),$(".imgframe"));
		});
    	resizechange();
    	
    	/* jquery mobile에 해당되는 요소 제거 */
    	$("a").each(function(){ $(this).attr("data-ajax","false"); });
    	$("form").each(function(){ $(this).attr("data-ajax","false"); });
    	$.mobile.loading().hide();
    	/* 여기까지 */
    	
    	$(".numberofreply").each(function(){
    		$(this).html($(this).parents(".react").parents(".postcontents").children(".replyarea").children(".replybox").children(".reply").length);
    	});
    	
    	var date = new Date();
		$(".profileimg-cell img").each(function(){
			$(this).attr("src",$(this).attr("src")+"?"+date.getTime());
		});
    };
    
    $(window).resize(function(){
    	resizechange();
	}).resize();

    /* 댓글창 보기 */
    $(document).on("click",".cont2", function(){
		$(this).parents(".postcontents").children(".replyarea").slideToggle("slow");
	});
    /* 여기까지 */
    
    /* 버튼 클릭으로 사진 이동 */
    $(document).on("click","div.moveright",function(){
    	$(this).parents(".images").children(".imgbox").css("top", parseInt($(this).parents(".images").children(".imgbox").css("top")) + $(".images").height() * (-1));
    	if(/* Math.floor(parseInt($(this).parents(".images").children(".imgbox").css("top"))) > Math.floor(((-1) * $(".images").height() * (2))) -10 &&  */Math.floor(parseInt($(this).parents(".images").children(".imgbox").css("top"))) < Math.floor(((-1) * $(".images").height() * ( ($(this).parents(".images").children(".imgbox").children(".imgframe")).length  ))) + 10 ){
    		$(this).parents(".images").children(".imgbox").css("top", 0);
    	}
    });
    
    $(document).on("click","div.moveleft",function(){
    	$(this).parents(".images").children(".imgbox").css("top", parseInt($(this).parents(".images").children(".imgbox").css("top")) + $(".images").height());
    	if(Math.floor(parseInt($(this).parents(".images").children(".imgbox").css("top"))) > Math.floor($(".images").height()) - 10/*  && Math.floor(parseInt($(this).parents(".images").children(".imgbox").css("top"))) < Math.floor($(".images").height()) + 10  */){
    		$(this).parents(".images").children(".imgbox").css("top", (-1) * $(".images").height() * (($(this).parents(".images").children(".imgbox").children(".imgframe")).length - 1));
    	}
    });
    /* 여기까지 */
    
    
    /* 터치슬라이드로 사진 옆으로 이동 */	
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
    /* 여기까지 */
    
    /* 댓글 달기 ajax */
	$(document).on("change","#replyinput",function(){
		var conPath = "<%=conPath %>";
    	var memberNum = "<%=session.getAttribute("memberNum") %>";
    	var text = $(this).val();
    	var postNum = $(this).parents(".reply").children("#replypostnum").val();
    	var $thisparents = $(this).parents(".reply").parents(".replyarea").children(".replybox");
    	var $numberofreply = $(this).parents(".reply").parents(".replyarea").parents(".postcontents").children(".react").children(".numberofreply");
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
    /* 여기까지 */
    
    
    /* 게시글 더보기 ajax */
    $(document).on("click","#seemore",function(){
    	$.ajax({
			url: "<%=conPath %>/mainseemore",
			type:"POST",
			data:{
				stage : $(".mainbody").children(".boardpage").length/5 + 1,
			},
			success:function(html){
				$(".mainbody").append(html);

		    	if($(".mainbody").children(".boardpage").length % 5 != 0){
		    		$("footer").show();
		    		$("#seemore").hide();
		    	}
				setTimeout(function(){
					$(".imgframe .img").each(function(){	
							frameimg($(this),$(".imgframe"));
					});
					$(".profileimg-cell .img").each(function(){
						frameimg($(this),$(".profileimg-cell"));
					});
			    	resizechange();
			    	
				},300);	
			}
		});
    });
    /* 여기까지 */
    
    
    /* 창크기 변동이 있을 때 변경이 필요한 동적 요소들 */
    function resizechange(){
    	
    	var preheight = parseInt(($(".images").height()));
    	$(".images").css({"height":$(".imgbox").width()});
    	$(".moveleft, .moveright").css("top",$(".images").height()/5);
    	$(".images .img1").each(function(){
    		$(this).css("top",($(".imgframe").height() - $(this).height())/2);
    	});
    	$(".imgbox").each(function(){$(this).css("top", parseInt(($(".images")).height())*(-1)*(preheight/((-1)*(parseInt($(this).css("top"))))));});
    };
	/* 여기까지 */
    </script>
	

   
	<title>메인화면</title>
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
    	<c:forEach items="${post}" var="post" varStatus="status">
			<div class="boardpage">
				<div class="precontents">
					<div class="profilimg">						
							<div class="profileimg-cell"><a href="<%=conPath %>/profile"><img src="resources/ProfilePic/${member[status.index].member_profile_pic}"></a></div>
					</div>
					<div class="profilname"> <a href="<%=conPath %>/profile?memberId=${member[status.index].member_id}"> ${member[status.index].member_name} </a> </div>
					<div class="date">${post.post_date}</div>	
					<div class="clear"></div>
				</div>
				<div class="images">
					<div class="imgbox">
					
						<c:set var="picture" value="picture${post.post_number}" />
						<c:forEach var="picture" items="${requestScope[picture]}">
						 	<div class="imgframe">
						 		<img class="img" src="resources/PostPic/${picture.picture_path}">
						 	</div>
						</c:forEach>
					</div>
					<div class="moveleft"><img class="moveleft" src="<%=conPath %>/resources/img/leftdirect.png"></div>
					<div class="moveright"><img class="moveright" src="<%=conPath %>/resources/img/rightdirect.png"></div>
					<div class="clear"></div>
				</div>
				<div class="postcontents">
					<c:set var="replySizeTemp" value="replySize${post.post_number }" />
					<c:set var="replySize" value="${requestScope[replySizeTemp] }" />
					<div class="react"><img id="good" alt="" src="<%=conPath %>/resources/img/good.png">&nbsp; : ${post.post_like} <img id="reply" alt="" src="<%=conPath %>/resources/img/reply.png"> &nbsp;: ${replySize }</div>
					<div class="cont">${post.post_text}</div>
					<div class="cont2">댓글보기헷</div>
					<div class="replyarea">
						<div class="reply"><input type="text" id="replyinput" name="text" placeholder="댓글을 입력해 주세용">
						<input type="hidden" name="postNum" id="replypostnum" value="${post.post_number}">					
						</div>
						
						<div class="replybox">
							<c:set var="reply" value="reply${post.post_number}" />
							<c:set var="replyNameTemp" value="replyName${post.post_number }" />
							<c:set var="replyName" value="${requestScope[replyNameTemp] }" />
							<c:forEach var="reply" items="${requestScope[reply]}" varStatus="replyStatus">
								<div class="reply"><a href="<%=conPath %>/profile">${replyName[replyStatus.index] }</a> ${reply.reply_text }</div>							
							</c:forEach>	
						</div>
						
						
					</div>	
					<div class="clear"></div>
				</div>
		
			</div>
		</c:forEach>
	</div>
    <div>
    	
        <p><button class="button" id="seemore">게시글 더 보기</button></p>
       
    </div>
    <footer style="display:none;">
       	<p><b>더이상 게시글이 존재하지 않습니다.</b></p>
    </footer>
</body>
</html>