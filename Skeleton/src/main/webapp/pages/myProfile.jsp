<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />



<h1>${user.firstName }'s Profil</h1>

<div class="container">
	<legend>Persönliches:</legend>
	<div class="row">
		<div class="col-sm-2 col-md-4">
			<label>Vorname:</label>
		</div>
		<div class="col-sm-2 col-md-4">
			<p>${user.firstName}</p>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-md-4">
			<label>Nachname:</label>
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
	
	<legend>Deine Inserate:</legend>
	<c:forEach items="${user.advertisements }" var="ad">
		<a href="adprofile?adId=${ad.id }">${ad.title }</a>
		<br>
	</c:forEach>

	<legend>Benachrichtigungsfilter:</legend>
	<a href="setInformFilter">
		<c:if test="${empty user.exampleAd}">
			<button type="submit" class="btn-sm btn-primary">Erstelle deinen Benachrichtigungsfilter!</button>
		</c:if>
		<c:if test="${not empty user.exampleAd}">
			<button type="submit" class="btn-sm btn-primary">Editiere deinen Benachrichtigungsfilter!</button>
		</c:if>
	</a>
	
	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>
    
    


<c:import url="template/footer.jsp" />