
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



<c:import url="template/header.jsp" />

<!-- TEST WITH BOOTSTRAP PANELS -->

<c:if test="${not empty infoMessage}">
<div class="alert alert-success" role="alert"><font color="006600" size="3"> ${infoMessage}</font></div>
</c:if>

      <div class="row">
      <div class="col-sm-3">
      </div>
        <div class="col-sm-6">
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h2 class="panel-title"><a href="unfilteredAds">Ich suche ein Zimmer!</font></a></h2>
            </div>
            <div class="panel-body">
           		 <div class="filler_big">
            		<c:import url="template/smallFilter.jsp"/> 
            	</div>
            </div>
          </div>
          <div class="panel panel-info">
            <div class="panel-heading">
              <h2 class="panel-title"><a href="placead">Ich möchte ein Zimmer vermieten!</font></a></h2>
            </div>
            <div class="panel-body">
             	<a href="placead">
             		<div class="filler_small"></div>
             	</a>
            </div>
          </div>
        </div><!-- /.col-sm-4 -->
      
      </div>
      
      
		
    		


<c:import url="template/footer.jsp" />

