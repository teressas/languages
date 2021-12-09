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
		<form action="/languages/delete/${language.id}" method="post">
			<input type="hidden" name="_method" value="delete" />
			<button class="btn btn-danger"> Delete</button>
		</form>
		<a href="/languages">Dashboard</a>
		<form:form action="/languages/edit/${language.id }" method="post" modelAttribute="language" class="form">
			<input type="hidden" name="_method" value="put" />
				<p>
					<form:label path="name" class="form-label">Language</form:label>
					<form:errors path="name" class="text-danger"/>
					<form:input path="name" type="text" class="form-control"/>
				</p>
				<p>
					<form:label path="creator" class="form-label">Creator</form:label>
					<form:errors path="creator" class="text-danger" />
					<form:input path="creator" class="form-control"/>
				</p>
				<p>
					<form:label path="version" class="form-label">Version</form:label>
					<form:errors path="version" class="text-danger"/>
					<form:input path="version" type="double" class="form-control"/>
				</p>
				<button class="btn btn-primary">Submit</button>
		</form:form>
	</div>

</body>
</html>