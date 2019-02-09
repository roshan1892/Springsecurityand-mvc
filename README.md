# Springsecurityand-mvc
It's a simple CRUD app related project based on student details.After being logged in,Admin and Subscriber will be redirected to their
respective home page.
Subscriber can only update the student info while admin can perform a CRUD operation.If,Subscriber tries to perform CRUD operation,he/she 
will be redirected to access denied page.
In the first project,i stored the student user details and authorities in the database where the password is encrypted using spring security's 
recommended algorith bcrypt algorithm.While in the other,i stored user details and authorities in memory(hence i didn't use bcrypt algorithm
for this case).
Used Technologies: Spring Security,Spring MVC,Hibernate,MySQL,JSP
