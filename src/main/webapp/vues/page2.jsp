<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<c:set var="cxt" value="${pageContext.request.contextPath}" />

<spring:url value="/files/bootstrap5" var="bt" />
<link href="${bt}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h1>Gestion des Livres </h1>
<h3>Categorie : ${c.titre}</h3>
<table border="1">
<c:forEach items="${liv}" var="lv">
<table class="table">
 <thead>
	<tr>
		<td>${lv.id}</td>
		<td>${lv.titre}</td>
		
		<sec:authorize access="hasRole('ADMIN')">
		<td><a type="button" class="btn btn-danger href="${cxt}/delete/${lv.id}">Supprimer</a></td>
		</sec:authorize>
		
		
	</tr>
 </thead>
 </table>
</c:forEach>
</body>
</html>