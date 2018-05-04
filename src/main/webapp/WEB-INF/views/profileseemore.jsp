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
	<div class="postmainimg" id="${post.post_number }">
	<c:set var="pictureinfo" value="picture${post.post_number}" />
	<c:set var="picture" value="${requestScope[pictureinfo]}" />
		<div class="postmainimg-cell"><img class="img" src="resources/PostPic/${picture.picture_path}"></div>
	</div>
	</c:forEach>
	<div class="clear"></div>
</body>
</html>