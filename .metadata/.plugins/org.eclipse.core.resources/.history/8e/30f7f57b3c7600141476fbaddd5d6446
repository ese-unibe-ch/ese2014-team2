<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<meta charset="UTF-8">


<c:import url="template/header.jsp" />


<h1>Bearbeite dein AD!</h1>


<c:if test="${not empty infoMessage}">
<div class="alert alert-success" role="alert"><font color="006600" size="3"> ${infoMessage}</font></div>
</c:if>

<form:form method="post" modelAttribute="adForm"
	action="submitEditAd?adId=${ad.id }" id="adForm"
	cssClass="form-horizontal" autocomplete="off"
	enctype="multipart/form-data" accept-charset="utf-8">
	<fieldset>
		<legend>Grundlegende Infos:</legend>

		<c:set var="roomPriceErrors">
			<form:errors path="roomPrice" />
		</c:set>
		<div class="row">
			<label class="col-md-4" for="field-price">Preis des Zimmers:
			</label>
			<div class="col-md-4">
				<form:input path="roomPrice" id="field-price" tabindex="1"
					maxlength="10" value="${ad.roomPrice}" />
				<form:errors path="roomPrice" cssClass="help-inline" element="span" />
			</div>
		</div>

		<c:set var="startErrors">
			<form:errors path="start" />
		</c:set>
		<div class="row">
			<label class="col-md-4" for="field-von">Ab wann ist das
				Zimmer frei: </label>
			<div class="col-md-4">
				<form:input path="start" type="field-von" id="datepicker"
					tabindex="2" value="${ad.start}" />
				<form:errors path="start" cssClass="help-inline" element="span" />
			</div>
		</div>

		<c:set var="untilErrors">
			<form:errors path="until" />
		</c:set>
		<div class="row">
			<label class="col-md-4" for="field-bis">Bis wann ist das
				Zimmer frei: </label>
			<div class="col-md-4">
				<form:input path="until" type="field-bis" id="datepicker2"
					tabindex="3" value="${ad.until}" />
				<form:errors path="until" cssClass="help-inline" element="span" />
			</div>
		</div>

		<c:set var="roomsErrors">
			<form:errors path="rooms" />
		</c:set>
		<div class="row">
			<label class="col-md-4" for="field-rooms">Anzahl an Zimmer: </label>
			<div class="col-md-4">
				<form:input path="rooms" id="field-rooms" tabindex="4"
					maxlength="10" value="${ad.rooms}" />
				<form:errors path="rooms" cssClass="help-inline" element="span" />
			</div>
		</div>

		<c:set var="roomSpaceErrors">
			<form:errors path="roomSpace" />
		</c:set>
		<div class="row">
			<label class="col-md-4" for="field-roomSpace">Grösse des
				Zimmers:</label>
			<div class="col-md-4">
				<form:input path="roomSpace" id="field-roomSpace" tabindex="5"
					maxlength="10" value="${ad.roomSpace}" />
				<form:errors path="roomSpace" cssClass="help-inline" element="span" />
			</div>
		</div>

		<c:set var="nmbrOfRoommatesErrors">
			<form:errors path="nmbrOfRoommates" />
		</c:set>
		<div class="row">
			<label class="col-md-4" for="field-adNmbrOfRoommates">Wie
				viele Mitbewohner (Exkl. der gesuchten Person)</label>
			<div class="col-md-4">
				<form:select path="nmbrOfRoommates" id="field-adNmbrOfRoommates"
					tabindex="6">
					<option value="${ad.nmbrOfRoommates}">${ad.nmbrOfRoommates}</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</form:select>
				<form:errors path="nmbrOfRoommates" cssClass="help-inline"
					element="span" />
			</div>
		</div>

		<c:set var="wgTypeErrors">
			<form:errors path="wgType" />
		</c:set>
		<div class="row">
			<label class="col-md-4" for="field-wgType">Ungefährer WG-Typ</label>
			<div class="col-md-4">
				<form:select path="wgType" id="field-wgType" tabindex="7">
					<option value="${ad.wgType}">${ad.wgType}</option>
					<option value="undef">undefiniert</option>
					<option value="calm">eher ruhig</option>
					<option value="wild">eher wild</option>
				</form:select>
				<form:errors path="wgType" cssClass="help-inline" element="span" />
			</div>
		</div>

		<c:set var="furnishedErrors">
			<form:errors path="furnished" />
		</c:set>
		<div class="row">
			<label class="col-md-4" for="field-furnished">Möbliert:</label>
			<div class="col-md-4">
			
					<c:choose>
						<c:when test="${ad.furnished eq true}">
    						<form:checkbox path="furnished" id="field-furnished" tabindex="8" checked="checked"/>
						</c:when>

						<c:otherwise>
     						<form:checkbox path="furnished" id="field-furnished" tabindex="8" />
						</c:otherwise>
					</c:choose>

					

					<form:errors path="furnished" cssClass="help-inline" element="span" />
			</div>
		</div>



		<div class="seperator"></div>


		<legend>Adresse der WG:</legend>

		<c:set var="kantonErrors">
			<form:errors path="kanton" />
		</c:set>
		<div class="row">
			<label class="col-md-4" for="field-adKanton">Kanton:</label>
			<div class="col-md-4">
				<form:input path="kanton" id="field-adKanton" tabindex="9"
					maxlength="10" placeholder="Kanton" value="${ad.kanton}" />
				<form:errors path="kanton" cssClass="help-inline" element="span" />
			</div>
		</div>

		<c:set var="plzErrors">
			<form:errors path="plz" />
		</c:set>
		<div class="row">
			<label class="col-md-4" for="field-adPlz">Postleitzahl:</label>
			<div class="col-md-4">
				<form:input path="plz" id="field-adPlz" tabindex="10" maxlength="4"
					placeholder="PLZ" value="${ad.plz}" />
				<form:errors path="plz" cssClass="help-inline" element="span" />
			</div>
		</div>

		<c:set var="cityErrors">
			<form:errors path="city" />
		</c:set>
		<div class="row">
			<label class="col-md-4" for="field-city">Ort:</label>
			<div class="col-md-4">
				<form:input path="city" id="field-city" tabindex="11" maxlength="20"
					placeholder="City" value="${ad.city}" />
				<form:errors path="city" cssClass="help-inline" element="span" />
			</div>
		</div>

		<c:set var="addressErrors">
			<form:errors path="address" />
		</c:set>
		<div class="row">
			<label class="col-md-4" for="field-adAddress">Strasse mit
				Hausnummer</label>
			<div class="col-md-4">
				<form:input path="address" id="field-adAddress" tabindex="12"
					maxlength="30" value="${ad.address}" />
				<form:errors path="address" cssClass="help-inline" element="span" />
			</div>
		</div>


		<div class="seperator"></div>





		<div class="seperator"></div>


		<legend>Zur Wohnung:</legend>

		<div class="row">
			<label class="col-md-4">Wohnungsbeschreibung:</label>
		</div>
		<div class="row">
			<div class="textareabig">
				<form:textarea path="description_ad" tabindex="13"
					value="${ad.description_ad}" />
			</div>
		</div>

		<div class="row">
			<label class="col-md-4" for="field-adLaundry">Waschmaschine:</label>
			<div class="col-md-4">
			<c:choose>
						<c:when test="${ad.hasLaundry eq true}">
    							<form:checkbox path="hasLaundry" id="field-adLaundry" tabindex="14"
					checked="checked" />
						</c:when>

						<c:otherwise>
     						<form:checkbox path="hasLaundry" id="field-adLaundry" tabindex="14" />
						</c:otherwise>
					</c:choose>
			
			
			</div>
		</div>

		<div class="row">
			<label class="col-md-4" for="field-adDishwasher">Geschirrspüler:</label>
			<div class="col-md-4">
			
			<c:choose>
			<c:when test="${ad.hasDishwasher eq true}">
    						
    				<form:checkbox path="hasDishwasher" id="field-adDishwasher"
					tabindex="15" checked="checked" />
						</c:when>

						<c:otherwise>
     						<form:checkbox path="hasDishwasher" id="field-adDishwasher"
					tabindex="15" />
						</c:otherwise>
					</c:choose>
			
			
			
			</div>
		</div>

		<div class="row">
			<label class="col-md-4" for="field-smokingInside">Wird in der
				Wohnung geraucht:</label>
			<div class="col-md-4">
			<c:choose>
			<c:when test="${ad.smokingInside eq true}">
    						
    				<form:checkbox path="smokingInside" id="field-smokingInside"
					tabindex="16" checked="checked" />
						</c:when>

						<c:otherwise>
     						<form:checkbox path="smokingInside" id="field-smokingInside"
					tabindex="16"  />
						</c:otherwise>
					</c:choose>
				
			</div>
		</div>

		<div class="row">
			<label class="col-md-4" for="field-hasPets">Gibt es Haustiere
				in der Wohnung/ dürfen welche gehalten werden?:</label>
			<div class="col-md-4">
			<c:choose>
			<c:when test="${ad.hasPets eq true}">
    						
    				<form:checkbox path="hasPets" id="field-hasPets" tabindex="17"
					checked="checked" />
						</c:when>

						<c:otherwise>
     						<form:checkbox path="hasPets" id="field-hasPets" tabindex="17" />
						</c:otherwise>
					</c:choose>
				
			</div>
		</div>

		<div class="row">
			<label class="col-md-4" for="field-adBalcony">Balkon:</label>
			<div class="col-md-4">
			<c:choose>
			<c:when test="${ad.hasBalcony eq true}">
    						
    				<form:checkbox path="hasBalcony" id="field-adBalcony" tabindex="18"
					checked="checked" />
						</c:when>

						<c:otherwise>
     				<form:checkbox path="hasBalcony" id="field-adBalcony" tabindex="18" />
						</c:otherwise>
					</c:choose>
				
			</div>
		</div>

		<div class="row">
			<label class="col-md-4" for="field-wlan">Wlan:</label>
			<div class="col-md-4">
			<c:choose>
			<c:when test="${ad.wlan eq true}">
    						
    				<form:checkbox path="wlan" id="field-wlan" tabindex="19"
					checked="checked" />
						</c:when>

						<c:otherwise>
     							<form:checkbox path="wlan" id="field-wlan" tabindex="19" />
						</c:otherwise>
					</c:choose>
			
			</div>
		</div>

		<div class="seperator"></div>
		<legend>Zum Zimmer:</legend>

		<div class="row">
			<label class="col-md-4">Beschreibung des Zimmers:</label>
		</div>
		<div class="row">
			<div class="textareabig">
				<form:textarea path="description_room" tabindex="18"
					value="${ad.description_room}" />
			</div>
		</div>

		<div class="row">
			<label class="col-md-4" for="field-adIsToBalcony">Balkonzugang:</label>
			<div class="col-md-4">
			<c:choose>
			<c:when test="${ad.hasBalcony eq true}">
    						
    				<form:checkbox path="isToBalcony" id="field-adIsToBalcony" tabindex="20" checked="checked" />
						</c:when>

						<c:otherwise>
     					<form:checkbox path="isToBalcony" id="field-adIsToBalcony" tabindex="20"  />
						</c:otherwise>
					</c:choose>
				
			</div>
		</div>

		<div class="row">
			<label class="col-md-4" for="field-adHasCables">Kabelanschlüsse:</label>
			<div class="col-md-4">
			<c:choose>
			<c:when test="${ad.hasCables eq true}">
    						
    				<form:checkbox path="hasCables" id="field-adHasCables" tabindex="21"
					checked="checked" />
						</c:when>

						<c:otherwise>
     						<form:checkbox path="hasCables" id="field-adHasCables" tabindex="21" />
						</c:otherwise>
					</c:choose>
				
			</div>
		</div>

		<div class="row">
			<label class="col-md-4" for="field-hasBuiltIncloset">Einbauschrank:</label>
			<div class="col-md-4">
			<c:choose>
			<c:when test="${ad.hasBuiltInCloset eq true}">
    						
    					<form:checkbox path="hasBuiltInCloset" id="field-hasBuiltIncloset"
					tabindex="22" checked="checked" />
						</c:when>

						<c:otherwise>
     						<form:checkbox path="hasBuiltInCloset" id="field-hasBuiltIncloset"
					tabindex="22"  />
						</c:otherwise>
					</c:choose>
			
			</div>
		</div>


		<div class="seperator"></div>
		<legend>Zu den Persönlichkeiten:</legend>

		<div class="row">
			<label class="col-md-4">Wir sind:</label>
		</div>
		<div class="row">
			<div class="textareabig">
				<form:textarea path="description_us" tabindex="23"/> 
			</div>
		</div>

		<div class="row">
			<label class="col-md-4" for="field-wgGender">Wir sind eine: </label>
			<div class="col-md-4">
				<form:select path="wgGender" id="field-wgGender" tabindex="24">
					<option value="${ad.wgGender}">${ad.wgGender}</option>
					<option value="male">reine Männer WG</option>
					<option value="female">reine Frauen WG</option>
					<option value="mixed">gemischt WG</option>
				</form:select>
			</div>
		</div>

		<div class="row">
			<label class="col-md-4">Wir suchen:</label>
		</div>
		<div class="row">
			<div class="textareabig">
				<form:textarea path="whoWeAreLookingFor" tabindex="25" />
			</div>
		</div>

		<div class="row">
			<label class="col-md-4" for="field-AgeRange">Du bist im Alter
				von - bis: </label>
			<div class="col-md-4">
				<form:input path="ageRange" id="field-AgeRange" tabindex="26"
					maxlength="10" value="${ad.ageRange}" />
			</div>
		</div>

		<div class="row">
			<label class="col-md-4" for="field-Smoker">Raucher/Nichtraucher:
			</label>
			<div class="col-md-4">
				<form:select path="smoker" id="field-Smoker" tabindex="27">
					<option value="${ad.smoker}">${ad.smoker}</option>
					<option value="smoker">Raucher</option>
					<option value="nonsmoker">Nichtraucher</option>
					<option value="dontcare">Ist uns egal</option>
				</form:select>
			</div>
		</div>

		<div class="row">
			<label class="col-md-4" for="field-gender">Du bist:</label>
			<div class="col-md-4">
				<form:select path="genderWeLookFor" id="field-gender" tabindex="28">
					<option value="${ad.genderWeLookFor}">
						${ad.genderWeLookFor}</option>
					<option value="dontcare">Ist uns egal</option>
					<option value="male">Mann</option>
					<option value="female">Frau</option>
				</form:select>
			</div>
		</div>



		<div class="form-actions">

			<button type="submit" class="btn btn-primary" id="btnC"
				onclick="this.disabled=true;this.form.submit();">Create</button>
			<a href="#" onclick="history.go(-2)">
				<button type="button" class="btn btn-danger">Cancel</button>
			</a>


		</div>
	</fieldset>

</form:form>


<c:if test="${page_error != null }">
	<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<h4>Error!</h4>
		${page_error}
	</div>
</c:if>


<c:import url="template/footer.jsp" />
