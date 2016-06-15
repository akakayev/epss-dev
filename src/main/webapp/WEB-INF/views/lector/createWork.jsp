<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Создание работы</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
    <script src="<c:url value='/static/js/jquery-2.2.3.js'/>"></script>
</head>
<body>
<sec:authorize access="hasRole('LECTOR')">
    <%@include file="head.jsp" %>
</sec:authorize>
<sec:authorize access="hasRole('STUDENT')">
    <%@include file="../student/head.jsp" %>
</sec:authorize>
<div><label>_</label></div>
<div><label>_</label></div>
<div class="col-sm-2 col-md-3"></div>
<div class="col-xs-12 col-sm-8 col-md-6">
    <div>
        <h3>Создание работы</h3>
    </div>
    <form id ="workForm">

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

        <label>Введите срок сдачи работы</label>
        <input type="txt" class="form-control" id="deadline"
               placeholder="Срок сдачи" required/>



        <button  id="submit" type="submit" class="btn btn-default" >Создать работу</button>

    </form>
</div>
<div class="col-sm-2 col-md-3"></div>
<script>
    jQuery(document).ready(function() {
        $("#workForm").submit(function (event) {
            enableSearchButton(false);
            event.preventDefault();
            createWork();
        });
    });
    function createWork(){
        var work = {};
        work['id']=1;
        work["disciplineId"] = ${discipline.id};
        work["workKindId"] = 1;
        work["number"] = $('#workNumber').val();
        work["theme"] = $('#themeWork').val();
        work["deadline"] = $('#deadline').val();
        console.log("SUCCESS: ", work);
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/epss/lector/addWork",
            data: JSON.stringify(work),
            dataType: 'json',
            timeout: 100000,
            success: function (data) {
                console.log("SUCCESS: ", data);
            },
            error: function (e) {
                console.log("ERROR: ", e);
                display(e);
            },
            done: function (e) {
                console.log("DONE");
                enableSearchButton(true);
            }
        });
    }
</script>
</body>
</html>