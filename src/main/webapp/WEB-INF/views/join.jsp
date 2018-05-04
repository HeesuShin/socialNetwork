<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
	String conPath = request.getContextPath();
%>

	<style type="text/css">
		html{
/*
			width: 100%;*/
            font-size: 0.8em;
            line-height: 15px;
        }

		body {
			width: 100%;
            text-align: center;
            min-width: 300px;
            margin: auto;
            font-size: 100%;
            background-color: #000000;
		}

		.mainbody{
			width: 80%;
			max-width: 500px;
			margin: auto;
			margin-top: 10px;
			background-color: #000000;
			border: 3px solid white;
			border-radius: 15px;
			padding-top: 10px;
			padding-bottom: 30px;
		}
		.mainbody input{
			float: center;
		}
		.text{
			width: 90%;
		}
		.front{
			width: 30%;
			font-size: 12px;
		}
		#logo{
			max-width: 100%;
			max-height: 100%;
			margin-top: 50px;
		}
		.form{
			font-size: 0.8em;
			color: white;
		}
		td{
			padding : 5px;
		}
		.button{
			background-color: white;
			border: none;
			padding: 5px;
			margin-right: 5px;
			margin-left: 5px;
			font-weight: bolder;
		}

		#pwchk, #idchk{
			font-size: 0.7em;
		}

	</style>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<script type="text/javascript">
		/*$(document).readey(function(){
			$('.text').keyup(function(){
				if()
			});
		});*/

		function idcheck(){

			var idlength = document.getElementById('id').value.length;
			if(idlength === 0 ){
				//$('#idchk').
				document.getElementById('idchk').innerHTML = '아이디를 입력하세요.';
				document.getElementById('idchk').style.color = "white";
			}else if(idlength <= 6){
				document.getElementById('idchk').innerHTML = "너무 짧습니다.";
				document.getElementById('idchk').style.color = "red";
			}else if(idlength > 6){
				//아이디 중복확인 넣기........jsp랑 ajax사용
				$.ajax({
					url: "<%=conPath %>/checkID",
					type:"POST",
					data:{
						id :document.getElementById('id').value
					},
					success:function(data){
						var check= data;
						if(check==0){
							document.getElementById('idchk').innerHTML = "이미 사용중입니다.";
							document.getElementById('idchk').style.color = "red";		
						}else{
							var tempid =document.getElementById('id').value;
							if(tempid.indexOf("@") != -1){
								document.getElementById('idchk').innerHTML = "사용가능한 아이디입니다.";
								document.getElementById('idchk').style.color = "white";
							}else{
								document.getElementById('idchk').innerHTML = "메일주소를 입력해주세요.";
								document.getElementById('idchk').style.color = "red";
							}
						}
					}
				});
			}
		};

		function pwcheck(){
			if(document.getElementById('pw').value.length==0){
				document.getElementById('pwchk').innerHTML = '비밀번호를 입력하세요.';
				document.getElementById('pwchk').style.color = "white";
			}else if(document.getElementById('pw').value.length<7){
				document.getElementById('pwchk').innerHTML = "너무 짧습니다.";
				document.getElementById('pwchk').style.color = "red";
			}else{
				document.getElementById('pwchk').innerHTML = "";
			}
		};


		function pwcheck2(){

			if(document.getElementById('pw').value == document.getElementById('pw2').value){
				//$('#idchk').
				document.getElementById('pwchk').innerHTML = '비밀번호 확인 완료';
				document.getElementById('pwchk').style.color = "white";
			}else if(document.getElementById('pw').value != document.getElementById('pw2').value){
				document.getElementById('pwchk').innerHTML = "비밀번호가 일치하지 않습니다.";
				document.getElementById('pwchk').style.color = "red";
			}
		};
		
		function validcheck(){
			if(((document.getElementById('idchk').innerHTML) !='사용가능한 아이디입니다.')){
				alert("아이디를 확인하세요.")
				return false;
			}else if(((document.getElementById('pwchk').innerHTML) !='비밀번호 확인 완료')){
					alert("비밀번호를 확인하세요.")
					return false;
			}else if( (document.getElementById('idchk').innerHTML).value.length == 0  ){
				alert("이름을 입력하세요.")
				return false;
			}else{
				return true;
			}
		}

	</script>
	<title>로그인화면</title>
</head>
<body>


	<img src="<%=conPath %>/resources/img/logo1.png" id="logo">	
	<div class="mainbody">
		<form action="<%=conPath %>/joinOk">
			<table class="form" align="center">
				<tr><td class="front">아이디</td><td><input class="text" type="email" id="id" name="id" onkeyup="idcheck()" required></td></tr>
				<tr><td> </td><td id="idchk">아이디(이메일)를 입력하세요.</td></tr>
				<tr><td class="front">비밀번호</td><td><input class="text" type="password" id="pw" name="pw" onkeyup="pwcheck()" required></td></tr>
				<tr><td class="front">확 인</td><td><input class="text" type="password" id="pw2" name="" onkeyup="pwcheck2()" required></td></tr>
				<tr><td> </td><td id="pwchk">비밀번호를 입력하세요.</td></tr>
				<tr><td class="front">이 름</td><td><input class="text" type="text" id="iname" name="iname" required></td></tr>
				<tr><td colspan="2"><input class="button" type="submit" name="login" value="가입하기" onclick="return validcheck();"> <input class="button" type="button" name="back" value="뒤로가기" onclick="history.back(-1)"></td></tr>
			</table>
		</form>		
	</div>
</body>
</html>