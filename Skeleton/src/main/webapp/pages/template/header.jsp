<!DOCTYPE html>
<html lang="en">
<http use-expressions="true">



    	<meta charset="UTF-8">

    	<title>About Princesses and Castles</title>

    	<link rel="stylesheet" type="text/css" href="css/stylesheet.css" media="all"/>
    	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen" />
    	<script type="text/javascript"  src="dn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
    	<script src="js/login.js"></script>
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

    	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    	<!--[if lt IE 9]>
    	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    	<![endif]-->
<!--   WASTE!
    	<style>
        	body {
         	   padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
        	}
    	</style>
    -->
    
   

</head>
<body>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

   	  <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css"/>  
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>  
      <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>  
        
      <script>  
      $(document).ready(function() {  
        $("#datepicker").datepicker();  
      });  
      </script>
      
       <script>  
      $(document).ready(function() {  
        $("#datepicker2").datepicker();  
      });  
      </script>

<security:authorize access="isAnonymous()">
    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/Skeleton" color="#3fa9f5">Flattie</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
           <li class="active"><a href="/Skeleton">Home</a></li>
            <li><a href="unfilteredAds" id="navads"><span>Suche Zimmer</span><em></em></a>
            <li><a href="placead" id="navpads"><span>Vermiete Zimmer</span><em></em></a>
            <li><a href="register">Register</a></li>
            <li><a href="#" id="loginButton"><span>Login</span><em></em></a>
                <div style="clear:both"></div>
                <div id="loginBox">                
                    <form id="loginForm" name="loginForm" action="<c:url value='j_spring_security_check' />" method="POST">
                        <fieldset id="body">
                            <fieldset>
                                <label for="email">Email Address</label> 
                                <input type="text" name="j_username" id="email" placeholder="Email" />
                            </fieldset>
                            <fieldset>
                                <label for="password">Password</label>
                                <input type="password" name="j_password" id="password" placeholder="Password" />
                            </fieldset>
                            <input type="submit" id="login" value="Sign in" />
                            <label for="checkbox"><input type="checkbox" id="checkbox" />Remember me</label>
                        </fieldset>
                        <span><a href="#">Forgot your password?</a></span>
                    </form>
                </div></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
</security:authorize>	

<security:authorize access="isAuthenticated()">
	    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/Skeleton">Flattie</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="/Skeleton">Home</a></li>
            <li><a href="unfilteredAds" id="navads"><span>Suche Zimmer</span><em></em></a>
            <li><a href="placead" id="navpads"><span>Vermiete Zimmer</span><em></em></a>
            <li><a href="myprofile">Profil</a></li>
            <li><a href="myinbox">Inbox <span class="badge"> ${messageNmbr} </span></a></li>
            <li><a href="myads">Ads</a></li>
            <li><a href="appointments">Besichtigungstermine</a></li>
            <li><a href="bookmarks">Favoriten</a></li>
            <li><a href="logout">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
</security:authorize>	

<div id="push_header"></div>
<div id="push_content"></div>


<div id="container_background">
	<div class="container">