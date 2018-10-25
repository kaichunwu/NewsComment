<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/signin.css"/>" />
<title>Login here</title>
</head>
<body onload='document.f.username.focus();' class="text-center">   
    <form name='f' action='${pageContext.request.contextPath }/login'
        method='POST' class="form-signin">
    <h3 class="h3 mb-3 font-weight-normal">Login with Username and Password</h3>
        <table>
            <tr>
                <td>User:</td>
                <td><input type='text' name='username' value='' class="form-control" placeholder="Username"></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type='password' name='password' class="form-control" placeholder="Password"/></td>
            </tr>
            <tr>
                <td colspan='2'><input name="submit" type="submit"
                    value="Login" /></td>
            </tr>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </table>
    <p class="mt-5 mb-3 text-muted">If you don't have account.Please
    <a href='<c:url value="/views/signup" />'>sign up</a> here
    </p>
    </form>

</body>
</html>