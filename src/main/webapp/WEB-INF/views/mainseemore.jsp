<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
	String conPath = request.getContextPath();
%>
</head>
<body>
	<c:forEach items="${post}" var="post" varStatus="status">
		<div class="boardpage">
			<div class="precontents">
				<div class="profilimg">						
						<div class="profileimg-cell"><a href="<%=conPath %>/profile"><img class="img" src="resources/ProfilePic/${member[status.index].member_profile_pic}"></a></div>
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
		

</body>
</html>