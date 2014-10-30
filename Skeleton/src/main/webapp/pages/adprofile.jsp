<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<c:import url="template/header.jsp" />


<div class="main">
<h1 class="h1_inline">${newAdProfile.title }</h1>

<img src="getUserImage/<c:out value="${mainPic}"/>" width="400px" height="400px">

<h1 class="h1_inline">Grundlegendes:</h1>	
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
			<td>
				<c:choose>
					<c:when test="${newAdProfile.furnished}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	
<div class="seperator"></div>

<h1 class="newstitle">Fotos:</h1>
<table class="profile">
				<div class="slider_wrapper">
					<ul id="image_slider">
						<c:forEach items="${pictureIds}" var="pics">
							<li>
								<img src="getUserImage/ <c:out value="${pics}"/>" width="400" height="400" >
							</li>
						</c:forEach>
					</ul>
					<span class="nvgt" id="prev"></span>
					<span class="nvgt" id="next"></span>	
				</div>
				<ul id="pager">
				</ul>
				
	
		
	
</table>

<h1 class="h1_inline">Gut zu wissende Dinge:</h1>
<table class="profile">
		<tr>
			<td>Hat es einen Geschirrspüler? </td>
			<td><c:choose>
					<c:when test="${newAdProfile.hasDishwasher}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose></td>
		</tr>
		<tr>
			<td>Hat es eine Waschmachine?</td>
			<td><c:choose>
					<c:when test="${newAdProfile.hasLaundry}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>Hat es einen Balkon?</td>
			<td><c:choose>
					<c:when test="${newAdProfile.hasBalcony}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
				</td>
		</tr>
		<tr>
			<td>Wird im Haus geraucht?</td>
			<td><c:choose>
					<c:when test="${newAdProfile.smokingInside}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
				</td>
		</tr>
		<tr>
			<td>Sind Haustiere erlaubt?</td>
			<td><c:choose>
					<c:when test="${newAdProfile.hasPets}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
				</td>
		</tr>
		<tr>
			<td>Hat es Wlan?</td>
			<td>
			<c:choose>
					<c:when test="${newAdProfile.wlan}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
				</td>
		</tr>
		<tr>
			<td>Hat es im Zimmer einen Einbauschrank?</td>
			<td><c:choose>
					<c:when test="${newAdProfile.hasBuiltInCloset}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
				</td>
		</tr>
		<tr>
			<td>Hat das Zimmer Balkonzugang?</td>
			<td><c:choose>
					<c:when test="${newAdProfile.hasBalcony}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
				</td>
		</tr>
		<tr>
			<td>Hat es Kabelanschlüsse im Zimmer?</td>
			<td><c:choose>
					<c:when test="${newAdProfile.hasCables}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
				</td>
		</tr>
		<tr>
			<td>Geschlechterverteilung in der WG</td>
			<td><c:choose>
					<c:when test="${newAdProfile.wgGender}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
				</td>
		</tr>
	</table>

<h1>Wohnungsbeschrieb:</h1>
<p>${newAdProfile.description_ad}</p>

<div class="seperator"></div>

<h1>Zimmerbeschrieb:</h1>
<p>${newAdProfile.description_room}</p>

<div class="seperator"></div>

<h1>Über uns:</h1>
<p>${newAdProfile.description_us}</p>

<h1>Über dich:</h1>
<p>${newAdProfile.whoWeAreLookingFor}</p>
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
		<td><a href="sendMessageFromAd?adId=${newAdProfile.id}">Send Message to ad Owner</a>


	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />
