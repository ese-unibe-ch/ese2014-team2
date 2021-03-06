<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />


<h1>Login</h1>

<c:if test="${!empty param.error}">
	<p>Falscher Benutzername oder Passwort. Bitte versuche es erneut.</p><br />
</c:if>

<p> Hey, dafür musst du eingeloggt sein!</p>



<form name='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'>
	
	<div class="row">
	<div class="col-md-12">
	<div class="col-md-1 lineheight-textfields">
		<label for="field-username">E-mail:</label>
		<label for="field-password">Passwort:</label> 
	</div>
	<div class="col-md-4">
		<input name="j_username" id="field-username" type="email"/>
		<input name="j_password" id="field-password" type="password"/>
	</div>
	
	<br>
	</div>
	</div>
	<div class="row">
	<div class ="col-md-3">
		<label> Bist du bereits registriert? </label>
		<br><br>
		<label> Hast du noch keinen Account? </label>
		</div>
	<div class="col-md-1">
		<button class="btn btn-primary" type="submit" id="loginB">Login</button>
		<br>
		<br>
	<a href="register"><button class="btn btn-primary" type="button" id="registerB">Registrieren</button></a>
	</div>
	</div>
</form>
<br />




<c:import url="template/footer.jsp" />
