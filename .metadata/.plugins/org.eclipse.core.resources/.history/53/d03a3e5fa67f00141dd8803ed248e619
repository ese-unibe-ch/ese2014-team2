<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />


<div class="main">
	
		<h1>Registriere dich hier!</h1>
			<legend>Gib deine Informationen ein!</legend>
		
	<c:if test="${not empty message}">
<div class="alert alert-danger" role="alert"><font color="CC0000" size="3"> ${message}</font></div>
</c:if>	
	
		<form:form method="post" modelAttribute="signupForm" action="create" id="signupForm" cssClass="form-horizontal"  autocomplete="off">
    			<fieldset>
        			
       
   <c:set var="emailErrors"><form:errors path="email"/></c:set>
	<div class="row">        
        <label class="col-md-4" for="field-email">Email:</label>
		<div class="col-md-4">
             <form:input path="email" id="field-email" tabindex="1" maxlength="45" placeholder="Email"/>
             <form:errors path="email" cssClass="help-inline" element="span"/>
         </div>
    </div>
	
	
		<c:set var="firstNameErrors"><form:errors path="firstName"/></c:set>
            		
            		
    <div class="row">
   		<label class="col-md-4" for="field-firstName">Vorname:</label>
		<div class="col-md-4">
                <form:input path="firstName" id="field-firstName" tabindex="2" maxlength="35" placeholder="Vorname"/>
                <form:errors path="firstName" cssClass="help-inline" element="span"/>
            </div>
    </div>
	
	
		<c:set var="lastNameErrors"><form:errors path="lastName"/></c:set>

	<div class="row">
        <label class="col-md-4" for="field-lastName">Nachname:</label>
		<div class="col-md-4">
                <form:input path="lastName" id="field-lastName" tabindex="3" maxlength="35" placeholder="Nachname"/>
                <form:errors path="lastName" cssClass="help-inline" element="span"/>
            </div>
        </div>
	
		<c:set var="passwordErrors"><form:errors path="password"/></c:set>	

	<div class="row">
		<label class="col-md-4" for="field-password">Passwort:</label>
		<div class="col-md-4">
			<form:password path="password" id="field-password" tabindex="4" maxlength="35" placeholder="Passwort"/>
			<form:errors path="password" cssClass="help-inline" element="span"/>
   		</div>
</div>

<div class="row">
		<label class="col-md-4" for="field-password">Wiederhole das Passwort:</label>
		<div class="col-md-4">
			<form:password path="passwordVerify" id="field-password" tabindex="5" maxlength="35" placeholder="Passwort"/>
		</div>
</div>



<div class="form-actions">
          

            <a href="#" onclick="history.go(-2)">	<button type="button" class="btn btn-danger">Abbrechen</button></a>
             <button type="submit" id="submitB" class="btn btn-primary">Registrieren</button>
        </div>
    </fieldset>
</form:form>
		
	
	



</div>

            
        
        
        
            
        
        
            
        
        
    		
    		
   		
   		
   		
        
        



	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />

