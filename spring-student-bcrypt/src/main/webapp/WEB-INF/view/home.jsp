<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>

<head>
<title>Student Management Home Page</title>
</head>

<body>
	<h2>Student ManagementHome Page</h2>
	<hr>

	<p>Welcome to student management home page home page!</p>

	<hr>

	<!-- display user name and role -->

	<p>
		User:
		<security:authentication property="principal.username" />
		<br> <br> Role(s):
		<security:authentication property="principal.authorities" />
	</p>

	<security:authorize access="hasRole('SUBSCRIBER')">
		<!--  Add a link to poit to /leader ...this is for the subscribers-->
		<p>
			<a href="${pageContext.request.contextPath}/leaders">Update
				Student Info </a> (Only for Subscriber )

		</p>
	</security:authorize>

	<security:authorize access="hasRole('ADMIN')">
		<!--  Add a link to poit to /systems ...this is for the admins-->
		<p>
			<a href="${pageContext.request.contextPath}/systems">Perform CRUD Operation</a>
			(Only for Admin )

		</p>
	</security:authorize>


	<hr>
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">
<button class="btn btn-primary" type="submit">Logout</button>
		<!-- <input type="submit" class="btn btn-info" value="Logout" />
 -->
	</form:form>

</body>

</html>









