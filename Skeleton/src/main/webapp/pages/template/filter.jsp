<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<form:form method="post" modelAttribute="filterForm" action="filterAds"
		id="filterForm" cssClass="form-horizontal" autocomplete="off"
		enctype="multipart/form-data">
		<fieldset>
			<table class="smalltable">
				<tr>
					<td>
						<label class="control-label" for="field-furnished">Möbliert:</label> 
						<form:checkbox	path="furnished" id="field-furnished" tabindex="1" />
					</td>
					<td>
						<label class="control-label" for="field-Laundry">Waschmachine:</label> 
						<form:checkbox	path="hasLaundry" id="field-Laundry" tabindex="2" />
					</td>
					<td>
						<label class="control-label" for="field-Dishwasher">Geschirrspüler:</label> 
						<form:checkbox	path="hasDishwasher" id="field-Dishwasher" tabindex="3" />
					</td>
					<td>
						<label class="control-label" for="field-Balcony">Balkon:</label> 
						<form:checkbox	path="hasBalcony" id="field-Balcony" tabindex="4" />
					</td>
				 </tr>
				 <tr>
				 	<td>
						<label class="control-label" for="field-smokingInside">Rauchen im Haus:</label> 
						<form:checkbox	path="smokingInside" id="field-smokingInside" tabindex="5" />
					</td>
					<td>
						<label class="control-label" for="field-pets">Sind Haustiere erwünscht/ erlaubt:</label> 
						<form:checkbox	path="hasPets" id="field-pets" tabindex="6" />
					</td>
					<td>
						<label class="control-label" for="field-wlan">Wlan:</label> 
						<form:checkbox	path="wlan" id="field-wlan" tabindex="7" />
					</td>
					<td>
						<label class="control-label" for="field-closet">Einbauschrank in zimmer:</label> 
						<form:checkbox	path="hasBuiltInCloset" id="field-closet" tabindex="8" />
					</td>
					</tr>
				 <tr>
				   	<td>
						<label class="control-label" for="field-isToBalcony">Balkonzugang vom Zimmer aus:</label> 
						<form:checkbox	path="toBalcony" id="field-isToBalcony" tabindex="9" />
					</td>
					<td>
						<label class="control-label" for="field-Cables">Kabelanschlüsse im Zimmer:</label> 
						<form:checkbox	path="hasCables" id="field-Cables" tabindex="10" />
					</td>
					<td>
						<label class="control-label" for="field-wgType">Grober Wgtyp:</label> 
						<div class="controls">
							<form:select path="wgType" id="field-wgType"
								tabindex="7">
								<option value="undef">egal</option>
								<option value="wild">eher wild</option>
								<option value="calm">eher ruhig</option>
						

							</form:select>
						</div>
					</td>
					<td>
						<label class="control-label" for="field-roomPrice">Zimmerpreis</label> 
						<form:input path="roomPrice" id="field-roomPrice" tabindex="11"
					maxlength="10" />
					</td>
				 </tr>
				  <tr>
				   	<td>
						<label class="control-label" for="field-ort">In welchem Stadt/ Dorf:</label> 
						<form:input path="ort" id="field-ort" tabindex="12"
					maxlength="10" />
					</td>
					<td>
						<label class="control-label" for="field-wgGender">Geschlechteraufteilung in der wg: </label> 
						<div class="controls">
							<form:select path="wgGender" id="field-wgGender"
								tabindex="13">
								<option value="dontcare"> Egal</option>
								<option value="female">Reine Frauenwg</option>
								<option value="male">Reine Männerwg</option>
						

							</form:select>
						</div>
					</td>
								 </tr>
				  
		
		</table>
		
		
				<button type="submit" class="btnblue">Filter</button>
			
		</fieldset>
		</form:form>
