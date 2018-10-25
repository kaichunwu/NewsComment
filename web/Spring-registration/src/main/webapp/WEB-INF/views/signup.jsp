<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/signin.css"/>" />
<title>Sign up here</title>
</head>
<body onload='document.f.username.focus();' class="text-center">	
	<form:form name='f' modelAttribute="user" action='${pageContext.request.contextPath }/views/users'
	class="form-signin" method='POST'>
	<h3 class="h3 mb-3 font-weight-normal">Create your account</h3>
		<p>
			<form:label for="username" path="username" class="sr-only">Username:</form:label>
			<form:input name="username" path="username" class="form-control" placeholder="Username"/> <form:errors path="username"> </form:errors>
		</p>
		<p>
			<form:label for="password" path="password" class="sr-only">Password:</form:label>
			<form:password path="password" class="form-control" placeholder="Password"/> <form:errors path="password"> </form:errors>
		</p>
		<p>
			<form:select path="role" class="custom-select d-block w-100">
				<form:option value="user">User</form:option>			
				<form:option value="supervisor">Supervisor</form:option>
			</form:select>
		</p>
		<p>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		</p>
		<a href="<c:url value="/" />" class="mt-5 mb-3 text-muted">Return to home</a><br>
	</form:form>

	

</body>
</html>