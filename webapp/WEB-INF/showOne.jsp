<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>${languages.name }</title>
</head>
<body>
	<div class="container mt-5">
		<a href="/languages">Dashboard</a>
		<p>${languages.name }</p>
		<p>${languages.creator }</p>
		<p>${languages.version }</p>
		
		<a href="/languages/edit/${languages.id }">Edit</a>

		<form action="/languages/delete/${languages.id }" method="post">
			<input type="hidden" name="_method" value="delete" />
			<button class="btn btn-danger">Delete</button>
		</form>

	</div>

</body>
</html>