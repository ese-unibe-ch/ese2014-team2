<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />


<div class="main">
<h1>${newAdProfile.title }</h1>

<img src="getUserImage/<c:out value="${mainPic}"/>">

<h1 class="newstitle">Grundlegendes:</h1>	
	<table class="profile">
		<tr>
			<td>Miete:</td>
			<td>${newAdProfile.roomPrice}</td>
		</tr>
		<tr>
			<td>Von</td>
			<td>${newAdProfile.start}</td>
		</tr>
		<tr>
			<td>Bis</td>
			<td>${newAdProfile.until}</td>
		</tr>
		<tr>
			<td>Zimmergrösse:</td>
			<td>${newAdProfile.roomSpace}</td>
		</tr>
		<tr>
			<td>Anzahl an Mitbewohnern:</td>
			<td>${newAdProfile.nmbrOfRoommates}</td>
		</tr>
		<tr>
			<td>Grundlegender Wgtyp</td>
			<td>${newAdProfile.wgType}</td>
		</tr>
		<tr>
			<td>Ist es möbliert?</td>
			<td>${newAdProfile.furnished}</td>
		</tr>
	</table>
	
<div class="seperator"></div>

<h1 class="newstitle">Fotos:</h1>
<table class="profile">
	
	
					<c:forEach items="${pictureIds}" var="pics">
						<img src="getUserImage/ <c:out value="${pics}"/>" width="400" height="400" >
						
					</c:forEach>
				
	
		
	
</table>

<h1 class="newstitle">Gut zu wissende Dinge:</h1>
<table class="profile">
		<tr>
			<td>Hat es einen Geschirrspüler? </td>
			<td>${newAdProfile.hasDishwasher}</td>
		</tr>
		<tr>
			<td>Hat es eine Waschmachine?</td>
			<td>${newAdProfile.hasLaundry}</td>
		</tr>
		<tr>
			<td>Hat es einen Balkon?</td>
			<td>${newAdProfile.hasBalcony}</td>
		</tr>
		<tr>
			<td>Wird im Haus geraucht?</td>
			<td>${newAdProfile.smokingInside}</td>
		</tr>
		<tr>
			<td>Sind Haustiere erlaubt?</td>
			<td>${newAdProfile.hasPets}</td>
		</tr>
		<tr>
			<td>Hat es Wlan?</td>
			<td>${newAdProfile.wlan}</td>
		</tr>
		<tr>
			<td>Hat es im Zimmer einen Einbauschrank?</td>
			<td>${newAdProfile.hasBuiltInCloset}</td>
		</tr>
		<tr>
			<td>Hat das Zimmer Balkonzugang?</td>
			<td>${newAdProfile.hasBalcony}</td>
		</tr>
		<tr>
			<td>Hat es Kabelanschlüsse im Zimmer?</td>
			<td>${newAdProfile.hasCables}</td>
		</tr>
		<tr>
			<td>Geschlechterverteilung in der WG</td>
			<td>${newAdProfile.wgGender}</td>
		</tr>
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
<p class="newstext">${newAdProfile.whoWeAreLookingFor}</p>
<table class="profile">
<tr>
			<td>Du bist:</td>
			<td>${newAdProfile.smoker}</td>
		</tr>
		<tr>
			<td>Du bist:</td>
			<td>${newAdProfile.genderWeLookFor}</td>
		</tr>
		<tr>
			<td>Du bist im alter von</td>
			<td>${newAdProfile.ageRange}</td>
		</tr>
</table>



		<a href="/Skeleton/ads">Back</a>
		<td><a href="adprofile?adId=${newAdProfile.id}">Details</a>


	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />
