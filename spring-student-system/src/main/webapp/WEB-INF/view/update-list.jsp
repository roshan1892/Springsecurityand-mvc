<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<title>List Students</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" /> 
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>SMM- Student Management Module</h2>
		</div>
	</div>


	<div id="container">

		<div id="content">

			
			<!--  add our html table here -->

			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>

				<c:forEach var="tempStudent" items="${students}">

					<!--    construct an "update" link with customer id -->
					<c:url var="updateLink" value="/leaders/listForUpdate">
						<c:param name="studentId" value="${tempStudent.id}"></c:param>
					</c:url>
					
					<!--    construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/leaders/showFormForUpdate">
						<c:param name="studentId" value="${tempStudent.id}"></c:param>
					</c:url>
					

					<tr>
						<td>${tempStudent.firstName}</td>
						<td>${tempStudent.lastName}</td>
						<td>${tempStudent.email}</td>
						<td>
						<!--   display the update link -->
						  <a href="${updateLink}">Update</a>
						</td>
						
					</tr>

				</c:forEach>
			</table>
		</div>

	</div>

</body>
</html>