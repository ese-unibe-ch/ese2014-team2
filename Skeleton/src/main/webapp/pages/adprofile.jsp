<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<c:import url="template/header.jsp" />


<div class="main">

<legend>Bilder:</legend>

<div class="slider_wrapper">
					<ul id="image_slider">
						<li>
							<img src="getUserImage/ <c:out value="${mainPic.id}"/>" width="400" height="400" >
						</li>
						<c:forEach items="${pictures}" var="pics">
							<li>
								<img src="getUserImage/ <c:out value="${pics.id}"/>" width="400" height="400" >
							</li>
						</c:forEach>
					</ul>
					<span class="nvgt" id="prev"></span>
					<span class="nvgt" id="next"></span>	
				</div>
				<ul id="pager">
				</ul>




<legend>Grundlegendes:</legend>	

	<div class="row">
		<label class="col-md-4">Monatliche Miete:</label>
		<p>${newAdProfile.roomPrice }</p>
	</div>
	
	<div class="row">
		<label class="col-md-4">Von:</label>
		<p>${newAdProfile.start}</p>
	</div>
	
	<div class="row">
		<label class="col-md-4">Bis:</label>
		<p>${newAdProfile.until}</p>
	</div>
	
	<div class="row">
		<label class="col-md-4">Zimmergrösse:</label>
		<p>${newAdProfile.roomSpace}</p>
	</div>
	
	<div class="row">
		<label class="col-md-4">Anzahl an Mitbewohnern:</label>
		<p>${newAdProfile.nmbrOfRoommates}</p>
	</div>
	
	<div class="row">
		<label class="col-md-4">Grundlegender WG-Typ:</label>
		<p>${newAdProfile.wgType}</p>
	</div>
	
	<div class="row">
		<label class="col-md-4">Ist es möbliert?</label>
		<p>
			<c:choose>
					<c:when test="${newAdProfile.furnished}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>	
		</p>
	</div>

<div class="seperator"></div>


<legend>Gut zu wissende Dinge:</legend>

	<div class="row">
		<label class="col-md-4">Hat es einen Geschirrspüler?</label>
		<p>
			<c:choose>
					<c:when test="${newAdProfile.hasDishwasher}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
		</p>
	</div>
	
	<div class="row">
		<label class="col-md-4">Hat es eine Waschmachine?</label>
		<p>
			<c:choose>
					<c:when test="${newAdProfile.hasLaundry}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
		</p>
	</div>
	<div class="row">
		<label class="col-md-4">Hat es einen Balkon?</label>
		<p>
			<c:choose>
					<c:when test="${newAdProfile.hasBalcony}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
		</p>
	</div>
	<div class="row">
		<label class="col-md-4">Wird im Haus geraucht?</label>
		<p>
			<c:choose>
					<c:when test="${newAdProfile.smokingInside}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
		</p>
	</div>
	<div class="row">
		<label class="col-md-4">Sind Haustiere erlaubt?</label>
		<p>
			<c:choose>
					<c:when test="${newAdProfile.hasPets}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
		</p>
	</div>
	<div class="row">
		<label class="col-md-4">Hat es Wlan?</label>
		<p>
			<c:choose>
					<c:when test="${newAdProfile.wlan}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
		</p>
	</div>
	<div class="row">
		<label class="col-md-4">Hat es im Zimmer einen Einbauschrank?</label>
		<p>
			<c:choose>
					<c:when test="${newAdProfile.hasBuiltInCloset}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
		</p>
	</div>
	<div class="row">
		<label class="col-md-4">Hat das Zimmer Balkonzugang?</label>
		<p>
			<c:choose>
					<c:when test="${newAdProfile.hasBalcony}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
		</p>
	</div>
	<div class="row">
		<label class="col-md-4">Hat es Kabelanschlüsse im Zimmer?</label>
		<p>
			<c:choose>
					<c:when test="${newAdProfile.hasCables}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
		</p>
	</div>
	<div class="row">
		<label class="col-md-4">Geschlechterverteilung in der WG</label>
		<p>	
			<c:choose>
					<c:when test="${newAdProfile.wgGender}">
						<c:out value="Ja"/>
					</c:when>
					<c:otherwise>
						<c:out value="Nein"/>
					</c:otherwise>
				</c:choose>
		</p>
	</div>
	
	
	
	<legend>Über die Wohnung:</legend>
	<p>${newAdProfile.description_ad}</p>
	
	<legend>Über das Zimmer:</legend>
	<p>${newAdProfile.description_room}</p>
	
	<legend>Über Uns:</legend>
	<p>${newAdProfile.description_us}</p>
	
	<legend>Über Dich:</legend>
	<p>${newAdProfile.whoWeAreLookingFor}</p>
	
	<div class="row">
		<label class="col-md-4">Du bist:</label>
		<p>
			${newAdProfile.smoker}
		</p>
	</div>
	
	<div class="row">
		<label class="col-md-4">Du bist:</label>
		<p>
			${newAdProfile.genderWeLookFor}
		</p>
	</div>
	
	<div class="row">
		<label class="col-md-4">Du bist im alter von:</label>
		<p>
			${newAdProfile.ageRange}
		</p>
	</div>
	

		<a href="/Skeleton/ads"><button class="btn btn-danger">Back</button></a>
		<a href="sendMessageFromAd?adId=${newAdProfile.id}"> 
	<button type="button" class="btn btn-default" id="messageSend"><b>Stelle eine private Frage an den Inseratsteller</b></button>
</a>

<a href="userInterested?adId=${newAdProfile.id}"> 
	<button type="button" class="btn btn-default"><b>Ich hätte interesse an einer Besichtigung</b></button>
</a>


	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>

</div>
<c:import url="template/footer.jsp" />
