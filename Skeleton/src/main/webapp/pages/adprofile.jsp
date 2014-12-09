<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<c:import url="template/header.jsp" />

<script>
function winOpen()
{
    window.open("https://www.google.ch/maps/place/${mapsStreet},+${newAdProfile.plz}+${newAdProfile.city}");
}
</script>


<div class="col-md-12">

<c:if test="${not empty successMessage}">
	<div class="alert alert-success" role="alert"><font color="006600" size="3"> ${successMessage}</font></div>
</c:if>

<c:if test="${not empty dangerMessage}">
	<div class="alert alert-danger" role="alert"><font color="CC0000" size="3"> ${dangerMessage}</font></div>
</c:if>	

<!--  CAROUSEL SLIDER TEST  -->

<div id="carousel-example-generic" class="carousel slide"
	data-ride="carousel" data-interval="false"  >
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carousel-example-generic" data-slide-to="0"
			class="active"></li>
		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		<li data-target="#carousel-example-generic" data-slide-to="3"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">

		<!--  MAIN PIC EMPTY -->
		<c:if test="${empty mainPic}">
			<div class="item active">

				<img class="img-responsive center-block" src="img/default_image.png">
				<div class="carousel-caption"></div>

			</div>
		</c:if>

		<!-- MAIN PIC NOT EMPTY -->

		<c:if test="${not empty mainPic}">
			<div class="item active">
				<img class="img-responsive center-block" src="getUserImage/ <c:out value="${mainPic.id}"/>" style="width:640px;height:600px" >
				<div class="carousel-caption"></div>

			</div>
		</c:if>


		<!-- REST OF PICS LOOP -->

		<c:forEach items="${pictures}" var="pics">
			<div class="item">

			<!-- <div class="inner-item"> -->
				<img  class="img-responsive center-block" src="getUserImage/ <c:out value="${pics.id}"/>" style="width:640px;height:600px">
				<div class="carousel-caption"></div>
				</div>
			<!-- </div> -->
		</c:forEach>

	</div>

	<!-- Controls -->
	<a class="left carousel-control" href="#carousel-example-generic"
		role="button" data-slide="prev"> <span
		class="glyphicon glyphicon-chevron-left"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#carousel-example-generic"
		role="button" data-slide="next"> <span
		class="glyphicon glyphicon-chevron-right"></span> <span
		class="sr-only">Next</span>
	</a>
</div>

<!-- /.carousel -->

<script src="http://codeorigin.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script>
	$('#myCarousel').carousel({
		slideshow : false
	});
