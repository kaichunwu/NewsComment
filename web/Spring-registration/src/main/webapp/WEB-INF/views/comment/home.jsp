<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	</script> -->
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>">
	</script>
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" />
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js"/>">
	</script>
</head>
<body>
<!--<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. Welcome!!</P> -->


<nav class="navbar navbar-expand-sm bg-light navbar-light" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
    <img alt="brand not find" class="navbar-brand" height="60" src="<c:url value="/resources/pic/Like-Comment-Share.png"/>">
    </div>
    
    <ul class="navbar-nav">
    <li class="nav-item">
	<a href="<c:url value="/super/topics/weather" />" class="nav-link" id='topics'>Weather</a>
    </li>
    <li class="nav-item">
	<a href="<c:url value="/super/topics/news" />" class="nav-link" id='topics'>News</a>
    </li>
    <li class="nav-item">
    <a href="<c:url value="/super/topics/sports" />" class="nav-link" id='topics'>Sports</a>
    </li>
    <li class="nav-item">
    <a href="<c:url value="/super/topics/games" />" class="nav-link" id='topics'>Games</a>
    </li>
    <li class="nav-item">
    <a href="<c:url value="/super/topics/technology" />" class="nav-link" id='topics'>Technology</a>
    </li>
    <li class="nav-item">
    <a href="<c:url value="/super/topics/education" />" class="nav-link" id='topics'>Education</a>
    </li>
    </ul>
        
    <ul class="nav navbar-right">
    <c:if test="${username=='anonymousUser' }">
    	<li class="nav-item">
		<a href="<c:url value="/resources/login.jsp"/>" class="nav-link">
		Log in
		</a></li>
		<li class="nav-item">
		<a href='<c:url value="/views/signup" />' class="nav-link">
		Sign up
		</a></li>
	</c:if>
	<c:if test="${username!='anonymousUser' }">
	<li>
	<div class="dropdown">
    <button onclick="ot()" type="button" class="btn btn-secondary" data-toggle="dropdown">
      ${username }
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
<h1>Hello! Welcome to the website!!</h1>
<p>Click the link and button on the navbar can direct you to where you want.</p>
<font color="#FF0000">Below is a link that can test your connection to the server.</font><span> Thanks for using the website!</span>
</span>
</div>
<div id="test">
<br>
<a href="<c:url value="/ajax/test" />" class='textLink'>Test connection here</a>
</div>
</main>


<script type="text/javascript">
$(function(){
	$("a.textLink").click(function(){
		var link = $(this);
		$.ajax({
			url: link.attr("href"),
			dataType: "text",
			success: function(text){
				$("<span>"+text+"</span>").insertAfter(link);
			},
		});
		return false;
	});
	
	$("a#topics").click(function(){
		var link = $(this);
		$.ajax({
			url: link.attr("href"),
			dataType: "text",
			success: function(text){
				$("span.contents").html(text);
				/*$("<div>" + text + "</div>").insertBefore(content);
				$("#context").show();*/
				$("#test").hide();
			},
		});
		return false;
	});
	
	$("a.delete").click(function(){
		var link = $(this);
		$.ajax({
			url : link.attr("href"),
			dataType : "text",
			success : function(text){
				$("<div>" + text + "</div>").insertAfter(link);
			},
		});
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
