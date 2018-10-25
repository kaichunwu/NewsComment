<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/signin.css"/>" />
<title>User information</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>">
</script>
</head>
<body onload='document.f.firstName.focus();' class="text-center">
	<form:form name='f' modelAttribute="userinfo" action='${pageContext.request.contextPath }/views/usersinfo'
		class="form-signin" method='POST'>
		<h3 class="h3 mb-3 font-weight-normal">Update your information</h3>
		<div>
			<form:hidden path="id"/>
	  		<form:label for="username" path="username">Username:</form:label>
			<span id="user" class="text-muted"><sec:authentication property="name"/></span>
			<form:hidden path="username" id="username"/> <form:errors path="username"> </form:errors>
		</div>
		<p>
			<form:label for="firstName" path="firstName" class="sr-only">FirstName:</form:label>
			<form:input name="firstName" path="firstName" class="form-control" placeholder="FirstName"/> <form:errors path="firstName"> </form:errors>
		</p>
		<p>
			<form:label for="lastName" path="lastName" class="sr-only">LastName:</form:label>
			<form:input path="lastName" class="form-control" placeholder="LastName"/> <form:errors path="lastName"> </form:errors>
		</p>
		<p>
			<form:label for="birthDate" path="birthDate" class="sr-only">BirthDate:</form:label>
			<input type="date" id="bir" class="form-control"/>
			<form:hidden path="birthDate" id="birthDate"/>
			<form:errors path="birthDate"> </form:errors>
			<c:if test="${not empty userinfo.birthDate }">
			<span class="text-muted">${userinfo.birthDate}</span>
			</c:if>
		</p>
		<p>
			<form:label for="email" path="email" class="sr-only">Email:</form:label>
			<form:input path="email" class="form-control" placeholder="*@*"/> <form:errors path="email"> </form:errors>
		</p>
		<p>
			<form:label for="address" path="address" class="sr-only">Address:</form:label>
			<form:input path="address" class="form-control" placeholder="Address"/> <form:errors path="address"> </form:errors>
		</p>
		<p>
			<form:label for="phone" path="phone" class="sr-only">Phone:</form:label>
			<form:input path="phone" class="form-control" placeholder="(xxx)xxx-xxxx"/> <form:errors path="phone"> </form:errors>
		</p>		
		<p>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		</p>
		<a href="<c:url value="/" />" class="mt-5 mb-3 text-muted">Return to home</a><br>
	</form:form>

<script type="text/javascript">
$(function(){
	$("#bir").change(function(){
	  $("#birthDate").attr("value",$("#bir").val());
	});
	$("#username").attr("value",$("#user").text());
});
</script>
</body>
</html>