</script>

	<div class="col-md-5">
		<legend>Addresse:</legend>
		
		<div class="row">
			<label class="col-md-6">Strasse und Hausnummer:</label>
			<p>${newAdProfile.address}</p>
		</div>
		
		
		<div class="row">
			<label class="col-md-6">Postleizahl:</label>
			<p>${newAdProfile.plz}</p>
		</div>
		
		<div class="row">
			<label class="col-md-6">Stadt:</label>
			<p>${newAdProfile.city}</p>
		</div>	
		
		
		<div class="row">
			<label class="col-md-6">Kanton:</label>
			<p>${newAdProfile.kanton}</p>
		</div>
		
		<div class="row">
		
		
		
		<!-- <div id='map-canvas' ></div><br/> -->
	
	
	
	
		<button onclick="winOpen()">Zeige auf google Maps</button>
		
			
		</div>
		

		
		
		<legend>Alllgemeines:</legend>
		<div class="row">
			<label class="col-md-6">Monatliche Miete:</label>
			<p>${newAdProfile.roomPrice }</p>
		</div>
		<div class="row">
			<label class="col-md-6">Zimmer frei von:</label>
			<p>${newAdProfile.start}</p>
		</div>
		<div class="row">
			<label class="col-md-6">Zimmer frei bis:</label>
			<p>${newAdProfile.until}</p>
		</div>
		<div class="row">
			<label class="col-md-6">Zimmergrösse:</label>
			<p>${newAdProfile.roomSpace} m²</p>
		</div>
		
		<div class="row">
			<label class="col-md-6">Anzahl an Mitbewohnern:</label>
			<c:choose>
			<c:when test="${newAdProfile.wgGender eq 'male'}">
				<p>${newAdProfile.nmbrOfRoommates}, alle Männlich</p>
			</c:when>
			<c:when test="${newAdProfile.wgGender eq 'female' }">
				<p>${newAdProfile.nmbrOfRoommates}, alle Weiblich</p>
			</c:when>
			<c:otherwise>
				<p>${newAdProfile.nmbrOfRoommates}, Männer/ Frauen gemischt</p>
			</c:otherwise>
		</c:choose>
		
		
		
		
		</div>

		<div class="row">
			<label class="col-md-6">Anzahl an Zimmern in der Wohnung/Haus:</label>
			<p>${newAdProfile.rooms}</p>
		</div>

		<div class="row">
			<label class="col-md-6">Wir sind eine </label>
			<c:choose>
			<c:when test="${newAdProfile.wgType eq 'calm'}">
				<c:out value="ruhige WG" />
			</c:when>
			<c:when test="${newAdProfile.wgType eq 'wild' }">
				<c:out value="lebhafte WG"/>
			</c:when>
			<c:otherwise>
				<c:out value="weder ruhige noch wilde WG" />
			</c:otherwise>
		</c:choose>
		</div>

		<div class="row">
			<label class="col-md-6">Möbliert:</label>
			<p>
				<c:choose>
					<c:when test="${newAdProfile.furnished}">
						<c:out value="Ja" />
					</c:when>
					<c:otherwise>
						<c:out value="Nein" />
					</c:otherwise>
				</c:choose>
			</p>
		</div>
		
		<div class="row">
			<label class="col-md-6">Öffentlicher Besichtigungstermin, ohne Anmeldung: </label>
			<p>${newAdProfile.publicVisit}</p>
		</div>	
		
		
<a href="userInterested?adId=${newAdProfile.id}">
	<button type="button" class="btn btn-primary">
		<b>Ich hätte interesse an einer Besichtigung</b>
	</button>
</a>

<c:choose>
	<c:when test="${bookmarked}">
		<a href="unBookmarkAd?adId=${newAdProfile.id}">
		<button type="button" class="btn btn-warning">
			<b>Aus Favoriten entfernen</b>
		</button>
	</a>
	</c:when>
	<c:otherwise>
		<a href="bookmarkAd?adId=${newAdProfile.id}">
		<button type="button" class="btn btn-success">
			<b>Hinzufügen zu Favoriten</b>
		</button>
	</a>
	</c:otherwise>
</c:choose>
		
		
	</div>
	</div>

		<div class="col-md-8">
			<legend>Über die Wohnung:</legend>
			<p>${newAdProfile.description_ad}</p>
		</div>
		
		
	
			
			
<div class="row col-md-4">
<legend>Weitere Infos zur Wohnung:</legend>

	<div class="row">

		<label class="col-md-8">Geschirrspüler:</label>

		<c:choose>
			<c:when test="${newAdProfile.hasDishwasher}">
				<c:out value="Ja" />
			</c:when>
			<c:otherwise>

				<c:out value="Nein" />

			</c:otherwise>
		</c:choose>
	</div>




	<div class="row">
		<label class="col-md-8">Waschmachine:</label>
		<p>
			<c:choose>
				<c:when test="${newAdProfile.hasLaundry}">
					<c:out value="Ja" />
				</c:when>
				<c:otherwise>
					<c:out value="Nein" />
				</c:otherwise>
			</c:choose>
		</p>
	</div>

	<div class="row">
		<label class="col-md-8">Balkon:</label>
		<p>
			<c:choose>
				<c:when test="${newAdProfile.hasBalcony}">
					<c:out value="Ja" />
				</c:when>
				<c:otherwise>
					<c:out value="Nein" />
				</c:otherwise>
			</c:choose>
		</p>
	</div>


	<div class="row">
		<label class="col-md-8">Raucherwohnung:</label>
		<p>
			<c:choose>
				<c:when test="${newAdProfile.smokingInside}">
					<c:out value="Ja" />
				</c:when>
				<c:otherwise>
					<c:out value="Nein" />
				</c:otherwise>
			</c:choose>
		</p>
	</div>
	<div class="row">
		<label class="col-md-8">Haustiere möglich:</label>
		<p>
			<c:choose>
				<c:when test="${newAdProfile.hasPets}">
					<c:out value="Ja" />
				</c:when>
				<c:otherwise>
					<c:out value="Nein" />
				</c:otherwise>
			</c:choose>
		</p>
	</div>

	<div class="row">
		<label class="col-md-8">Wlan:</label>
		<p>
			<c:choose>
				<c:when test="${newAdProfile.wlan}">
					<c:out value="Ja" />
				</c:when>
				<c:otherwise>
					<c:out value="Nein" />
				</c:otherwise>
			</c:choose>
		</p>
	</div>
