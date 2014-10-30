
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



<c:import url="template/headerindex.jsp" />

<!-- TEST WITH BOOTSTRAP PANELS -->
      <div class="row">
        <div class="col-sm-6">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h2 class="panel-title"><a href="ads">I'm looking for an Ad!</a></h3>
            </div>
            <div class="panel-body">
            	<a href="ads">
              		<div class="filler_big">
              		</div>
              	</a>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h2 class="panel-title"><a href="placead">I'd like to place an Ad!</a></h3>
            </div>
            <div class="panel-body">
             	<a href="placead">
             		<div class="filler_small"></div>
             	</a>
            </div>
          </div>
        </div><!-- /.col-sm-4 -->
        <div class="col-sm-6">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h2 class="panel-title"><a href="roomies">I'm looking for Roomies!</a></h3>
            </div>
            <div class="panel-body">
            	<a href="roomies">
              		<div class="filler_big">
              		</div>
              	</a>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h2 class="panel-title"><a href="placeyourself">I'd like to get roomed!</a></h3>
            </div>
            <div class="panel-body">
            	<a href="placeyourself">
              		<div class="filler_small"></div>
            		</div>
            	</a>
          </div>
        </div><!-- /.col-sm-4 -->
      </div>
      
      
		
    		


<c:import url="template/footer.jsp" />

