<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="main">
	<div class="col-sm-16">
    	<div class="panel panel-default">
        	<div class="panel-heading">
            	<h3 class="panel-title">Filter Ads</h3>
            </div>
            <div class="panel-body">
              <form:form method="post" modelAttribute="filterForm" action="filterAds"
		id="filterForm" cssClass="form-horizontal" autocomplete="off"
		enctype="multipart/form-data">
		<fieldset>
			
				<div class="controls-left">
						<label class="control-label" for="field-furnished">Möbliert:</label> 
						<div class="controls">
						<form:checkbox	path="furnished" id="field-furnished" tabindex="1" />
						</div>
					 
					 
						<label class="control-label" for="field-Laundry">Waschmachine:</label>
						<div class="controls"> 
						<form:checkbox	path="hasLaundry" id="field-Laundry" tabindex="2" />
						</div>
					 
					 
						<label class="control-label" for="field-Dishwasher">Geschirrspüler:</label> 
						<div class="controls">
						<form:checkbox	path="hasDishwasher" id="field-Dishwasher" tabindex="3" />
						</div>
					 
					 
						<label class="control-label" for="field-Balcony">Balkon:</label> 
						<div class="controls">
						<form:checkbox	path="hasBalcony" id="field-Balcony" tabindex="4" />
						</div>
					 
				  
				  
				 	 
						<label class="control-label" for="field-smokingInside">Rauchen im Haus:</label> 
						<div class="controls">
						<form:checkbox	path="smokingInside" id="field-smokingInside" tabindex="5" />
						</div>
						
						<label class="control-label" for="field-pets">Sind Haustiere erwünscht/ erlaubt:</label>
						<div class="controls"> 
						<form:checkbox	path="hasPets" id="field-pets" tabindex="6" />
						</div>
					 
					 
						<label class="control-label" for="field-wlan">Wlan:</label> 
						<div class="controls">
						<form:checkbox	path="wlan" id="field-wlan" tabindex="7" />
						</div>
					 
					 
						<label class="control-label" for="field-closet">Einbauschrank in zimmer:</label> 
						<div class="controls">
						<form:checkbox	path="hasBuiltInCloset" id="field-closet" tabindex="8" />
						</div>
						
						
					 </div>
					 <div class="controls-right">
						
					 
					 
				  
				   	 
						<label class="control-label" for="field-isToBalcony">Balkonzugang vom Zimmer aus:</label>
						<div class="controls"> 
						<form:checkbox	path="toBalcony" id="field-isToBalcony" tabindex="9" />
						</div>
					 
					 
						<label class="control-label" for="field-Cables">Kabelanschlüsse im Zimmer:</label> 
						<div class="controls">
						<form:checkbox	path="hasCables" id="field-Cables" tabindex="10" />
						</div>
					 
					 
						<label class="control-label" for="field-wgType">Grober Wgtyp:</label> 
						<div class="controls">
							<form:select path="wgType" id="field-wgType"
								tabindex="7">
								<option value="undef">egal</option>
								<option value="wild">eher wild</option>
								<option value="calm">eher ruhig</option>
						

							</form:select>
						</div>
					 
					 
						<label class="control-label" for="field-roomPrice">Zimmerpreis</label> 
						<div class="controls">
						<form:input path="roomPrice" id="field-roomPrice" tabindex="11"
					maxlength="10" />
					 	</div>
				  
				   
				   	 
						<label class="control-label" for="field-city">In welchem Stadt/ Dorf:</label> 
						<div class="controls">
						<form:input path="city" id="field-city" tabindex="12"
					maxlength="10" />
						</div>
					 
						<label class="control-label" for="field-wgGender">Geschlechteraufteilung in der wg: </label>
						 
						<div class="controls">
							<form:select path="wgGender" id="field-wgGender"
								tabindex="13">
								<option value="dontcare"> Egal</option>
								<option value="female">Reine Frauenwg</option>
								<option value="male">Reine Männerwg</option>
						

							</form:select>
						</div>
					 		<button type="submit" class="btnpink">Filter</button>
						</div>	  
				  			
		</fieldset>
		</form:form>
            </div>
          </div>


</div>


</div>
