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
<title>Languages</title>
</head>
<body>

	<div class="container mt-5">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Name</th>
					<th>Creator</th>
					<th>Version</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="language" items="${languages }">
					<tr>
						<td><a href="/languages/${language.id}">${language.name }</a></td>
						<td>${language.creator }
						<td>${language.version }</td>
						<td>
							<form action="/languages/delete/${language.id }" method="post">
								<input type="hidden" name="_method" value="delete" />
								<button class="btn btn-danger">Delete</button>
							</form>
							<a href="/languages/edit/${language.id }">Edit</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form:form action="/languages/create" method="post" modelAttribute="newLanguage" class="form">
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