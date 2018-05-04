<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<meta http-equiv="Cache-Control" content="no-cache">
	<%
		String conPath = request.getContextPath();
	%>

	<link rel="stylesheet" type="text/css" href="<%=conPath %>/resources/css/header.css">
	<style type="text/css">

        .insertpage{
            margin: auto;
            padding-top: 20px;
            padding-bottom: 50px;
            width: 90%;
            background-color: #ffffff;
            clear:both;
            line-height: 35px;
        }

        .pictures{
            padding: 10px 0 10px 0;
        }

        .category{
            width: 50%;
            margin: auto;
        }


        .picture{
            display: none;
        }
        .label{
            margin : auto;
            width: 20%;
            max-width: 200px;
            min-width: 100px;
            border : 2px solid gray;
            border-radius: 12px;
        }
        .picbox{
            margin : auto;
            padding: 5px;
            border : 2px solid gray;
            border-radius: 12px;
            width: 50%;
            min-width: 270px;
            position: relative;
            margin-bottom: 10px;
        }
        .picbox .pictureview{
            padding-top: 10px;
        }
        .picbox .pic_cancel{
            position: absolute;
            right: 2%;
            top: 2%;
            width: 4%;
        }

        .button{
	        -webkit-appearance: none;
            border : 1px solid #000000;
            font-size: 13px;
            padding: 5px;
            border-radius: 12px;
            background-color: #ffffff;
        }
        .content{
            border:2px solid #a1a1a1;
            border-radius: 12px;
            line-height: 20px;
            width: 40%;
            min-width: 280px;
            height: 100%;
            min-height: 100px; 
            padding: 1%;
            resize: none;
        }
        .notice{
            width: 60%;
            min-width: 280px;
            max-width: 500px;
            margin: auto;
            line-height: 25px;
            text-align: left;
            font-size: 12px;
        }
	</style>


 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
	<script type="text/javascript" src="<%=conPath %>/resources/js/button.js"></script>	


    <script type="text/javascript">
        var count = 2;
        var url = "";

        $(document).on("change",".picture",function(){
            var temp = $(this);
            
            if($(this).val().length > 0 ){
                var reader = new FileReader();
                var path = "<%=conPath %>";
                reader.onload = function(e){
                    temp.parents(".picbox").append('<img class="pictureview" src="'+ e.target.result+'" style="max-width:95%;max-height:100%"><img src="'+ path +'/resources/img/x.png" class="pic_cancel" title="사진삭제">');
                }
                reader.readAsDataURL(this.files[0]);

                temp.parents(".picbox").children("label").css("display" , "none");

                temp.parents(".pictures").append('<div class="picbox"><label for="picture' + count +'"><div class="label">사진추가</div></label><input type="file" id="picture' + count +'" class="picture" name="pic" form="uploadform" required></div>');
                count++;
            };
        });

        $(document).on("click",".pic_cancel",function(){
            $(this).parents(".picbox").remove();
        });

        $(document).ready(function(){
            $(".button").mouseover(function(){
                /*$(this).css({"color":"#00c003","border":"1px solid #00c003"});*/
                $(this).css({"color":"#ffffff","background-color":"#000000"});
            });

            $(".button").mouseout(function(){
                /*$(this).css({"color":"#000000","border":"1px solid #000000"});*/
                $(this).css({"color":"#000000","background-color":"#ffffff"});
            });


            $(".label").mouseover(function(){
                /*$(this).css({"color":"#00c003","border":"1px solid #00c003"});*/
                $(this).css({"background-color":"#F2F2F2"});
            });

            $(".label").mouseout(function(){
                /*$(this).css({"color":"#000000","border":"1px solid #000000"});*/
                $(this).css({"background-color":"#ffffff"});
            });

        });

        $(document).on("change","html",function(){
            $(".label").mouseover(function(){
                /*$(this).css({"color":"#00c003","border":"1px solid #00c003"});*/
                $(this).css({"background-color":"#F2F2F2"});
            });

            $(".label").mouseout(function(){
                /*$(this).css({"color":"#000000","border":"1px solid #000000"});*/
                $(this).css({"background-color":"#ffffff"});
            });
        });
        
        
        function requiredcheck(){
        	$this = $('.uploadform').children('.pictures').children('.picbox');
        	if($this.children('input').length != 1){
        		$this.children('input:last-child').attr('required',false)
        		$('#submitbutton').click();
        	}else{
        		alert("사진 한장이상 등록하세요.")
        	}
        	
        };
        
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
        <div class="insertpage">

            <h2>게시하기</h2>
            <div class="notice">
                <p><b>※ 게시글 작성 수칙</b><br /><chang style="color: gray">ㆍ10장 이내의 사진과 설명을 함께 작성해주세요.<br />ㆍ적절하지 못한 사진 등록시 이용에 제한을 받을수 있습니다.</chang></p>
            </div>
            <div class="uploadform">
            <form action="<%=conPath %>/postInsertOK" method="post" enctype="multipart/form-data" id="uploadform"></form>
                <div class="pictures" id="pictures">
                    <div class="picbox">
                        <label for="picture1"><div class="label">사진선택</div></label>
                        <input type="file" id="picture1" class="picture" name="pic" onchange="" form="uploadform" required>
                    </div>                
                </div>

                <div>
                <textarea class="content" name="content" form="uploadform" placeholder="내용을 입력하세요."></textarea>
                </div>

				<button class="button" onclick="requiredcheck()">등록하기</button>
                <input id="submitbutton" type="submit" name="" value="등록하기" form="uploadform" onclick="" style="display:none">
            
            </div>
        </div>

    </div>


</body>
</html>