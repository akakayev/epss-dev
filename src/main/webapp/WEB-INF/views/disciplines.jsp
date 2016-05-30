<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Список дисциплин</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
    <script src="<c:url value='/static/js/jquery-2.2.3.js'/>"></script>
</head>
<body>

<sec:authorize access="hasRole('ADMIN')">
   <th width="100"></th>
</sec:authorize>
<%--<%@include file="head.jsp" %>--%>

<div class="list-group">
    <a href="/student/disciplines-disciplines.id" class="list-group-item">disciplines.name</a>
</div>

</body>
</html>
