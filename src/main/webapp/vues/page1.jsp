<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<spring:url value="/files/bootstrap5" var="bt" />
<link href="${bt}/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<h1>Gestion des Livres </h1>

	<sec:authorize access="isAuthenticated()">
Bienvenue <sec:authentication property="name"/>
(<a href=

"<c:url value="/logout" />">Logout</a>)

</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
	<button type="button" class="btn btn-secondary"><a href="addLivre">Ajouter un livre</a></button>
	</sec:authorize>
		
<table border="1">
<c:forEach items="${cats}" var="c">
	<tr>
		<td>${c.id}</td>
		<td>${c.titre}</td>
		<td> <a href="livres/${c.id}">liste des livres</a> </td>
	</tr>
</c:forEach>
</body>
</html>