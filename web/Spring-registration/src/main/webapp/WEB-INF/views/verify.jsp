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
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>">
</script>
<title>Verify here</title>
</head>
<body onload='document.f.verNum.focus();' class="text-center">
<form:form action='${pageContext.request.contextPath }/views/verifies'
class="form-signin" modelAttribute="verify" method='POST' name='f'>
	<form:label for="verNum" path="verNum">Please enter verified Number</form:label>
	<form:password name="verNum" path="verNum" class="form-control" placeholder="Verified Number" id="ver"/>
	<form:errors path="verNum"></form:errors>
	<form:hidden path="username" />
	<form:hidden path="password" />
	<button class="btn btn-lg btn-primary btn-block" type="submit" id="sub">Submit</button>
	<br><a href="<c:url value="/" />" class="mt-5 mb-3 text-muted">Return to home</a>
</form:form>


<script type="text/javascript">
$(function(){
	$("#sub").hide();
	$("#ver").change(function(){
		if($("#ver").val()=="1234"){
			$("#sub").show();
		}
		else{
			$("<span style='color:red'>Verified Error!</span>").insertAfter("#ver");
		}
	});
});
</script>
</body>
</html>