</div>
	
	<div class="col-md-8">
			<legend>Über das Zimmer:</legend>
			<p>${newAdProfile.description_room}</p>
	</div> 

<div class="row col-md-4">
<legend>Zum Zimmer:</legend>
		<div class="row">
			<label class="col-md-8">Einbauschrank:</label>
			<p>
				<c:choose>
					<c:when test="${newAdProfile.hasBuiltInCloset}">
						<c:out value="Ja" />
					</c:when>
					<c:otherwise>
						<c:out value="Nein" />
					</c:otherwise>
				</c:choose>
			</p>
		</div>

		
		<div class="row">
			<label class="col-md-8">Balkonzugang vom Zimmer:</label>
			<p>
				<c:choose>
					<c:when test="${newAdProfile.hasBalcony}">
						<c:out value="Ja" />
					</c:when>
					<c:otherwise>
						<c:out value="Nein" />
					</c:otherwise>
				</c:choose>
			</p>
		</div>

		<div class="row">
			<label class="col-md-8">Kabelanschlüsse im Zimmer: (Tv, Internet etc.)</label>
			<p>
				<c:choose>
					<c:when test="${newAdProfile.hasCables}">
						<c:out value="Ja" />
					</c:when>
					<c:otherwise>
						<c:out value="Nein" />
					</c:otherwise>
				</c:choose>
			</p>
		</div>
		


	</div>

		<div class="col-md-8">
			<legend>Über deine zukünftigen Mitbewohner:</legend>
			<p>${newAdProfile.description_us}</p>
		</div>
		
		<div class="col-md-8">
			<legend>Über Dich:</legend>
			<p>${newAdProfile.whoWeAreLookingFor}</p>
		</div>
		
		<div class="col-md-4">
<div class="row">
	<label class="col-md-8">Raucher:</label>
				<c:choose>
					<c:when test="${newAdProfile.smoker eq 'smoker'}">
						<c:out value="Raucher" />
					</c:when>
					<c:when test="${newAdProfile.smoker eq 'nonsmoker' }">
						<c:out value="Nichtraucher"/>
					</c:when>
					<c:otherwise>
						<c:out value="Egal" />
					</c:otherwise>
				</c:choose>

</div>

<div class="row">
	<label class="col-md-8">Wir bevorzugen:</label>
	<c:choose>
					<c:when test="${newAdProfile.genderWeLookFor eq 'male'}">
						<c:out value="Einen Mann" />
					</c:when>
					<c:when test="${newAdProfile.genderWeLookFor eq 'female' }">
						<c:out value="Eine Frau"/>
					</c:when>
					<c:otherwise>
						<c:out value="Egal welches Geschlecht" />
					</c:otherwise>
				</c:choose>
	

</div>

<div class="row">
	<label class="col-md-8">Du bist im alter von:</label>
	<p>${newAdProfile.ageRange}</p>
</div>

</div>
</div>

<div class="container">
	<div class="form-actions">
		<a href="/Skeleton/ads"><button class="btn btn-danger">Zurück</button></a>
		<a href="sendMessageFromAd?adId=${newAdProfile.id}">
			<button type="button" class="btn btn-default" id="messageSend">
				<b>Stelle eine private Frage an den Inseratsteller</b>
			</button>
		</a>
	</div>

</div>











<c:if test="${page_error != null }">
	<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<h4>Error!</h4>
		${page_error}
	</div>
</c:if>






<c:import url="template/footer.jsp" />
