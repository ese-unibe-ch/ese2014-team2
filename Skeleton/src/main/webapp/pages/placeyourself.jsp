<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


<div class="main">
	<h1 class="h1_inline">Über dich:</h1>


	<form:form method="post" modelAttribute="newRoomieForm"
		action="enlistroomie" id="newRoomieForm" cssClass="form-horizontal"
		autocomplete="off" enctype="multipart/form-data">
		<fieldset>


			<label class="control-label" for="field-personality">Persönlichkeits-typ</label>
			<div class="controls">
				<form:select path="personalityType" id="field-personalityType"
					tabindex="7">
					<option value="calm">eher ruhig</option>
					<option value="wild">eher wild</option>
					<option value="undef">undefiniert</option>
				</form:select>
			</div>

			<div class="seperator"></div>

			<h1 class="h1_inline">Bilder:</h1>

			<table border="1" cellpadding="5" width="700">
				<tr>
					<label for="image"> Profilbild (in JPEG Format, max 700kb):</label>
					<input name="image" type="file" />
					</br>
				</tr>
				<tr>
					<td><label class="control-label" for="field-description">Beschreibe
							dich selbst:</label>
						<div class="controls">
							<form:textarea rows="10" cols="90" path="description"
								id="field-adDescription" tabindex="18" placeholder="Du bist... " />
						</div></td>
			</table>

			<div class="seperator"></div>

			<table border="1" cellpadding="5" width="700">
				<tr>
					</div>
					</td>
					<td><label class="control-label" for="field-Age">Alter:
					</label>
						<div class="controls">
							<form:input path="age" id="field-Age" tabindex="5" maxlength="10" />
						</div> <label class="control-label" for="field-Smoker">Raucher/
							Nichtraucher: </label>
						<div class="controls">
							<form:select path="smoker" id="field-Smoker" tabindex="26">
								<option value="smoker">Raucher</option>
								<option value="nonsmoker">Nichtraucher</option>
							</form:select>
							<label class="control-label" for="field-hasPets">Besitzt
								du Haustiere?:</label>
							<form:checkbox path="hasPets" id="field-hasPets" tabindex="15" />
							<br></br>
						</div> <label class="control-label" for="field-gender">Du bist:</label>
						<div class="controls">
							<form:select path="gender" id="field-gender" tabindex="27">
								<option value="female">Weiblich</option>
								<option value="male">Männlich</option>
								<option value="male">Sehr männlich</option>
							</form:select>
						</div></td>
				</tr>

			</table>





			<div class="form-actions">
				<button type="submit" class="btn btn-primary btn-lg">Erstellen!</button>
				<button type="button" class="btn btn-default btn-lg">Cancel</button>
				
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
