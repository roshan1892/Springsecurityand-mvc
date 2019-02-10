<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>

<head>
<title>Student Management Module</title>
</head>

<body>
		<p>Welcome To Home Page</p>

	<hr>

	<!-- display user name and role -->

	<p>
		User:
		<security:authentication property="principal.username" />
		<br>
		<br> Role(s):
		<security:authentication property="principal.authorities" />
	</p>

	<security:authorize access="hasRole('SUBSCRIBER')">
		<!--  Add a link to poit to /leader ...this is for the subscribers-->
		<p>
			<a href="${pageContext.request.contextPath}/leaders">Update Student Info
				</a> (Only for Subscribers)

		</p>
	</security:authorize>

	<security:authorize access="hasRole('ADMIN')">
		<!--  Add a link to point to /systems ...this is for the admins-->
		<p>
			<a href="${pageContext.request.contextPath}/systems/list">Perform CRUD On Student Info</a>
			(Only for Admin)

		</p>
	</security:authorize>


	<hr>
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">

		<input type="submit" value="Logout" />

	</form:form>

</body>

</html>









