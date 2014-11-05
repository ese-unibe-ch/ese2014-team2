<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>




<form:form method="post" modelAttribute="filterForm" action="filterAdsIndex" id="filterForm" cssClass="form-horizontal" autocomplete="off" enctype="multipart/form-data">
		<fieldset>
			<div class="row">
				<label class="col-md-3" for="field-roomPrice">Maximaler Zimmerpreis</label>
					<div class="col-md-3">
						<form:input path="roomPrice" id="field-roomPrice" maxlength="6" />
					</div>
			</div>
			<div class="row">
				<label class="col-md-3" for="field-city">Stadt</label>
					<div class="col-md-3">
						<form:input path="city" id="field-city" maxlength="15" placeholder="Bsp.: Bern" />
					</div>
			</div>
		<button type="submit" class="btn btn-primary">Los!</button>
		
		</fieldset>
</form:form>

