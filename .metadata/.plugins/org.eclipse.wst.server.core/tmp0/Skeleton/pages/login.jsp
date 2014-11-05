<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />


<h1>Login</h1>

<c:if test="${!empty param.error}">
	<p>Incorrect login name or password. Please retry using correct
		login name and password.</p><br />
</c:if>

<form name ='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'>
	<label for="field-username">E-mail:</label> <input name="j_username"
		id="field-username" /> <label for="field-password">Password:</label>
	<input name="j_password" id="field-password" type="password"/>
	<button type="submit">Login</button>
</form>
<br />

<c:import url="template/footer.jsp" />
