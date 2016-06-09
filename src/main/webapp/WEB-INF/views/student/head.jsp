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


</head>
<body>
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <form method="POST"  commandName="userForm"  class="form-horizontal">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        </form>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="<c:url value='/student/cabinet'/>">Кабинет студента</a></li>
                <li><a href="<c:url value='/messages'/>">Сообщения</a></li>
                <li><a href="#about">Расписание</a></li>
                <li><a href="<c:url value='/student/disciplines-1' />">Дисциплины</a></li>
                <li><a href="#">Уч. план</a></li>
                <li><a href="#1">Мои работы</a></li>
                <li><a href="<c:url value='/student/recordBook' />">Электронная зачетка</a></li>
                <li><a href="<c:url value="/logout" />">Выход</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
</body>
</html>
