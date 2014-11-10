<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />



<h1>${newProfile.firstName }'s Profile</h1>

<div class="container">
	<legend>Personal Data:</legend>
	<div class="row">
		<div class="col-sm-2 col-md-4">
			<label>First Name:</label>
		</div>
		<div class="col-sm-2 col-md-4">
			<p>${user.firstName}</p>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-md-4">
			<label>Last Name:</label>
		</div>
		<div class="col-sm-2 col-md-4">
			<p>${user.lastName}</p>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-md-4">
			<label>Email:</label>
		</div>
		<div class="col-sm-2 col-md-4">
			<p>${user.email}</p>
		</div>
	</div>
	
	<legend>The Ads of the User:</legend>
	<c:forEach items="${user.advertisements }" var="ad">
		<a href="adprofile?adId=${ad.id }">${ad.title }</a>
	</c:forEach>

	<legend>Benachrichtigungsfilter:</legend>
	<a href="setInformFilter">
		<button type="submit" class="btn-sm btn-primary">Erstelle deinen Benachrichtigungsfilter!</button>
	</a>
	
	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>
    
    


<c:import url="template/footer.jsp" />