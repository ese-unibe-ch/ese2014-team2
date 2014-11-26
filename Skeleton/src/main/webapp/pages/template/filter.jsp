<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<style>
	.line-height {
					line-height:300% !important;
					}
</style>

<script>

$(document).ready(function(){
  $("#showHide").click(function(){
    $("#filter").toggle();
    var $el = $(this);
    $el.text($el.text() == "Zeige den Filter" ? "Verstecke den Filter": "Zeige den Filter");
  });
});


</script>

				<button id="showHide" class="btn btn-info btn-lg btn-block" type="button" id="show">Zeige den Filter</button>	

<div id="filter" class="panel panel-default" style="display:none">
	<div class="panel-body">


		
​<div class="line-height">
			
	<form:form method="post" modelAttribute="filterForm" action="filterAds" id="newAdForm" cssClass="form-horizontal" autocomplete="off" enctype="multipart/form-data">
		<div class="col-md-3">
			<label>Möbliert:</label><br>
			<label>Waschmaschine:</label><br>
			<label>Geschirrspüler:</label><br>
			<label>Balkon:</label><br>
			<label>Rauchen im Haus:</label><br>
			<label>Haustiere erlaubt:</label><br>
			<label>Wlan:</label><br>
		</div>
		
		<div class="col-md-1">
			<form:checkbox path="furnished" id="field-furnished" cssClass="checkboxbig"/><br>
			<form:checkbox	path="hasLaundry" id="field-Laundry" cssClass="checkboxbig"/> <br>
			<form:checkbox	path="hasDishwasher" id="field-Dishwasher" cssClass="checkboxbig"/><br>
			<form:checkbox path="hasBalcony" id="field-hasBalcony" cssClass="checkboxbig"/><br>
			<form:checkbox	path="smokingInside" id="field-smokingInside" cssClass="checkboxbig"/><br>
			<form:checkbox	path="hasPets" id="field-pets" cssClass="checkboxbig" /><br>
			<form:checkbox	path="wlan" id="field-wlan" cssClass="checkboxbig" /><br>    
		</div>
		
		<div class="col-md-3">
			<label>Einbauschrank:</label><br>
			<label>Balkonzugang:</label><br>
			<label>Kabelanschluss:</label><br>
			<label>Grober WG-Typ:</label><br>
			<label>Max. Zimmerpreis:</label><br>
			<label>Stadt:</label><br>
			<label>Geschlechteraufteilung:</label><br>
		</div>
		
		<div class="col-md-1">
			<form:checkbox path="hasBuiltInCloset" id="field-hasBuiltInCloset" cssClass="checkboxbig" /><br>
			<form:checkbox	path="toBalcony" id="field-isToBalcony" cssClass="checkboxbig"/><br>
			<form:checkbox	path="hasCables" id="field-hasCables" cssClass="checkboxbig"/><br>
			<form:select path="wgType" id="field-wgType">
				<option value="undef">egal</option>
				<option value="wild">eher wild</option>
				<option value="calm">eher ruhig</option>
			</form:select>
			<form:input path="roomPrice" id="field-roomPrice" maxlength="6" /><br>
			<form:input path="city" id="field-city" maxlength="15" /><br>
			<form:select path="wgGender" id="field-wgGender">
				<option value="dontcare"> Egal</option>
				<option value="female">Reine Frauenwg</option>
				<option value="male">Reine Männerwg</option>
			</form:select>
		</div>
	</div>
	
	<div class="col-md-10">
		<br>
		<br>
		<button type="submit" class="btn btn-primary">Filter</button>
	</div>
	
    		
	</form:form>
		
	</div>
</div>




