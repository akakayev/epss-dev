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
<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <a class="navbar-brand" href="<c:url value='/login' />">Система поддержки учебного процесса</a>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Зарегистрированные университеты<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">СевГУ</a></li>
                        <li><a href="#">КФУ</a></li>
                    </ul>
                </li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Регистрация<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="<c:url value='/registrationStudent' />" >Регитрация студента</a></li>
                        <li><a href="<c:url value='/registrationLector' />">Регистрация для преподавателя</a></li>
                        <li><a href="#">Регистрация учебного заведения</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
<script>

</script>
</body>
</html>
