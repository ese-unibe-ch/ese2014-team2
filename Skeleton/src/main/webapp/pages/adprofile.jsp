<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<c:import url="template/header.jsp" />


<div class="col-md-12">

<c:if test="${not empty infoMessage}">
<div class="alert alert-success" role="alert"><font color="006600" size="3"> ${infoMessage}</font></div>
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
				<img src="img/default_image.png">
			<div class="carousel-caption"></div>
			</div>
		</c:if>

		<!-- MAIN PIC NOT EMPTY -->

		<c:if test="${not empty mainPic}">
			<div class="item active">
				<img class="img-responsive center-block" src="getUserImage/ <c:out value="${mainPic.id}"/>" >
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
			<label class="col-md-6">Kanton:</label>
			<p>${newAdProfile.kanton}</p>
		</div>

		<div class="row">
			<label class="col-md-6">Stadt:</label>
			<p>${newAdProfile.city}</p>
		</div>	

		<div class="row">
			<label class="col-md-6">Postleizahl:</label>
			<p>${newAdProfile.plz}</p>
		</div>

		<div class="row">
			<label class="col-md-6">Strasse:</label>
			<p>${newAdProfile.address}</p>
		</div>
		
		<legend>Grundlegendes:</legend>
		<div class="row">
			<label class="col-md-6">Monatliche Miete:</label>
			<p>${newAdProfile.roomPrice }</p>
		</div>
		<div class="row">
			<label class="col-md-6">Von:</label>
			<p>${newAdProfile.start}</p>
		</div>
		<div class="row">
			<label class="col-md-6">Bis:</label>
			<p>${newAdProfile.until}</p>
		</div>
		<div class="row">
			<label class="col-md-6">Zimmergrösse:</label>
			<p>${newAdProfile.roomSpace}</p>
		</div>
		
		<div class="row">
			<label class="col-md-6">Anzahl an Mitbewohnern:</label>
			<p>${newAdProfile.nmbrOfRoommates}</p>
		</div>

		<div class="row">
			<label class="col-md-6">Anzahl an Zimmern:</label>
			<p>${newAdProfile.rooms}</p>
		</div>

		<div class="row">
			<label class="col-md-6">Grundlegender WG-Typ:</label>
			<p>${newAdProfile.wgType}</p>
		</div>

		<div class="row">
			<label class="col-md-6">Ist es möbliert?</label>
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
<legend>Gut zu wissende Dinge:</legend>

	<div class="row">

		<label class="col-md-8">Hat es einen Geschirrspüler?</label>

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
		<label class="col-md-8">Hat es eine Waschmachine?</label>
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
		<label class="col-md-8">Hat es einen Balkon?</label>
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
		<label class="col-md-8">Wird im Haus geraucht?</label>
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
		<label class="col-md-8">Sind Haustiere erlaubt?</label>
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
		<label class="col-md-8">Hat es Wlan?</label>
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
			<label class="col-md-8">Hat es im Zimmer einen Einbauschrank?</label>
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
			<label class="col-md-8">Ist es möbliert?</label>
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
			<label class="col-md-8">Hat das Zimmer Balkonzugang?</label>
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
			<label class="col-md-8">Hat es Kabelanschlüsse im Zimmer?</label>
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
		<div class="row">
			<label class="col-md-8">Geschlechterverteilung in der WG</label>

			<p>${newAdProfile.wgGender}</p>
		</div>


	</div>

		<div class="col-md-8">
			<legend>Über Uns:</legend>
			<p>${newAdProfile.description_us}</p>
		</div>
		
		<div class="col-md-8">
			<legend>Über Dich:</legend>
			<p>${newAdProfile.whoWeAreLookingFor}</p>
		</div>
		
		<div class="col-md-4">
<div class="row">
	<label class="col-md-8">Du bist:</label>
	<p>${newAdProfile.smoker}</p>
</div>

<div class="row">
	<label class="col-md-8">Du bist:</label>
	<p>${newAdProfile.genderWeLookFor}</p>
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
