<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />


<table class="signupForm">
	<tr>
		<td><h1>Login</h1>
	</td>
	
	<tr>
		<td><form:form method="post" modelAttribute="newLoginForm" action="login" id="loginForm" cssClass="form-horizontal" autocomplete="off">
			<fieldset>
				<label class="control-label" for="field-email">Email:</label>
		<td><div class="controls">
			<form:input path="email" id="field-email" tabindex="1" placeholder="Email"/>
			</div>
	</td>
	
	<tr>
		<td>
			<label class="control-label" for="field-password">Password:</label>
		<td>
			<div class="controls">
				<form:input type="password" path="password" id="field-password" tabindex="2" placeholder="Password"/>
			</div>
		
		</td>
		
	<tr>
		<td><div class="form-actions">
            <button type="submit" class="btnblue">Sign up</button>
            <button type="button" class="btnred">Cancel</button>
        </div>
    </fieldset>
</form:form>
				
		</table>	
		
	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />
