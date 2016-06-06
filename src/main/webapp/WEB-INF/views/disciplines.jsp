<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Список дисциплин</title>
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
<div>
    <label>_</label>
</div>
<div>
    <label>_</label>
</div>
<div class="col-sm-2 col-md-3"></div>
<div class="col-xs-12 col-sm-8 col-md-6">
    <div>
        <h3>Список дисциплин</h3>
    </div>
    <div class="list-group">
        <p>1 дисциплина</p>
        <a href="<c:url value="/discipline" />">Дисциплина</a>
        <%--<c:forEach items="${disciplines}" var="discipline">--%>
            <%--<a href="#/student/disciplines-${discipline.id}" class="list-group-item">${discipline.name}</a>--%>
        <%--</c:forEach>--%>
    </div>
</div>
<div class="col-sm-2 col-md-3"></div>
</body>
</html>
