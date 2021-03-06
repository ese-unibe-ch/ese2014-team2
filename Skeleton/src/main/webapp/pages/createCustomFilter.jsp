<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />

<style>
		.main {
				line-height:300% !important;
				font-size:15px;
				}
	</style>

<div class="main">
	
	
		<legend>Benachrichtigungsfilter erstellen!</legend>
              <form:form method="post" modelAttribute="filterForm" action="saveCustomFilter" id="filterForm" cssClass="form-horizontal" autocomplete="off" enctype="multipart/form-data">
				<fieldset>
		
	
		<div class="col-md-5">
			<label>Möbliert:</label><br>
			<label>Waschmaschine:</label><br>
			<label>Geschirrspüler:</label><br>
			<label>Balkon:</label><br>
			<label>Rauchen im Haus:</label><br>
			<label>Haustiere erlaubt:</label><br>
			<label>Wlan:</label><br>
		</div>
		
		<div class="col-md-1">
			<form:checkbox path="furnished" id="field-furnished" cssClass="checkboxbig"/>
			<form:checkbox	path="hasLaundry" id="field-Laundry" cssClass="checkboxbig"/> 
			<form:checkbox	path="hasDishwasher" id="field-Dishwasher" cssClass="checkboxbig"/>
			<form:checkbox path="hasBalcony" id="field-hasBalcony" cssClass="checkboxbig"/>
			<form:checkbox	path="smokingInside" id="field-smokingInside" cssClass="checkboxbig"/>
			<form:checkbox	path="hasPets" id="field-pets" cssClass="checkboxbig" />
			<form:checkbox	path="wlan" id="field-wlan" cssClass="checkboxbig" />    
		</div>
		
		<div class="col-md-5">
			<label>Einbauschrank:</label><br>
			<label>Balkonzugang:</label><br>
			<label>Kabelanschluss:</label><br>
			<label>Grober WG-Typ:</label><br>
			<label>Max. Zimmerpreis:</label><br>
			<label>Stadt:</label><br>
			<label>Geschlechteraufteilung:</label><br>
		</div>
		
		<div class="col-md-1">
			<form:checkbox path="hasBuiltInCloset" id="field-hasBuiltInCloset" cssClass="checkboxbig" />
			<form:checkbox	path="toBalcony" id="field-isToBalcony" cssClass="checkboxbig"/>
			<form:checkbox	path="hasCables" id="field-hasCables" cssClass="checkboxbig"/>
			<form:select path="wgType" id="field-wgType">
				<option value="undef">egal</option>
				<option value="wild">eher wild</option>
				<option value="calm">eher ruhig</option>
			</form:select>
			<form:input path="roomPrice" id="field-roomPrice" maxlength="6" />
			<form:input path="city" id="field-city" maxlength="15" />
			<form:select path="wgGender" id="field-wgGender">
				<option value="dontcare"> Egal</option>
				<option value="female">Reine Frauenwg</option>
				<option value="male">Reine Männerwg</option>
			</form:select>
		</div>
	
    	      		
		</div>
		
		<div class="content">
			<div class="form-actions">
    			
    			<a href="#" onclick="history.go(-2)"><button class="btn btn-danger">Abbrechen</button></a>
    			<button type="submit" class="btn btn-primary">Erstellen</button>
    		</div>
				
		</div>
				  			
		</fieldset>
		</form:form>
		
            </div>
          </div>


</div>


</div>


<c:import url="template/footer.jsp" />
