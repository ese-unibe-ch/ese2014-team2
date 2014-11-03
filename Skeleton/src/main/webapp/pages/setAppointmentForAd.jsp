<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:import url="template/header.jsp" />

 <head>
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
     href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
  </head>
  <body>
  
    <script type="text/javascript"
     src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js">
    </script> 
    <script type="text/javascript"
     src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js">
    </script>
    <script type="text/javascript"
     src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
    </script>
    <script type="text/javascript"
     src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
    </script>
    
 <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Setze einen Termin/ mehrere Termine für die Besichtigung</h3>
  </div>
  <div class="panel-body">
   <form:form method="post" modelAttribute="appointmentForm" action="setAppointmentAndInform"
		id="appointmentForm" cssClass="form-horizontal" autocomplete="off"
		enctype="multipart/form-data">
		<fieldset>
		
		<form:hidden path="adId"  value="${ad.id }" />
		
    <div id="datetimepicker" class="input-append date">
      <form:input type="text" data-format="MM/dd/yyyy" path="appointmentDate"></form:input>
      <span class="add-on">
        <i data-date-icon="icon-calendar"></i>
      </span>
    </div>
    
    
  <div id="timepicker1" class="input-append">
    <form:input data-format="hh:mm" type="text" path="startTimes"></form:input>
    <span class="add-on">
      <i data-time-icon="icon-time" data-date-icon="icon-calendar">
      </i>
    </span>
  </div>

    
 
  <div id="timepicker2" class="input-append">
    <form:input data-format="hh:mm" type="text" path="endTimes"></form:input>
    <span class="add-on">
      <i data-time-icon="icon-time" data-date-icon="icon-calendar">
      </i>
    </span>
  </div>
  
  <div>
  <label class="control-label"
						for="field-Mesasge"><font size="10">Weitere infos für die : </font></label>
						<div class="controls">
							<form:textarea rows="10" cols="300" path="additionalInfosForTheVisitors"
								id="field-Message" />
						</div>
  </div>

  
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
      pickDate: false
    });
  });
</script>
 <script type="text/javascript">
  $(function() {
    $('#timepicker2').datetimepicker({
      pickDate: false
    });
  });
</script>
    
    <button type="submit" class="btn btn-success btn-lg btn-block">Setze die Daten!</button>
		
		</fieldset>
		</form:form>
  </div>
</div>
  
  
  </body>


		
	
		
		
<c:import url="template/footer.jsp" />

