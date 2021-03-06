<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<meta charset="UTF-8">


<c:import url="template/header.jsp" />


	<h1>Erstelle dein Inserat!</h1>


	<form:form method="post"  modelAttribute="adForm" action="enlistad" id="adForm" cssClass="form-horizontal" autocomplete="off" enctype="multipart/form-data" accept-charset="utf-8">
		<fieldset>
		
		<legend>Grundlegende Infos:</legend>
			<c> die mit <b>*</b> markierten Felder sind Pflichtfelder</c>
			<br> <br>
		
			<div class="row">
				<label class="col-md-4" for="field-title">Titel: </label>
				<div class="col-md-4">
					<form:input path="title" id="field-title"  maxlength="50"/>
					
				</div>
			</div>
			
			
			
			
			
			<c:set var="roomPriceErrors"><form:errors path="roomPrice"/></c:set>
			<div class="row">
				<label class="col-md-4" for="field-price">Preis des Zimmers: <b>*</b> </label>
				<div class="col-md-4">
					<form:input path="roomPrice" id="field-price" tabindex="1" maxlength="10" />
					<form:errors path="roomPrice" cssClass="help-inline" element="span"/>
				</div>
			</div>
			
			<c:set var="startErrors"><form:errors path="start"/></c:set>
			<div class="row">
				<label class="col-md-4" for="field-von">Ab wann ist das Zimmer frei: </label>
				<div class="col-md-4">
					<form:input path="start" type="field-von" id="datepicker" tabindex="2" />
					<form:errors path="start" cssClass="help-inline" element="span"/>
				</div>
			</div>
			<p>Leer lassen, wenn das Zimmer per sofort frei ist.</p>
			
			<c:set var="untilErrors"><form:errors path="until"/></c:set>
			<div class="row">
				<label class="col-md-4" for="field-bis">Bis wann ist das Zimmer frei:  </label>
				<div class="col-md-4">
					<form:input path="until" type="field-bis" id="datepicker2" tabindex="3" />
					<form:errors path="until" cssClass="help-inline" element="span"/>
				</div>
			</div>
			<p>Leer lassen, wenn das Zimmer unbefristet zur verfügung steht.</p>
			
			<c:set var="roomsErrors"><form:errors path="rooms"/></c:set>
			<div class="row">
				<label class="col-md-4" for="field-rooms">Wie viele Zimmer hat die Wohnung: <b>*</b> </label>
				<div class="col-md-4">
					<form:input path="rooms" id="field-rooms" tabindex="4" maxlength="10" />
					<form:errors path="rooms" cssClass="help-inline" element="span"/>
				</div>
			</div>
			
			<c:set var="roomSpaceErrors"><form:errors path="roomSpace"/></c:set>
			<div class="row">
				<label class="col-md-4" for="field-roomSpace">Grösse des Zimmers:<b>*</b> </label>
				<div class="col-md-4">
					<form:input path="roomSpace" id="field-roomSpace" tabindex="5" maxlength="10" />
					<form:errors path="roomSpace" cssClass="help-inline" element="span"/>
				</div>
			</div>
			<p>Angegeben in m²</p>
			
			<c:set var="nmbrOfRoommatesErrors"><form:errors path="nmbrOfRoommates"/></c:set>
			<div class="row">
				<label class="col-md-4" for="field-adNmbrOfRoommates">Anzahl an Mitbewohner:<b>*</b> </label>
				<div class="col-md-4">
					<form:select path="nmbrOfRoommates" id="field-adNmbrOfRoommates" tabindex="6">
						<option value="0">Bitte wähle einen Wert</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
					</form:select>
					<form:errors path="nmbrOfRoommates" cssClass="help-inline" element="span"/>
				</div>
			</div>
			<p>Exklusiv der gesuchten Person</p>

			<c:set var="wgTypeErrors"><form:errors path="wgType"/></c:set>
			<div class="row">
				<label class="col-md-4" for="field-wgType">Wir sind eine:<b>*</b> </label>
				<div class="col-md-4">
					<form:select path="wgType" id="field-wgType" tabindex="7">
						<option value="undef">weder noch WG</option>
						<option value="calm">ruhige WG</option>
						<option value="wild">lebhafte WG</option>
					</form:select>
					<form:errors path="wgType" cssClass="help-inline" element="span"/>

				</div>
			</div>
			
			<c:set var="furnishedErrors"><form:errors path="furnished"/></c:set>
			<div class="row">
				<label class="col-md-4" for="field-furnished">Möbliert:<b>*</b> </label>
				<div class="col-md-4">
					<form:checkbox path="furnished" id="field-furnished" tabindex="8" cssClass="checkboxbig"/>
					<form:errors path="furnished" cssClass="help-inline" element="span"/>
				</div>
			</div>



			<div class="seperator"></div>


			<legend>Adresse der WG:</legend>
			
			
			<c:set var="addressErrors"><form:errors path="address"/></c:set>
			<div class="row">
				<label class="col-md-4" for="field-adAddress">Strasse mit Hausnummer:<b>*</b> </label>
				<div class="col-md-4">
					<form:input path="address" id="field-adAddress" tabindex="9" maxlength="30" />
					<form:errors path="address" cssClass="help-inline" element="span"/>
				</div>
			</div>
			
			<c:set var="cityErrors"><form:errors path="city"/></c:set>
			<div class="row">
				<label class="col-md-4" for="field-city">Ort:<b>*</b> </label>
				<div class="col-md-4">
					<form:input path="city" id="field-city" tabindex="10"maxlength="20" placeholder="City" />
					<form:errors path="city" cssClass="help-inline" element="span"/>
				</div>
			</div>
			
			
			
			<c:set var="kantonErrors"><form:errors path="kanton"/></c:set>
			<div class="row">
				<label class="col-md-4" for="field-adKanton">Kanton:<b>*</b> </label>
				<div class="col-md-4">
					<form:input path="kanton" id="field-adKanton" tabindex="11" maxlength="10" placeholder="Kanton" />
					<form:errors path="kanton" cssClass="help-inline" element="span"/>
				</div>
			</div>
			
			<c:set var="plzErrors"><form:errors path="plz"/></c:set>
			<div class="row">
				<label class="col-md-4" for="field-adPlz">Postleitzahl:<b>*</b> </label>
				<div class="col-md-4">
					<form:input path="plz" id="field-adPlz" tabindex="12" maxlength="4" placeholder="PLZ" />
					<form:errors path="plz" cssClass="help-inline" element="span"/>
				</div>
			</div>
			
			

			<div class="seperator"></div>

			<legend>Bilder:</legend>
			<p>Nur Bilder in gängigen Formaten (.jpg, .jpeg, .gif, .png)</p>
					
					<div class="row">
						<label for="image">: Titelbild </label>
						<div class="col-md-4">
							<input name="image" type="file" />
						</div>
					</div>
					
					<div class="row">
						<label for="image">: Bild 1 </label>
						<div class="col-md-4">
							<input name="image" type="file" />
						</div>
					</div>
					
					<div class="row">
						<label for="image">: Bild 2 </label>
						<div class="col-md-4">
							<input name="image" type="file" />
						</div>
					</div>
					
					<div class="row">
						<label for="image">: Bild 3 </label>
						<div class="col-md-4">
							<input name="image" type="file" />
						</div>
					</div>




			<div class="seperator"></div>


			<legend>Zur Wohnung:</legend>

			<div class="row">
				<label class="col-md-4">Wohnungsbeschreibung:</label>
			</div>
			<div class="row">
					<div class="textareabig">
						<form:textarea path="description_ad" tabindex="13" placeholder="Unsere Wohnung ist... Unsere Wohnung hat... In der Nähe befindet sich..." />
					</div>
			</div>
			
			<div class="row">	
				<label class="col-md-4" for="field-adLaundry">Waschmaschine:</label>
					<div class="col-md-4">
						<form:checkbox path="hasLaundry" id="field-adLaundry" tabindex="14" cssClass="checkboxbig"/>
					</div>
			</div>
			
			<div class="row">		
				<label class="col-md-4" for="field-adDishwasher">Geschirrspüler:</label> 
					<div class="col-md-4">
						<form:checkbox path="hasDishwasher" id="field-adDishwasher" tabindex="15" cssClass="checkboxbig"/>
					</div>
			</div>
			
			<div class="row">
				<label class="col-md-4" for="field-smokingInside">Raucherwohnung:</label> 
					<div class="col-md-4">
						<form:checkbox path="smokingInside" id="field-smokingInside" tabindex="16" cssClass="checkboxbig" />
					</div>
			</div>
			
			<div class="row">		
				<label class="col-md-4" for="field-hasPets">Gibt es Haustiere in der Wohnung/ dürfen welche gehalten werden?:</label> 
					<div class="col-md-4">
						<form:checkbox path="hasPets" id="field-hasPets" tabindex="17" cssClass="checkboxbig" />
					</div>
			</div>
			
			<div class="row">	
				<label class="col-md-4" for="field-adBalcony">Balkon:</label> 
					<div class="col-md-4">
						<form:checkbox path="hasBalcony" id="field-adBalcony" tabindex="18" cssClass="checkboxbig" />
					</div>
			</div>
			
			<div class="row">	
				<label class="col-md-4" for="field-wlan">Wlan:</label> 
					<div class="col-md-4">
						<form:checkbox path="wlan" id="field-wlan" tabindex="19" cssClass="checkboxbig"/>
					</div>
			</div>

			<div class="seperator"></div>
			<legend>Zum Zimmer:</legend>
			
			<div class="row">
			<label class="col-md-4">Beschreibung des Zimmers:</label>
			</div>
			<div class="row">
				<div class="textareabig">
					<form:textarea path="description_room" tabindex="18" placeholder="Das Zimmer ist... Das Zimmer besitzt..." />
				</div>
			</div>
			
			<div class="row">
				<label class="col-md-4" for="field-rooms">Öffentlicher Besichtigungstermin</label>
				<div class="col-md-4">
					<form:input path="publicVisit" id="field-rooms"  maxlength="10" />
				</div>
			</div>
			<p>Optional. Spezifische Termine können im späteren Verlauf geplant werden.</p>
			
			<div class="row">	
			<label class="col-md-4" for="field-adIsToBalcony">Balkonzugang:</label>
				<div class="col-md-4">		
					<form:checkbox path="isToBalcony" id="field-adIsToBalcony" tabindex="20" cssClass="checkboxbig" /> 
				</div>
			</div>
			
			<div class="row">		
			<label class="col-md-4" for="field-adHasCables">Kabelanschlüsse:</label> 
				<div class="col-md-4">
					<form:checkbox path="hasCables" id="field-adHasCables" tabindex="21"  cssClass="checkboxbig"/> 
				</div>
			</div>
			
			<div class="row">	
			<label class="col-md-4" for="field-hasBuiltIncloset">Einbauschrank:</label>
				<div class="col-md-4">		
					<form:checkbox path="hasBuiltInCloset" id="field-hasBuiltIncloset" tabindex="22" cssClass="checkboxbig"/>
				</div>
			</div>


			<div class="seperator"></div>
			<legend>Zu den Personen:</legend>
		
		<div class="row">
			<label class="col-md-4">Wir sind:</label>
		</div>
		<div class="row">
				<div class="textareabig">
					<form:textarea path="description_us" tabindex="23" placeholder="Wir sind... Wir bevorzugen... Wir machen gerne..." />
				</div>
		</div>
		
		<div class="row">		
			<label class="col-md-4" for="field-wgGender">Unsere WG setzt sich zusamen aus: </label>
				<div class="col-md-4">
					<form:select path="wgGender" id="field-wgGender" tabindex="24">
						<option value="">---</option>
						<option value="male">nur Männern</option>
						<option value="female">nur Frauen</option>
						<option value="mixed">Beiden Geschlechtern</option>
					</form:select>
				</div>
		</div>

		<div class="row">
			<label class="col-md-4">Wir suchen:</label>
		</div>
		<div class="row">
				<div class="textareabig">
					<form:textarea path="whoWeAreLookingFor" tabindex="25" placeholder="Du bist... Du machst gerne... " />
				</div>
		</div>
		
		<div class="row">	
			<label class="col-md-4" for="field-AgeRange">Du bist im Alter von - bis: </label>
				<div class="col-md-4">
					<form:input path="ageRange" id="field-AgeRange" tabindex="26" maxlength="10" />
				</div>
		</div>
		
		<div class="row">				 
			<label class="col-md-4" for="field-Smoker">Raucher/Nichtraucher: </label>
				<div class="col-md-4">
					<form:select path="smoker" id="field-Smoker" tabindex="27">
						<option value="">---</option>
						<option value="smoker">Raucher</option>
						<option value="nonsmoker">Nichtraucher</option>
						<option value="dontcare">Ist uns egal</option>
					</form:select>
				</div> 
		</div>
		
		<div class="row">		
			<label class="col-md-4" for="field-gender">Dein Geschlecht:</label>
				<div class="col-md-4">
					<form:select path="genderWeLookFor" id="field-gender" tabindex="28">
						<option value="dontcare">Ist uns egal</option>
						<option value="male">Mann</option>
						<option value="female">Frau</option>
					</form:select>
				</div>
		</div>



			<div class="form-actions">

				<button type="submit" class="btn btn-primary" id="btnC" onclick="this.disabled=true;this.form.submit();">Erstellen</button>
				<a href="#" onclick="history.go(-2)">	<button type="button" class="btn btn-danger">Abbrechen</button></a>
				

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
