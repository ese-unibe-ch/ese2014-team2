<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />



<div class="main">
	<div class="col-sm-16">
    	<div class="panel panel-default">
        	<div class="panel-heading">
            	<h3 class="panel-title">Filter Ads</h3>
            </div>
            <div class="panel-body">
            
      
              <form:form method="post" modelAttribute="filterForm" action="saveCustomFilter"
		id="filterForm" cssClass="form-horizontal" autocomplete="off"
		enctype="multipart/form-data">
		<fieldset>
		
				     
			     
  				<div class="row">
				  <div class="col-lg-5">
				    <div class="input-group">
				                				
        					<h3><label class="btn btn-primary btn-lg btn-block" ><form:checkbox path="furnished" id="field-furnished" />Möbliert</label></h3>
							<h3><label class="btn btn-primary btn-lg btn-block" ><form:checkbox	path="hasLaundry" id="field-Laundry" />Waschmachine</label></h3>
							<h3><label class="btn btn-primary btn-lg btn-block" ><form:checkbox	path="hasDishwasher" id="field-Dishwasher" />Geschirrspüler</label></h3>
							<h3><label class="btn btn-primary btn-lg btn-block" ><form:checkbox	path="hasBalcony" id="field-Balcony"/>Balkon</label></h3>
							<h3><label class="btn btn-primary btn-lg btn-block" ><form:checkbox	path="smokingInside" id="field-smokingInside"/> Rauchen im Haus</label></h3>
							<h3><label class="btn btn-primary btn-lg btn-block" ><form:checkbox	path="hasPets" id="field-pets" />Haustiere erlaubt</label></h3>
							<h3><label class="btn btn-primary btn-lg btn-block" ><form:checkbox	path="wlan" id="field-wlan" />Wlan</label></h3>

										
    
				    </div><!-- /input-group -->
				  </div><!-- /.col-lg-6 -->
				  <div class="col-lg-5">
				    <div class="input-group">
				      		<h3><label class="btn btn-primary btn-lg btn-block" ><form:checkbox	path="hasBuiltInCloset" id="field-closet"/>Einbauschrank im Zimmer</label></h3>
				      		<h3><label class="btn btn-primary btn-lg btn-block" ><form:checkbox	path="toBalcony" id="field-isToBalcony"/>Balkonzugang vom Zimmer</label></h3>
				      		<h3><label class="btn btn-primary btn-lg btn-block" ><form:checkbox	path="hasCables" id="field-Cables"/>Kabelanschluss im Zimmer</label></h3>
				      		<h3><label class="btn btn-primary btn-lg btn-block" >
				      		<font color="000000"> <form:select path="wgType" id="field-wgType">
								<option value="undef">egal</option>
								<option value="wild">eher wild</option>
								<option value="calm">eher ruhig</option>
						

							</form:select> </font> Grober Wg Typ</label></h3>
							
				      		<h3><label class="btn btn-primary btn-lg btn-block" ><font color="000000"><form:input path="roomPrice" id="field-roomPrice" maxlength="6" /></font> Maximaler Zimmerpreis</label></h3>
				      		<h3><label class="btn btn-primary btn-lg btn-block" ><font color="000000"><form:input path="city" id="field-city" maxlength="15" /></font>Stadt</label></h3>
				      		<h3><label class="btn btn-primary btn-lg btn-block" ><font color="000000"><form:select path="wgGender" id="field-wgGender"
								tabindex="13">
								<option value="dontcare"> Egal</option>
								<option value="female">Reine Frauenwg</option>
								<option value="male">Reine Männerwg</option>
						

							</form:select></font>Geschlechteraufteilung in der WG</label></h3>
				      		
				      			<button type="submit" class="btn btn-success btn-lg btn-block">Filter</button>
				    </div><!-- /input-group -->
				  </div><!-- /.col-lg-6 -->
				</div><!-- /.row -->
				
			
	 				
					
				  			
		</fieldset>
		</form:form>
		
            </div>
          </div>


</div>


</div>


<c:import url="template/footer.jsp" />
