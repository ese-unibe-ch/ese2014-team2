<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />

<div class="main">
	<h1>Post your Ad!</h1>

	<form:form method="post" modelAttribute="newAdForm" action="enlistad"
		id="newAdForm" cssClass="form-horizontal" autocomplete="off" enctype="multipart/form-data">
		<fieldset>

			<h1>Basics:</h1>



			<label class="control-label" for="field-adPrice">Price:</label>
			<div class="controls">
				<form:input path="price" id="field-adPrice" tabindex="1"
					maxlenght="4" placeholder="Price" />
			</div>


			<label class="control-label" for="field-adIsLimited">Is it
				Limited:</label>
			<div class="controls">
				<form:checkbox path="isLimited" id="field-adIsLimited" tabindex="2" />
			</div>


			<label class="control-label" for="field-adSpace">Space:</label>
			<div class="controls">
				<form:input path="space" id="field-adSpace" tabindex="3"
					maxlength="4" placeholder="Space m^2" />
			</div>


			<label class="control-label" for="field-adRoomies">Roomies:</label>
			<div class="controls">
				<form:select path="roomies" id="field-adRoomies" tabindex="4">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</form:select>
			</div>


			<div class="seperator"></div>


			<h1>Address:</h1>



			<label class="control-label" for="field-adKanton">Kanton:</label>
			<div class="controls">
				<form:input path="kanton" id="field-adKanton" tabindex="5"
					maxlength="10" placeholder="Kanton" />
			</div>


			<label class="control-label" for="field-adPlz">Postleitzahl:</label>
			<div class="controls">
				<form:input path="plz" id="field-adPlz" tabindex="6" maxlength="4"
					placeholder="PLZ" />
			</div>


			<label class="control-label" for="field-adOrt">Ort:</label>
			<div class="controls">
				<form:input path="ort" id="field-adOrt" tabindex="7" maxlength="20"
					placeholder="Ort" />
			</div>


			<label class="control-label" for="field-adAddress">Address:</label>
			<div class="controls">
				<form:input path="address" id="field-adAddress" tabindex="8"
					maxlength="30" placeholder="Addresse" />
			</div>


			<label class="control-label" for="field-adRegion">Region:</label>
			<div class="controls">
				<form:input path="region" id="field-adRegion" tabindex="9"
					maxlength="20" placeholder="Region" />
			</div>


			<div class="seperator"></div>
			<h1>Bilder:</h1>

		<tr>
				<th><label for="image">Image (in JPEG format only):</label></th>
				<td><input name="image" type="file" />
				th><label for="image">Image2 (in JPEG format only):</label></th>
				<td><input name="image" type="file" />
				th><label for="image">Image3 (in JPEG format only):</label></th>
				<td><input name="image" type="file" />
				th><label for="image">Image4 (in JPEG format only):</label></th>
				<td><input name="image" type="file" />
			</tr>
		


			<div class="seperator"></div>
			<h1>Zur Wohnung:</h1>

			<label class="control-label" for="field-adDescription_ad">Wohnungsbeschreibung:</label>
			<div class="controls">
				<form:textarea rows="10" cols="100" path="description_ad"
					id="field-adDescription_ad" tabindex="12"
					placeholder="Unsere Wohnung ist... Unsere Wohnung hat... In der Nähe befindet sich..." />
			</div>


			<label class="control-label" for="field-adLaundry">Waschmaschine:</label>
			<form:checkbox path="hasLaundry" id="field-adLaundry" tabindex="13" />


			<label class="control-label" for="field-adTumbler">Tumbler:</label>
			<form:checkbox path="hasTumbler" id="field-adTumbler" tabindex="14" />


			<label class="control-label" for="field-adBalcony">Balkon:</label>
			<form:checkbox path="hasBalcony" id="field-adBalcony" tabindex="15" />


			<div class="seperator"></div>
			<h1>Zum Zimmer:</h1>

			<label class="control-label" for="field-adDescription_room">Beschreibung
				des Zimmers:</label>
			<div class="controls">
				<form:textarea rows="10" cols="100" path="description_room"
					id="field-adDescription_room" tabindex="16"
					placeholder="Das Zimmer ist... Das Zimmer besitzt..." />
			</div>


			<label class="control-label" for="field-adIsToBalcony">Balkonzugang:</label>
			<form:checkbox path="isToBalcony" id="field-adIsToBalcony"
				tabindex="17" />


			<label class="control-label" for="field-adHasCables">Kabelanschlüsse:</label>
			<form:checkbox path="hasCables" id="field-adHasCables" tabindex="18" />


			<div class="seperator"></div>
			<h1>Zu Persönlichkeiten:</h1>

			<label class="control-label" for="field-adDescription_us">Wir
				sind:</label>
			<div class="controls">
				<form:textarea rows="10" cols="100" path="description_us"
					id="field-adDescription_us" tabindex="19"
					placeholder="Wir sind... Wir bevorzugen... Wir machen gerne..." />
			</div>


			<label class="control-label" for="field-adDescription_you">Du
				bist:</label>
			<div class="controls">
				<form:textarea rows="10" cols="100" path="description_you"
					id="field-adDescription_you" tabindex="20"
					placeholder="Du bist... Du machst gerne... " />
			</div>



			<div class="form-actions">
				<button type="submit" class="btnblue">Create</button>
				<button type="button" class="btnred">Cancel</button>
			</div>
		</fieldset>

	</form:form>

</div>


<c:if test="${page_error != null }">
	<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<h4>Error!</h4>
		${page_error}
	</div>
</c:if>


<c:import url="template/footer.jsp" />
