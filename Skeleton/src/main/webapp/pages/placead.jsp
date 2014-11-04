<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


	<h1>Post your Ad!</h1>


	<form:form method="post" modelAttribute="newAdForm" action="enlistad" id="newAdForm" cssClass="form-horizontal" autocomplete="off" enctype="multipart/form-data">
		<fieldset>
			<legend>Grundlegende Infos:</legend>
			<div class="row">
				<label class="col-md-4" for="field-price">Preis des Zimmers: </label>
				<div class="col-md-4">
					<form:input path="roomPrice" id="field-price" tabindex="1" maxlength="10" />
				</div>
			</div>
			
			<div class="row">
				<label class="col-md-4" for="field-von">Ab wann ist das Zimmer frei: </label>
				<div class="col-md-4">
					<form:input path="start" type="field-von" id="datepicker" tabindex="2" />
				</div>
			</div>
			
			<div class="row">
				<label class="col-md-4" for="field-bis">Bis wann ist das Zimmer frei: </label>
				<div class="col-md-4">
					<form:input path="until" type="field-bis" id="datepicker2" tabindex="3" />
				</div>
			</div>
	
			<div class="row">
				<label class="col-md-4" for="field-rooms">Anzahl an Zimmer: </label>
				<div class="col-md-4">
					<form:input path="rooms" id="field-rooms" tabindex="4" maxlength="10" />
				</div>
			</div>

			<div class="row">
				<label class="col-md-4" for="field-roomSpace">Grösse des Zimmers:</label>
				<div class="col-md-4">
					<form:input path="roomSpace" id="field-roomSpace" tabindex="5" maxlength="10" />
				</div>
			</div>
			
			<div class="row">
				<label class="col-md-4" for="field-adNmbrOfRoommates">Wie viele Mitbewohner (Exkl. der gesuchten Person)</label>
				<div class="col-md-4">
					<form:select path="nmbrOfRoommates" id="field-adNmbrOfRoommates" tabindex="6">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
					</form:select>
				</div>
			</div>


			<div class="row">
				<label class="col-md-4" for="field-wgType">Ungefährer WG-Typ</label>
				<div class="col-md-4">
					<form:select path="wgType" id="field-wgType" tabindex="7">
						<option value="calm">eher ruhig</option>
						<option value="wild">eher wild</option>
						<option value="undef">undefiniert</option>
					</form:select>
				</div>
			</div>
			
			<div class="row">
				<label class="col-md-4" for="field-furnished">Möbliert:</label>
				<div class="col-md-4">
					<form:checkbox path="furnished" id="field-furnished" tabindex="8" />
				</div>
			</div>



			<div class="seperator"></div>


			<legend>Adresse der WG:</legend>

			<div class="row">
				<label class="col-md-4" for="field-adKanton">Kanton:</label>
				<div class="col-md-4">
					<form:input path="kanton" id="field-adKanton" tabindex="7" maxlength="10" placeholder="Kanton" />
				</div>
			</div>
			
			
			<div class="row">
				<label class="col-md-4" for="field-adPlz">Postleitzahl:</label>
				<div class="col-md-4">
					<form:input path="plz" id="field-adPlz" tabindex="8" maxlength="4" placeholder="PLZ" />
				</div>
			</div>
			
			<div class="row">
				<label class="col-md-4" for="field-city">Ort:</label>
				<div class="col-md-4">
					<form:input path="city" id="field-city" tabindex="9" maxlength="20" placeholder="City" />
				</div>
			</div>

			<div class="row">
				<label class="col-md-4" for="field-adAddress">Strasse mit Hausnummer</label>
				<div class="col-md-4">
					<form:input path="address" id="field-adAddress" tabindex="10" maxlength="30" />
				</div>
			</div>
			

			<div class="seperator"></div>

			<legend>Bilder:</legend>
					
					<div class="row">
						<label for="image">: TitleImage (in JPEG format only, and max 700kb)</label>
						<div class="col-md-4">
							<input name="image" type="file" />
						</div>
					</div>
					
					<div class="row">
						<label for="image">: Ad Image 1 (in JPEG format only, and max 700kb)</label>
						<div class="col-md-4">
							<input name="image" type="file" />
						</div>
					</div>
					
					<div class="row">
						<label for="image">: Ad Image 2 (in JPEG format only, and max 700kb)</label>
						<div class="col-md-4">
							<input name="image" type="file" />
						</div>
					</div>
					
					<div class="row">
						<label for="image">: Ad Image 3 (in JPEG format only, and max 700kb)</label>
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
						<form:textarea path="description_ad" tabindex="11" placeholder="Unsere Wohnung ist... Unsere Wohnung hat... In der Nähe befindet sich..." />
					</div>
			</div>
			
			<div class="row">	
				<label class="col-md-4" for="field-adLaundry">Waschmaschine:</label>
					<div class="col-md-4">
						<form:checkbox path="hasLaundry" id="field-adLaundry" tabindex="12" />
					</div>
			</div>
			
			<div class="row">		
				<label class="col-md-4" for="field-adDishwasher">Geschirrspüler:</label> 
					<div class="col-md-4">
						<form:checkbox path="hasDishwasher" id="field-adDishwasher" tabindex="13" />
					</div>
			</div>
			
			<div class="row">
				<label class="col-md-4" for="field-smokingInside">Wird in der Wohnung geraucht:</label> 
					<div class="col-md-4">
						<form:checkbox path="smokingInside" id="field-smokingInside" tabindex="14" />
					</div>
			</div>
			
			<div class="row">		
				<label class="col-md-4" for="field-hasPets">Gibt es Haustiere in der Wohnung/ dürfen welche gehalten werden?:</label> 
					<div class="col-md-4">
						<form:checkbox path="hasPets" id="field-hasPets" tabindex="15" />
					</div>
			</div>
			
			<div class="row">	
				<label class="col-md-4" for="field-adBalcony">Balkon:</label> 
					<div class="col-md-4">
						<form:checkbox path="hasBalcony" id="field-adBalcony" tabindex="16" />
					</div>
			</div>
			
			<div class="row">	
				<label class="col-md-4" for="field-wlan">Wlan:</label> 
					<div class="col-md-4">
						<form:checkbox path="wlan" id="field-wlan" tabindex="17" />
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
			<label class="col-md-4" for="field-adIsToBalcony">Balkonzugang:</label>
				<div class="col-md-4">		
					<form:checkbox path="isToBalcony" id="field-adIsToBalcony" tabindex="19" /> 
				</div>
			</div>
			
			<div class="row">		
			<label class="col-md-4" for="field-adHasCables">Kabelanschlüsse:</label> 
				<div class="col-md-4">
					<form:checkbox path="hasCables" id="field-adHasCables" tabindex="20" /> 
				</div>
			</div>
			
			<div class="row">	
			<label class="col-md-4" for="field-hasBuiltIncloset">Einbauschrank:</label>
				<div class="col-md-4">		
					<form:checkbox path="hasBuiltInCloset" id="field-hasBuiltIncloset" tabindex="21" />
				</div>
			</div>


			<div class="seperator"></div>
			<legend>Zu den Persönlichkeiten:</legend>
		
		<div class="row">
			<label class="col-md-4">Wir sind:</label>
		</div>
		<div class="row">
				<div class="textareabig">
					<form:textarea path="description_us" tabindex="22" placeholder="Wir sind... Wir bevorzugen... Wir machen gerne..." />
				</div>
		</div>
		
		<div class="row">		
			<label class="col-md-4" for="field-wgGender">Wir sind eine: </label>
				<div class="col-md-4">
					<form:select path="wgGender" id="field-wgGender" tabindex="23">
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
					<form:textarea path="whoWeAreLookingFor" tabindex="24" placeholder="Du bist... Du machst gerne... " />
				</div>
		</div>
		
		<div class="row">	
			<label class="col-md-4" for="field-AgeRange">Du bist im Alter von - bis: </label>
				<div class="col-md-4">
					<form:input path="ageRange" id="field-AgeRange" tabindex="5" maxlength="10" />
				</div>
		</div>
		
		<div class="row">				 
			<label class="col-md-4" for="field-Smoker">Raucher/Nichtraucher: </label>
				<div class="col-md-4">
					<form:select path="smoker" id="field-Smoker" tabindex="26">
						<option value="smoker">Raucher</option>
						<option value="nonsmoker">Nichtraucher</option>
						<option value="dontcare">Ist uns egal</option>
					</form:select>
				</div> 
		</div>
		
		<div class="row">		
			<label class="col-md-4" for="field-gender">Du bist:</label>
				<div class="col-md-4">
					<form:select path="genderWeLookFor" id="field-gender" tabindex="27">
						<option value="male">Mann</option>
						<option value="female">Frau</option>
						<option value="dontcare">Ist uns egal</option>
					</form:select>
				</div>
		</div>



			<div class="form-actions">
				<button type="submit" class="btn btn-primary">Create</button>
				<button type="button" class="btn btn-danger">Cancel</button>
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
