<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Se Connecter ESSAT 2023</h1>

<c:if test="${ not empty errmsg }">
		<p> ${errmsg} </p>
</c:if>

<form method="POST" action="login">
	<p>Username : <input type="text" name="username"></p>
	<p>Password : <input type="password" name="password"></p>
	<p><input name="submit" type="submit" value="submit" /></p>
</form>


</body>
</html>