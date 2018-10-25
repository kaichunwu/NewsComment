<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" />
<title>Create user</title>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-light navbar-light" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
    <p class="navbar-brand">Sign up</p>
    </div>

    <ul class="navbar-nav">
    <li class="nav-item">Congratulations</li>
    </div>
    </ul>
</nav>
<div class="text-center">
<c:if test="${not empty status }">
<c:if test="${status=='successful' }">
<h1>You are ${status } in add a new user.</h1>
</c:if>
<c:if test="${status!='successful' }">
<h1>You are updating a user.</h1>
</c:if>
</c:if>
<c:if test="${not empty user }">
<p>Username: ${user.username }</p>
<p>Role: ${user.role }</p>
</c:if><br>
<p>Please<a href="<c:url value="/resources/login.jsp"/>">login here.</a></p>


<a href="<c:url value="/" />">Return to home</a>
</div>

</body>
</html>