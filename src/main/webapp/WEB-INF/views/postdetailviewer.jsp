<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String conPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<c:forEach items="${post}" var="post" varStatus="status">
		<div class="popupsession">
			<div class="precontents">
				<div class="profileimg">
					<a href="<%=conPath %>/profile"> <img src="resources/ProfilePic/62.jpg"></a>
				</div>
				<div class="nameanddate">
					<div class="profilename"> <a href="<%=conPath %>/profile"> 정창훈 </a> </div>
					<div class="date">${post.post_date }  </div>
				</div>
				<div class="cancel_img">
				<img alt="" src="<%=conPath %>/resources/img/x.png" class="pic_cancel">
			</div>
			<div class="clear"></div>
		</div>
		<div class="images">
			<div class="imgbox">
			 	<c:forEach var="picture" items="${picture}">
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
			<div class="react"><img id="good" alt="" src="<%=conPath %>/resources/img/good.png">&nbsp; : ${post.post_like} <img id="reply" alt="" src="<%=conPath %>/resources/img/reply.png"> &nbsp;: ${replySize }</div>
			<div class="cont">${post.post_text}</div>
				<div class="cont2">댓글보기헷</div>
				<div class="replyarea">
					<div class="reply"><input type="text" id="replyinput" name="text" placeholder="댓글을 입력해 주세용">
						<input type="hidden" name="postNum" id="replypostnum" value="${post.post_number}">
						<img alt="" src="<%=conPath %>/resources/img/enterkey.png" class="replyenter">
					</div>
					<div class="replybox">
						<c:forEach var="reply" items="${reply}" varStatus="replyStatus">
							<div class="reply"><a href="<%=conPath %>/profile">${replyName[replyStatus.index] }</a> ${reply.reply_text }</div>							
						</c:forEach>	
					</div>
					
					<div class="clear"></div>	
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>