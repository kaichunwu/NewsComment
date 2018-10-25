<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" />
<title>Show Information here</title>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-light navbar-light" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
    <p class="navbar-brand">User Detail Information</p>
    </div>
    
    <ul class="nav navbar-right">
    <c:if test="${userinfo.username=='anonymousUser' || empty userinfo}">
    	<li class="nav-item">
		<a href="<c:url value="/resources/login.jsp"/>" class="nav-link">
		Log in
		</a></li>
		<li class="nav-item">
		<a href='<c:url value="/views/signup" />' class="nav-link">
		Sign up
		</a></li>
		<li class="nav-item">
    	<a href="<c:url value="/" />" style='color:red' class="nav-link">Return to home</a>
    	</li>
	</c:if>
	<c:if test="${not empty userinfo }">
	<c:if test="${userinfo.username!='anonymousUser' }">
	<li>
	<div class="dropdown">
    <button onclick="ot()" type="button" class="btn btn-secondary" data-toggle="dropdown">
    ${userinfo.username}
    </button>    
	<div class="dropdown-menu dropdown-menu-right" id="text" role="menu">
	<a href="<c:url value="/secure/inform.jsp"/>" class="dropdown-item">Users Main Page</a>
	<a href="<c:url value="/views/info" />" class="dropdown-item">Edit Personal Information</a>
	<a href="<c:url value="/views/show/shows" />" class="dropdown-item">Lookup Personal Information</a>
	<a href="<c:url value="/views/comment/topic" />" class="dropdown-item">Add Comment</a>
	<a href="<c:url value="/" />" class="dropdown-item">Return to home</a>
	<a href="<c:url value="/views/logout" />" style='color:red' class="dropdown-item">Logout</a>
	</div>
	</div>
	</li>
	</c:if>
	</c:if>
	</ul>
    
    </div>
</nav>
<div class="container">
<br>
<c:if test="${not empty userinfo }">
<p class="text-center" style="color:#FF5809">User Information</p>
<table class="table">
<thead>
<tr>
	<th>Username</th>
	<th>FirstName</th>
	<th>LastName</th>
	<th>BirthDate</th>
	<th>E-Mail</th>
	<th>Address</th>
	<th>Phone</th>
</tr>
</thead>
<tbody>
<tr>
	<td>${userinfo.username }</td>
	<td>${userinfo.firstName }</td>
	<td>${userinfo.lastName }</td>
	<td>${userinfo.birthDate }</td>
	<td>${userinfo.email }</td>
	<td>${userinfo.address }</td>
	<td>${userinfo.phone }</td>
</tr>
</tbody>
</table>

</c:if>

<c:if test="${not empty userinfo }">
<c:if test="${not empty userinfo.comments }">
<p class="text-center" style="color:blue">Comments</p>

<table class="table">
<thead>
<tr>
	<th>Topic</th>
	<th>Comment</th>
	<th>Published Time</th>
</tr>
</thead>
<tbody>
<c:forEach items="${userinfo.comments}" var="comment">
<tr>

	<td>${comment.topic }</td>
	<td>${comment.comment }</td>
	<td>${comment.time }</td>

</tr>
</c:forEach>
</tbody>
</table>
</c:if>
</c:if>

<c:if test="${not empty comments }">
<div style="background-color:#FFFF93">
<ul>
You have added:
<li>Comment: ${comments.comment }</li>
<li>Topic on ${comments.topic }. Published on ${comments.time }</li>
</ul>
</div>
</c:if>

</div>


<script type="text/javascript">
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