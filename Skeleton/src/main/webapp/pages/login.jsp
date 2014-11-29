<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />


<h1>Login</h1>

<c:if test="${!empty param.error}">
	<p>Falscher Benutzername oder Password. Bitte versuche es erneut.</p><br />
</c:if>

<form class="col-md-6" name='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'>


	<div class="col-md-2 lineheight-textfields">
		<label for="field-username">E-mail:</label>
		<label for="field-password">Password:</label> 
	</div>
	<div class="col-md-4">
		<input name="j_username" id="field-username" type="email"/>
		<input name="j_password" id="field-password" type="password"/>
	</div>
	
	<br>
		
	<button class="btn btn-primary" type="submit" id="loginB">Login</button>
	<a href="register"><button class="btn btn-primary" type="button" id="registerB">Registrieren</button></a>
</form>
<br />

<c:import url="template/footer.jsp" />
