<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Создание работы</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
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
<div class="col-sm-2 col-md-3"></div>
<div class="col-xs-12 col-sm-8 col-md-6">
    <div>
        <h3>Создание работы</h3>
    </div>
    <form id ="workForm">
        <label>Выберите дисциплину</label>
        <select class="form-control" id="discipline">
            <%--<c:forEach items="${disciplines}" var="discipline">--%>
            <%--<option value="${discipline.id}">${discipline.name}</option>--%>
            <%--</c:forEach>--%>
        </select>

        <label>Выберите вид работы</label>
        <select class="form-control" id="kindWork">
            <%--<c:forEach items="${worksKinds}"var="kindWork">--%>
            <%--<option value="${kindWork.id}">${kindWork.name}</option>--%>
            <%--</c:forEach>--%>
        </select>
        <label>Введите номер работы</label>
        <input type="number" class="form-control" id="workNumber"
               placeholder="Номер работы" required/>

        <label>Введите тему работы</label>
        <input type="txt" class="form-control" id="themeWork"
               placeholder="Тема работы" required/>






    </form>
</div>
<div class="col-sm-2 col-md-3"></div>
</body>
</html>
