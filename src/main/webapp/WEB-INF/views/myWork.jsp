<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Мои работы</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
    <script src="<c:url value='/static/js/jquery-2.2.3.js'/>"></script>
</head>
<body>
<sec:authorize access="hasRole('LECTOR')">
    <%@include file="lector/head.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('STUDENT')">
    <%@include file="student/head.jsp" %>
</sec:authorize>
<div><label>_</label></div>
<div><label>_</label></div>
<div class="col-sm-1 col-md-2"></div>
<div class="col-xs-12 col-sm-10 col-md-8">
    <h3>Мои работы</h3>
    <a class="btn btn-default" href="<c:url value='/work'/>">Создать работу</a>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th>Дисциплина</th>
                <th>Вид работы</th>
                <th>Номер работы</th>
                <th>Тема работы</th>
                <th>Скачать данные</th>
                <th>Удалить данные</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Привет</td>
                <td>отчет</td>
                <td>123</td>
                <td>Различная</td>
                <td><a class="btn btn-default" href="#">Скачать</a></td>
                <td>
                    <button class="btn btn-danger" value="">Удалить</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="col-sm-1 col-md-2"></div>

</body>
</html>