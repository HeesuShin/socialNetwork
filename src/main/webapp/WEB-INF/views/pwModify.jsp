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
        .modifypage{
            margin: auto;
            padding-top: 20px;
            padding-bottom: 50px;
            width: 90%;
            background-color: #ffffff;
            clear:both;
            line-height: 35px;

        }
        .notice{
            width: 30%;
            min-width: 280px;
            margin: auto;
            line-height: 25px;
            text-align: left;
            font-size: 14px;
        }
        .pwinputarea{
            margin: auto;
            margin-top: 5px;
            margin-bottom: 5px;
            border: 1px solid #a1a1a1;
            border-radius: 8px;
            width: 30%;
            min-width: 280px;
            text-align: left;
            padding-left: 10px;
        }
        .pwcheck{
            width: 40%;
            text-align: left;
            margin: auto;
            color: red;
        }
        .pw{

            border: none;
            font-size: 15px;
        }
        .button{
	        -webkit-appearance: none;
            border : 1px solid #000000;
            font-size: 13px;
            padding: 5px;
            border-radius: 12px;
            background-color: #ffffff;
        }
        
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $(".button").mouseover(function(){
                /*$(this).css({"color":"#00c003","border":"1px solid #00c003"});*/
                $(this).css({"color":"#ffffff","background-color":"#000000"});
            });

            $(".button").mouseout(function(){
                /*$(this).css({"color":"#000000","border":"1px solid #000000"});*/
                $(this).css({"color":"#000000","background-color":"#ffffff"});
            });

            $("#pw1").keyup(function(){
                if($('#pw1').val().length==0 | $('#pw1').val().length>7){
                    $(".pwcheck").html("<br />");
                }else{
                    $(".pwcheck").html("비밀번호가 너무 짧습니다.");
                }

                if($("#pw2").val().length!=0 & $(this).val() != $("#pw2").val()){
                    $(".pwcheck").html("비밀번호가 일치하지 않습니다.");
                }
            });

            $("#pw2").keyup(function(){
                if( $("#pw1").val() === $(this).val() | $(this).val().length ==0){
                    if($('#pw1').val().length>7){ 
                        $(".pwcheck").html("<br />");
                    }else{
                        $(".pwcheck").html("비밀번호가 너무 짧습니다.");
                    }
                }else{
                    $(".pwcheck").html("비밀번호가 일치하지 않습니다.");
                }
            });
        });

        
        </script>

<title>비밀번호 변경</title>
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
        <div class="modifypage">

            <h2>비밀번호 변경</h2>
            <div class="notice">
                <p><b>※ 안전한 비밀번호로 내정보를 보호하세요.</b><chang style="color: gray;"><br />ㆍ6자 이상으로 영어와 숫자를 합쳐주세요.<br />ㆍ사용한적 없는 비밀번호가 안전합니다.</chang></p>
            </div>
            <form action="profileupdate.html" id="form1"></form>
                <div class="pwinputarea"><input class="pw" type="password" name="currentpw" placeholder="현재 비밀번호" required="required" form="form1"></div>
                <div class="pwinputarea"><input class="pw" type="password" id="pw1" name="pw1" placeholder="새 비밀번호" required="required" form="form1"></div>
                <div class="pwinputarea"><input class="pw" type="password" id="pw2" name="pw2" placeholder="비밀번호 확인" required="required" form="form1"></div>
                <div class="pwcheck"><br /></div>
                <div class="category"><input class="button" type="submit" name="update" value="변경하기" form="form1">&nbsp&nbsp<button class="button" onclick="history.back(-1)">뒤로가기</button></div>
        </div>

    </div>
</body>
</html>