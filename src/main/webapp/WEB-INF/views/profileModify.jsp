<%@page import="java.lang.reflect.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .updatepage{
        	margin: auto;
        	padding-top: 20px;
        	padding-bottom: 20px;
        	width: 90%;
        	background-color: #ffffff;
        	clear:both;
        }
        .category{
            line-height: 30px;
        }
        .category .info{
        	float: left;
        	font-size: 1em;
            font-weight: bolder;
            padding: 1%;
            text-align: center;
        }
        #profileimg, #cameraimg{
            width: 19%;
            margin: 3% 40%;
            position: relative;
            padding-top: 20%;
            overflow: hidden;
            border-radius: 50%;
            text-align: center;
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
        .middle {
            transition: ease;
            opacity: 0;
            position: absolute;
            top: 50%;
            left: 50%;
            transform:translate(-50%,-50%);
        }
        .text {
            background-color: #737373;
            color: white;
            font-size: 16px;
            padding: 2px 2px;
            width: 80px;
        }
        #profileimg img.img1{ /*상하가 긴 사진*/
            width: 100%;
            height: auto;
            max-width: none;
        }
        #profileimg img.img2{ /*좌우가 긴 사진*/
            width: auto;
            height: 100%;
            max-height: none;
        }
        
        #myname{
        	text-align: center;
        	font-size: 25px;
        	border:none;/*border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;*/
        }
        .button, input[type="submit"]{
	        -webkit-appearance: none;
        	border : 1px solid #000000;
        	font-size: 13px;
        	padding: 5px;
        	border-radius: 12px;
        	background-color: #ffffff;
        	
        }
        #uploadprofilepic{
        	display: none;
        }

	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=conPath %>/resources/js/imgclass.js"></script>
	<script type="text/javascript" src="<%=conPath %>/resources/js/button.js"></script>
	
	<script type="text/javascript">

	/* DB에 저장된 성별 체크 */
	$(document).ready(function(){
		var a = "${member.member_gender}";
		if(a==='N'){
			$("#genderN").attr("checked", true);
		}else if(a==='M'){
			$("#genderM").attr("checked", true);
		}else if(a==='F'){
			$("#genderF").attr("checked", true);
		}
	});
	/* 여기까지 */
	
	/* 프로필 사진 실시간 변경 */
	$(document).on("change","#uploadprofilepic",function(){
		var reader = new FileReader();
		reader.onload = function(e){
			$("#profilepic").attr("src", e.target.result);
			$("#profilepic").removeClass("img1 img2");
			fullimg($("#profilepic"),$(".profileimg-cell"));
		}
		reader.readAsDataURL(this.files[0]);
	});
	/* 여기까지 */
		
	/* 마우서 호버 시 프로필 사진 변경 */
	$(document).on("mouseover","#profileimg",function(){	
		$("#profileimg").children(".profileimg-cell").children("img").css("opacity","0.3");
		$("#profileimg").children(".middle").css("opacity","0.8");
	});
	
	$(document).on("mouseleave click","#profileimg",function(){	
		$("#profileimg").children(".profileimg-cell").children("img").css("opacity","1");
		$("#profileimg").children(".middle").css("opacity","0");
	});
	/* 여기까지 */
		
	window.onload = function(){
		/* 사진 클래스 변경 */
		$(".img").each(function(){
			fullimg($(this),$(".profileimg-cell"));
		});
		/* 여기까지 */
		
		/* 프로필 사진 캐시 유지 X */
		var date = new Date();
		$("#profilepic").attr("src",$("#profilepic").attr("src")+"?"+date.getTime());
		/* 여기까지 */
	};
		
	/* 회원탈퇴 여부 */
	function deletecheck(){			
		if (confirm("탈퇴하게?!") == true){
			location.href="<%= conPath %>/memberDelete";
		}else{
			alert("그래 잘생각했어");
		}
	};			
	/* 여기까지 */
	</script>

<title>개인 정보 수정</title>
</head>
<body>

<input name="memberNum" type="hidden" value="${member.member_number}" >

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
    	<div class="updatepage">
			<form action="<%=conPath %>/profileModifyOk" method="post" enctype="multipart/form-data" id="form1"></form>
				<div class="category">
				<label for="uploadprofilepic"> <div class="info" id="profileimg">
                	<div class="profileimg-cell">
                		<img class="img" id="profilepic" src="resources/ProfilePic/${member.member_profile_pic }">
                        <input type="file" name="uploadfile" id="uploadprofilepic" form="form1">
					</div>
                    <div class="middle">
                        <div class="text">수정하기</div>
                    </div>
                </div> <%-- <div class="info" id="cameraimg"><img class="cameraimg" id="camera" src="<%=conPath %>/resources/img/camera.png"></div> --%> </label>
                <div class="clear"></div></div> <!-- 프로필사진 -->
				<div class="category"><input type="text" name="iname" id="myname" value="${member.member_name}" size="10" form="form1"></div>
				<div class="category">${member.member_id}</div>
				<div class="category"><button class="button" onclick="location.href='<%=conPath %>/pwModify'">비밀번호 변경</button>&nbsp&nbsp<button class="button" onclick="deletecheck()">회원탈퇴</button></div>
				<br />
				<div class="category" id="info">성 별  
				<input type="radio" name="gender" id="genderM" value="M" form="form1"><label for="genderM"> 남 </label>
				<input type="radio" name="gender" id="genderF" value="F" form="form1"><label for="genderF"> 여 </label>
				<input type="radio" name="gender" id="genderN" value="N" form="form1"><label for="genderN"> 입력안함 </label></div><!-- 성별 -->
				<div class="category" id="info"><textarea name="intro" style="resize: none; border:2px solid #a1a1a1; width:45%;height: 100px;border-radius: 12px;min-width: 280px" placeholder="자기소개를 입력해주세요" form="form1">${member.member_intro}</textarea></div> <!-- 자기소개 -->
				<br />
				<div class="category"><input class="button" type="submit" name="update" value="변경하기" form="form1">&nbsp&nbsp<button class="button" onclick="history.back(-1)">뒤로가기</button></div>
				<input name="memberNum" type="hidden" value="${member.member_number}" form="form1">
			
		</div>
	</div>

</body>
</html>