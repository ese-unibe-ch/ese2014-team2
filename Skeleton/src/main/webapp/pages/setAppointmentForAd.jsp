<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:import url="template/header.jsp" />
 
    <link rel="stylesheet" type="text/css" media="screen" href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
    <script type="text/javascript"  src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js"> </script> 
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js"> </script>
    <script type="text/javascript" src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js"> </script>
    <script type="text/javascript" src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js"> </script>
    
   	<form:form method="post" modelAttribute="appointmentFinderForm" action="setAppointmentAndInform" id="appointmentFinderForm" cssClass="form-horizontal" autocomplete="off" enctype="multipart/form-data">
		<c:forEach items="${adAppointments}" var="app"> 
	 		 <input type="hidden" name="adAppointmentIds" value="${app}" />	
	 	</c:forEach>			
			
		<form:hidden path="adId"  value="${ad.id }" />
		
		<legend>Setze einen Termin</legend>
				
		<c:set var="appointmentDateErrors"><form:errors path="appointmentDate"/></c:set>
			<div class="row">
				<div class="col-sm-2 col-md-2">
					<label>Datum:</label>
				</div>
				
				<div class="col-sm-4 col-md-6">
					<div id="datetimepicker" class="input-append date">
      					<form:input class="add-on" type="text" data-format="dd/MM/yyyy" path="appointmentDate"></form:input>
    				</div>
				</div>
			</div>
   
   		<c:set var="startTimeErrors"><form:errors path="startTime"/></c:set>
   				<div class="row">
					<div class="col-sm-2 col-md-2">
						<label>Beginn:</label>
					</div>
					
					<div class="col-sm-4 col-md-6">
						 <div id="timepicker1" class="input-append">
    						<form:input class="add-on" data-format="hh:mm" type="text" path="startTime"></form:input>
  						</div>
					</div>
				</div>
    
    
    			<div class="row">
					<div class="col-sm-2 col-md-2">
						<label>Ende (Open end, falls leer):</label>
					</div>
					
					<div class="col-sm-4 col-md-6">
						<div id="timepicker2" class="input-append">
							<form:input class="add-on" data-format="hh:mm" type="text" path="endTime"></form:input>
  						</div>
  					</div>
				</div>
  
				<div class="row">
					<div class="col-sm-6 col-md-8">
						<br>
						 <label>Weitere infos für die Besichtigung:</label>
					</div>
				</div>
				
				<c:set var="additionalInfosForTheVisitors"><form:errors path="appointmentDate"/></c:set>
				<div class="row">
					<div class="textareabig">
						<form:textarea rows="10" cols="300" path="additionalInfosForTheVisitors" id="field-Message" /> 
						<form:errors path="additionalInfosForTheVisitors" cssClass="help-inline" element="span"/> <br>
						<form:errors path="appointmentDate" cssClass="help-inline" element="span"/> <br>
						<form:errors path="startTime" cssClass="help-inline" element="span"/> <br>
				
					</div>
				</div>
				<div class="row">
					<div class="form-actions">
						<a href="#" onclick="history.go(-2)"><button class="btn btn-danger">Zurück</button></a>
    					<button type="submit" class="btn btn-primary btn-lg" onclick="this.disabled=true;this.form.submit();">Setze die Daten!</button>
					</div>
				</div>
	</form:form>
	
	
  <script type="text/javascript">
  $(function() {
    $('#datetimepicker').datetimepicker({
      pickTime: false
    });
  });
</script>
    
   <script type="text/javascript">
  $(function() {
    $('#timepicker1').datetimepicker({
      pickDate: false,
      pickSeconds: false
    });
  });
</script>
 <script type="text/javascript">
  $(function() {
    $('#timepicker2').datetimepicker({
      pickDate: false,
      pickSeconds: false
    });
  });
</script>
 <script>  
    $('#myForm').one('submit', function() {
    $(this).find('input[type="submit"]').attr('disabled','disabled');
});</script>
  
 
 
		
	
		
		
<c:import url="template/footer.jsp" />