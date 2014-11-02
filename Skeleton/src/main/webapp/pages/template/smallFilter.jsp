<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>




<form:form method="post" modelAttribute="filterForm" action="filterAdsIndex"
		id="filterForm" cssClass="form-horizontal" autocomplete="off"
		enctype="multipart/form-data">
		<fieldset>
		
		<h3><label class="btn btn-warning btn-lg" ><font color="000000"><form:input path="roomPrice" id="field-roomPrice" maxlength="6" /></font> Maximaler Zimmerpreis</label></h3>
		<h3><label class="btn btn-warning btn-lg" ><font color="000000"><form:input path="city" id="field-city" maxlength="15" /></font>Stadt</label></h3>
		
		<button type="submit" class="btn btn-success btn-lg btn-block">Los!</button>
		
		</fieldset>
		</form:form>