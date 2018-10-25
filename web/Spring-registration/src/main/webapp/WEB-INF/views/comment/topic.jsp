<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Topics here</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>">
</script>
</head>
<body>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>

<nav class="navbar navbar-expand-sm bg-light navbar-light" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
    <p class="navbar-brand">Comments Home</p>
    </div>
    
    <ul class="navbar-nav">
    <li class="nav-item">
	<a href="<c:url value="/ajax/topics/weather" />" class="nav-link" id='topics'>Weather</a>
    </li>
    <li class="nav-item">
	<a href="<c:url value="/ajax/topics/news" />" class="nav-link" id='topics'>News</a>
    </li>
    <li class="nav-item">
    <a href="<c:url value="/ajax/topics/sports" />" class="nav-link" id='topics'>Sports</a>
    </li>
    <li class="nav-item">
    <a href="<c:url value="/ajax/topics/games" />" class="nav-link" id='topics'>Games</a>
    </li>
    <li class="nav-item">
    <a href="<c:url value="/ajax/topics/technology" />" class="nav-link" id='topics'>Technology</a>
    </li>
    <li class="nav-item">
    <a href="<c:url value="/ajax/topics/education" />" class="nav-link" id='topics'>Education</a>
    </li>
    <li class="nav-item">
    <a href="<c:url value="/" />" style='color:red' class="nav-link">Return to home</a>
    </li>
    </ul>
    
    <ul class="nav navbar-right">
    <c:if test='<%=SecurityContextHolder.getContext().getAuthentication().getName() == "anonymousUser" %>'>
    	<li class="nav-item">
		<a href="<c:url value="/resources/login.jsp"/>" class="nav-link">
		Log in
		</a></li>
		<li class="nav-item">
		<a href='<c:url value="/views/signup" />' class="nav-link">
		Sign up
		</a></li>
	</c:if>
	<c:if test='<%=SecurityContextHolder.getContext().getAuthentication().getName() != "anonymousUser" %>'>
	<li>
	<div class="dropdown">
    <button onclick="ot()" type="button" class="btn btn-secondary" data-toggle="dropdown">
      <%=SecurityContextHolder.getContext().getAuthentication().getName() %>
    </button>    
	<div class="dropdown-menu dropdown-menu-right" id="text" role="menu">
	<a href="<c:url value="/secure/inform.jsp"/>" class="dropdown-item">Users Main Page</a>
	<a href="<c:url value="/views/info" />" class="dropdown-item">Edit Personal Information</a>
	<a href="<c:url value="/views/show/shows" />" class="dropdown-item">Lookup Personal Information</a>
	<a href="<c:url value="/views/comment/topic" />" class="dropdown-item">Add Comment</a>
	<a href="<c:url value="/views/logout" />" class="dropdown-item" style='color:red'>Logout</a>
	</div>
	</div>
	</li>
	</c:if>
	</ul>
    </div>
</nav>
<main role="main" class="container">
<div id='context'>
<span class='contents'>
<h1>Welcome!! You can comment to any topic you want!</h1>
<p>Clicking the link on the navbar can direct you to the topic you want.</p>
<p>Then click the chat button below, and you can add the comments!</p>
<font color="#46A3FF">Have Fun!!</font>
</span><br>
<button type="button" class='addc btn' style='background-image:url("<c:url value="/resources/pic/addc.png"/>");width:48px;hight:60px;'>&ensp;</button>
</div><br><br>
<form:form id='comments' modelAttribute="comments" action='${pageContext.request.contextPath }/views/addcomment'
style='max-width:900px;background-color:#C0C0C0;border-radius: 10px;' class="form-signin" method='POST'>
		<span>
			<form:label for="topic" path="topic">Topic:</form:label>
			<span id='thistopic'>All</span>
			<form:hidden path="topic" id="topic"/> <form:errors path="topic"> </form:errors>
		</span>
		<p>
			<form:label for="comment" path="comment" >Comment:</form:label><br>
			<form:textarea path="comment" class="form-control" rows="7" id="comment"/> <form:errors path="comment"> </form:errors>
		</p>
		<p>
			<button class="btn btn-lg btn-primary" type="submit">Submit</button>
		</p>		
</form:form>
</main>

<script type="text/javascript">
$(function(){
	$(".addc").hide();
	$("#comments").hide();
	$("a#topics").click(function(){
		$("#comments").hide();
		$("#thistopic").text($(this).text());
		$("#topic").attr("value",$("#thistopic").text());
		var link = $(this);
		$.ajax({
		url: link.attr("href"),
		dataType: "text",
		success: function(text){
			$("span.contents").html(text);
			$(".addc").show();
			},
		});
	return false;
	});
	
	$("button.addc").click(function(){
		$("#comments").show();
	});
});

function ot(){
	if(document.getElementById("text").style.display=="none"){
		document.getElementById("text").style.display="block";
	}
	else{
		document.getElementById("text").style.display="none";
	}
}
</script>

</body>
</html>