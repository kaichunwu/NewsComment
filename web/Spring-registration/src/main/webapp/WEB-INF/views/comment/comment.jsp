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
<link rel="stylesheet" href="<c:url value='/resources/css/OpenFile.css' />" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>">
</script>
</head>
<body>
<main role="main" class="container">
<img alt="" src="http://www.northeastern.edu/images/logo.png"/>
<div id='all'>
<ul id='main'>
	<li><a href="<c:url value="/ajax/topics/weather" />" class="topics">Weather</a></li>
	<li><a href="<c:url value="/ajax/topics/news" />" class="topics">News</a></li>
	<li><a href="<c:url value="/ajax/topics/sports" />" class="topics">Sports</a></li>
	<li><a href="<c:url value="/ajax/topics/games" />" class="topics">Games</a></li>
	<li><a href="<c:url value="/ajax/topics/technology" />" class="topics">Technology</a></li>
	<li><a href="<c:url value="/ajax/topics/education" />" class="topics">Education</a></li>
	<li><a href="<c:url value="/" />" style='color:red'>Return to home</a></li>
</ul>
</div>
<br><br>

<div id='context'>
<span class='contents'>Context</span><br>
<button type="button" class='addc'>Add Comments</button>
</div>

</main>
<form:form id='comments' modelAttribute="comments" action='${pageContext.request.contextPath }/views/addcomment'
style='max-width:900px' class="form-signin" method='POST'>
		<p>
			<form:label for="topic" path="topic">Topic:</form:label>
			<span id='thistopic'>All</span>
			<form:hidden path="topic" id="topic"/> <form:errors path="topic"> </form:errors>
		</p>
		<p>
			<form:label for="comment" path="comment" >Comment:</form:label><br>
			<form:textarea path="comment" class="form-control" rows="7" id="comment"/> <form:errors path="comment"> </form:errors>
		</p>
		<p>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Add comment</button>
		</p>		
</form:form>


<script type="text/javascript">
$(function(){
	$("p").attr("style","cursor:pointer");
	$("#comments").hide();
	$("#context").hide();
	$("a.topics").click(function(){
		$("#comments").hide();
		$("#thistopic").text($(this).text());
		$("#topic").attr("value",$("#thistopic").text());
		var link = $(this);
		$.ajax({
			url: link.attr("href"),
			dataType: "text",
			success: function(text){
				$("#context").show();
				$("span.contents").html(text);
				/*$("<div>" + text + "</div>").insertBefore(content);
				$("#context").show();*/
			},
		});
		return false;
	});
	$("button.addc").click(function(){
		$("#comments").show();
	});
});
</script>
</body>
</html>