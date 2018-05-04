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
		.searchpage{	
			clear:both;
            width: 90%;
            margin: auto;
            padding-top: 10px;
            padding-bottom: 20px;
            background-color: #ffffff; 
            margin-bottom:30px;
        }
        
        .resultsession{
        	width : 100%;
        	clear : both;
        }
        
        .profileimg{
        	position: relative;
        	width : 8%;
        	margin : 1% 0 0 2%;
        	float : left;
        	padding-top: 8%;
        	overflow: hidden;
        	border-radius: 50%;
        }
        
        .profileimg .profileimg-cell{
        	width: 100%;
        	position: absolute;
        	top: 0;
        	left: 0;
        	right: 0;
        	bottom: 0;
        	transform: translate(50%,50%);
        }
        .profileimg .profileimg-cell img{
        	transform: translate(-50%,-50%);
        }
        
        .profileimg img.img1{
        	width:100%;
        	height:auto;
        	max-width: none;
        }
        .profileimg img.img2{
        	width: auto;
        	height: 100%;
        	max-height: none;
        }
        .membername{
      	 	width : 16%;
        	margin : 1%;
        	padding: 2% 0 0 0;
        	float : left;
        }
        .memberintro{
        	width : 68%;
        	margin : 1%;
        	padding: 2% 0 0 0;
        	float : left;
        }
		.clear{
			clear : both;
		}
		a:hover{
        	color:blue;
        }
        a{
	        text-decoration: none;
        	color:#000000;
        	font-weight:bolder;
        }
        
	</style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=conPath %>/resources/js/imgclass.js"></script>
    
    <script type="text/javascript">
	    $("a").each(function(){
			$(this).attr("data-ajax","false");
		});
		
		$("form").each(function(){
			$(this).attr("data-ajax","false");
		});
		
		window.onload=function(){
			$(".profileimg-cell .img").each(function(){
				fullimg($(this),$(".profileimg-cell"));
			});
		};
    </script>

<title>검색결과</title>
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
    	<div class="searchpage">
    	<c:forEach items="${searchResult }" var = "member">
    		<div class="resultsession">
    			<div class="profileimg">
    				<div class="profileimg-cell">
						<img class="img" src="resources/ProfilePic/${member.member_profile_pic}">
					</div>
    			</div>
    			<div class="membername"><a href="<%=conPath %>/profile?memberId=${member.member_id}" >
    					${member.member_name }
    				</a>
    			</div>
    			<div class="memberintro">
    				${member.member_intro }
    			</div>
    			<div class="clear"></div>
    		</div>
    	</c:forEach>
    	</div>
    	
    	
    </div>
    

</body>
</html>