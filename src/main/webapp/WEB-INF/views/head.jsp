<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Head</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
    <link href="<c:url value='/static/css/mycss.css' />" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="<c:url value='/static/js/bootstrap.js' />"></script>
    <script type="text/javascript" src="<c:url value="/static/js/jquery-2.2.3.js"/>"></script>



</head>
<body>
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <form:form method="POST"  commandName="userForm"  class="form-horizontal">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
        </form:form>
        <a class="navbar-brand" href="#">Project name</a>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#" onclick="loadMain('Успеваемость')">Успеваемость</a></li>
                <li><a href="#about" onclick="loadMain('Расписание')">Расписание</a>
                </li>
                <li><a href="#contact" onclick="loadMain('Дисциплины')" >Дисциплины</a></li>
                <li><a href="#contact" onclick="loadMain('Уч. план')" >Уч. план</a></li>
                <li><a href="#contact" onclick="loadMain('Мои работы')" >Мои работы</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>

</div>
<script>
    function loadMain(s){

        $( "#main" ).load( "registrationLector.jsp body" );
    }
</script>
</body>
</html>
