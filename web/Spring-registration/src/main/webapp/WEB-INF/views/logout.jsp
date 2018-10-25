<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" />
<title>Logout</title>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-light navbar-light" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
    <p class="navbar-brand">Log out</p>
    </div>
    </div>
</nav>
<div class="text-center">
<p>Hello</p>
<c:if test="${not empty logout }">
<p>${logout }</p>
</c:if>
<a href="<c:url value="/" />">Return to home</a><br>
</div>
</body>
</html>