<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<spring:url value="/files/bootstrap5" var="bt" />
<link href="${bt}/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<h1>Ajouter un livre</h1>
	<form:form method="POST" action="save" modelAttribute="lv">
		<form:input path="id" type="hidden"/>
		<p> Titre: <form:input path="titre"/></p>
		<p> Categorie <form:select path="cat.id" items="${cats}" itemLabel="titre" itemValue="id"/> </p>
		<input class="btn btn-primary  type="submit" value="Submit">
	
	</form:form>

</body>
</html>