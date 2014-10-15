<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />


<h1>Post your Ad!</h1>


<form:form method="post" modelAttribute="newAdForm" action="enlistad" id="newAdForm" cssClass="form-horizontal"  autocomplete="off">
    	<fieldset>
        	<legend>Creating a new Advertisement!</legend>
        	
        	<table>
        		<tr>
        			<td><label class="control-label" for="field-adTitle">Advertisement title</label>
        			<td><div class="controls">
                	<form:input path="title" id="field-adTitle" tabindex="1" maxlength="35" placeholder="Advertisement Title"/>
            	</div>
        		</td>
        		<tr>
        			<td><label class="control-label" for="field-adDescription">Advertisement description</label>
        			<td><div class="controls">
            		<form:input path="description" id="field-adDescription" tabindex="1" maxlength="120" placeholder="Advertisement Description"/>
            	</div>
        		</td>
        		<tr>
        			<td><label class="control-label" for="field-adLimited">Is it limited</label>
        			<td><div class="controls">
            		<form:checkbox path="isLimited"	name="isLimited" id="field-adLimited" />
            	</div>
        		</td>
        		<tr>
        			<td><div class="control-label" for="field-adRooms">Rooms</div>
        			<td><div class="controls">
            		<form:select path="rooms" name="rooms" id="field-adRooms">
            			<option value="1">1</option>            			
            			<option value="1.5">1.5</option>
            			<option value="2">2</option>
            			<option value="2.5">2.5</option>
            			<option value="3">3</option>
            			<option value="3.5">3.5</option>
            			<option value="4">4</option>
            			<option value="4.5">4.5</option>
            			<option value="5">5</option>
            			<option value="5.5">5.5</option>
            			<option value="6">6</option>
            		</form:select>
            	</div>
        		</td>
        		<tr>
        			<td><div class="control-label" for="field-adPrice">Price</div>
        			<td><div class="controls">
            		<form:input path="price" id="field-adPrice" tabindex="1" maxlength="5" placeholder="Advertisements Price/Month" />
            	</div>
        		</td>
        		<tr>
        			<td><div class="control-label" for="field-adSpace">Space</div>
        			<td><div class="controls">
            		<form:input path="space" id="field-adSpace" tabindex="1" maxlength="3" placeholder="Rooms Space in square-meters" />
            	</div>
        		</td>
        			
        	</table>
            	
        	<div class="form-actions">
            	<button type="submit" class="btn btn-primary">Create</button>
            	<button type="button" class="btn">Cancel</button>
        	</div>
   		</fieldset>

</form:form>



	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />
