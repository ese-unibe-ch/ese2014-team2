<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:import url="template/header.jsp" />


<div class="main">
	<h1>Place yourself:</h1>




	<form:form method="post" modelAttribute="newRoomieForm" action="enlistroomie" id="newRoomieForm" cssClass="form-horizontal" autocomplete="off" enctype="multipart/form-data">
		<fieldset>

		
		
			<div class="seperator"></div>

			<legend>Dein Profilbild:</legend>

			<div class="row">
					<label class="col-md-4" for="image"> Profilbild (in JPEG Format, max 700kb):</label>
					<input name="image" type="file" />
			</div>
			
			<legend>Über dich:</legend>
			<div class="row">
			<label class="col-md-4" for="field-personality">Persönlichkeits-typ</label>
			<div class="col-md-4">
				<form:select path="personalityType" id="field-personalityType" tabindex="7">
					<option value="calm">eher ruhig</option>
					<option value="wild">eher wild</option>
					<option value="undef">undefiniert</option>
				</form:select>
			</div>
		</div>
			
			<div class="row">
				<label class="col-md-4">Beschreibe dich selbst:</label>
			</div>
			<div class="row">
						<div class="textareabig">
							<form:textarea path="description"
								id="describeyourself" tabindex="18" placeholder="Du bist... " />
						</div>
			</div>
						
			<div class="seperator"></div>

			<div class="row">
			<label class="col-md-4" for="field-Age">Alter: </label>
						<div class="col-md-4">
							<form:input path="age" id="field-Age" tabindex="5" maxlength="10" />
						</div> 
			</div>
			
			
			<div class="row">
			<label class="col-md-4" for="field-Smoker">Raucher/ Nichtraucher: </label>
						<div class="col-md-4">
							<form:select path="smoker" id="field-Smoker" tabindex="26">
								<option value="smoker">Raucher</option>
								<option value="nonsmoker">Nichtraucher</option>
							</form:select>
						</div>
			</div>
			
			<div class="row">			
			<label class="col-md-4" for="field-hasPets">Besitzt du Haustiere?:</label>
				<div class="col-md-4">
					<form:checkbox path="hasPets" id="field-hasPets" tabindex="15" />
				</div> 
			</div>
			
			<div class="row">	
			<label class="col-md-4" for="field-gender">Du bist:</label>
						<div class="col-md-4">
							<form:select path="gender" id="field-gender" tabindex="27">
								<option value="female">Weiblich</option>
								<option value="male">Männlich</option>
								<option value="male">Sehr männlich</option>
							</form:select>
						</div>
			</div>



			<div class="form-actions">

				<button type="submit" class="btn btn-primary">Create</button>
				<button type="button" class="btn btn-danger">Cancel</button>

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
