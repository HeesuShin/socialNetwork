<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

	<style type="text/css">
		html{
            font-size: 10px;
            line-height: 15px;
        }

		body {
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
			padding-top: 20px;
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
			margin-top:90px;
		}
		.form{
			font-size: 0.8em;
			color: white;
		}
		td{
			padding : 8px;
		}
		.button{
			background-color: white;
			border: none;
			padding: 5px;
			margin-right: 5px;
			margin-left: 5px;
			font-weight: bolder;
		}

	</style>
	<title>로그인화면</title>
</head>
<body>
<%
	String conPath = request.getContextPath();
%>
	<img src="<%=conPath %>/resources/img/logo1.png" id="logo">	
	<div class="mainbody">
		<form action="<%=conPath %>/main" method="post">
			<table class="form" align="center">
				<tr><td class="front">아이디</td><td><input class="text" type="text" name="id" required></td></tr>
				<tr><td class="front">비밀번호</td><td><input class="text" type="password" name="pw" required></td></tr>
				<tr><td colspan="2"><input class="button" type="submit" name="login" value="로그인"> <input class="button" type="button" name="join" value="회원가입" onclick="location.href='<%=conPath %>/join'"></td></tr>
			</table>
		</form>		
	</div>


</body>
</html>