<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>">
</script>
<title>User Information</title>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-light navbar-light" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
    <p class="navbar-brand">User Home Page</p>
    </div>

    <ul class="navbar-nav">
    <li class="nav-item">
	<a href="<c:url value="/views/html" />" class="nav-link">
	Username : <span name="username"><sec:authentication property="name"/></span>
	</a>
	</li>
    <li class="nav-item">
	<a href="<c:url value="/views/info" />" class="nav-link">Manage your account</a>
	</li>
    <li class="nav-item">
	<a href="<c:url value="/views/show/shows" />" class="nav-link">Lookup your account</a>
	</li>
    <li class="nav-item">
	<a href="<c:url value="/views/comment/topic" />" class="nav-link">Add Comment here</a>
	</li>
    <li class="nav-item">
	<a href="<c:url value="/" />" class="nav-link">Return to home</a>
	</li>
    <li class="nav-item">
	<a href="<c:url value="/views/logout" />" class="nav-link" style='color:red'>Logout here</a>
	</li>
    </ul>
    </div>
</nav>

<div style="text-align:center">
<span class="text-center" style="float:left">
<a href="<c:url value="/ajax/pic" />" class='picLink'>
<img alt="portrait not find" align="middle" src="<c:url value="/resources/pic/portrait.png"/>">
</a></span>
<span id="userinformation" style="float:left">user</span>
</div>

<script type="text/javascript">
$(function(){
	$("#userinformation").hide();
	$("a.picLink").click(function(){
		var link = $(this);
		$.ajax({
			url: link.attr("href"),
			dataType: "text",
			success: function(text){
				$("span#userinformation").html(text);
				$("#userinformation").show();
			},
		});
		return false;
	});	
		
});
</script>
</body>
</html>