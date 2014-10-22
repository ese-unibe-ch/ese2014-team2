<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />


<div class="main">
<h1>${newAdProfile.title }</h1>

<img src="getUserImage/<c:out value="${mainPic}"/>">

<h1 class="newstitle">Basics:</h1>	
	<table class="profile">
		<tr>
			<td>Miete:</td>
			<td>${newAdProfile.price}</td>
		</tr>
		<tr>
			<td>Befristet:</td>
			<td>${newAdProfile.isLimited}</td>
		</tr>
		<tr>
			<td>Zimmergrösse:</td>
			<td>${newAdProfile.space}</td>
		</tr>
		<tr>
			<td>Roomies:</td>
			<td>${newAdProfile.roomies}</td>
		</tr>
	</table>
	
<div class="seperator"></div>

<h1 class="newstitle">Fotos:</h1>
<table class="profile">
	
	
					<c:forEach items="${pictureIds}" var="pics">
						<img src="getUserImage/ <c:out value="${pics}"/>" width="400" height="400" >
						
					</c:forEach>
				
	
		
	
</table>

<h1 class="newstitle">Wohnungsbeschrieb:</h1>
<p class="newstext">${newAdProfile.description_ad}</p>

<div class="seperator"></div>

<h1 class="newstitle">Zimmerbeschrieb:</h1>
<p class="newstext">${newAdProfile.description_room}</p>

<div class="seperator"></div>

<h1 class="newstitle">Über uns:</h1>
<p class="newstext">${newAdProfile.description_us}</p>

<h1 class="newstitle">Über dich:</h1>
<p class="newstext">${newAdProfile.description_you}</p>



		<a href="../">Back</a>
		<td><a href="adprofile?adId=${newAdProfile.id}">Details</a>


	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />
