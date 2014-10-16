<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />


<div class="main">
<table class="signupform">
	<tr>
		<td><h1>Sign Up Here!</h1>
			<p>Enter your information here!</p>
		<td>
	</td>
	<tr>
		<td><form:form method="post" modelAttribute="signupForm" action="create" id="signupForm" cssClass="form-horizontal"  autocomplete="off">
    			<fieldset>
        			
       
        				<c:set var="emailErrors"><form:errors path="email"/></c:set>
        					<div class="control-group<c:if test="${not empty emailErrors}"> error</c:if>">
           						 <label class="control-label" for="field-email">Email:</label>
		<td><div class="controls">
                	<form:input path="email" id="field-email" tabindex="1" maxlength="45" placeholder="Email"/>
                	<form:errors path="email" cssClass="help-inline" element="span"/>
            	</div>
	</td>
	<tr>
		<td><c:set var="firstNameErrors"><form:errors path="firstName"/></c:set>
        		<div class="control-group<c:if test="${not empty firstNameErrors}"> error</c:if>">
            		<label class="control-label" for="field-firstName">First Name:</label>
		<td><div class="controls">
                <form:input path="firstName" id="field-firstName" tabindex="2" maxlength="35" placeholder="First Name"/>
                <form:errors path="firstName" cssClass="help-inline" element="span"/>
            </div>
        </div>
	</td>
	<tr>
		<td><c:set var="lastNameErrors"><form:errors path="lastName"/></c:set>
        <div class="control-group<c:if test="${not empty lastNameErrors}"> error</c:if>">
            <label class="control-label" for="field-lastName">Last Name:</label>
		<td><div class="controls">
                <form:input path="lastName" id="field-lastName" tabindex="3" maxlength="35" placeholder="Last Name"/>
                <form:errors path="lastName" cssClass="help-inline" element="span"/>
            </div>
        </div>
	</td>
	<tr>
		<td><label class="control-label" for="field-teamList">Team:</label>
        <div class="control-group">
		<td><form:select path="teamName">
     			<c:forEach items="${teams}" var="teams">
      				<option value="${teams.teamName}">
      				 	<c:out value="${teams.teamName}" />
      				</option>
     			</c:forEach>
    		</form:select>
   		</div>
	</td>
	<tr>
		<td><div class="control-label">
   			<label class="control-label" for="field-password">Password:</label>
		<td>	<form:password path="password" id="field-password" tabindex="4" maxlength="35" placeholder="Password"/>
   		</div>
	</td>
	<tr>
		<td><div class="form-actions">
            <button type="submit" class="btnblue">Sign up</button>
            <button type="button" class="btnred">Cancel</button>
        </div>
    </fieldset>
</form:form>
		<td>
	</td>
	
</table>



</div>

            
        
        
        
            
        
        
            
        
        
    		
    		
   		
   		
   		
        
        



	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />
