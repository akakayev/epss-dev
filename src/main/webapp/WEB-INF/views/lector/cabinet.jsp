<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>lector page</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
    <script src="<c:url value='/static/js/jquery-2.2.3.js'/>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            var date = new Date();
            $(".date").text(date.getDate() + "." + (date.getMonth() + 1) + "." + date.getFullYear());
            switch (date.getDay()) {
                case 0 :
                    $(".day").text("воскресенье");
                    break;
                case 1 :
                    $(".day").text("понедельник");
                    break;
                case 2 :
                    $(".day").text("вторник");
                    break;
                case 3 :
                    $(".day").text("среда");
                    break;
                case 4 :
                    $(".day").text("четверг");
                    break;
                case 5 :
                    $(".day").text("пятница");
                    break;
                case 6 :
                    $(".day").text("суббота");
                    break;
            }
        });

    </script>
</head>
<body>
<div class="generic-container">
    <%@include file="head.jsp" %>

    <%--${lector.user.firstName}--%>
    <%--${lector.position}--%>

    <div class="col-sm-1 col-md-2"></div>
    <div id="textReg" class="col-xs-12 col-sm-8 col-md-8">
        <div>
            <label>_</label>
        </div>
        <div>
            <label>_</label>
        </div>
        <div>
            <h3>Кабинет преподавателя</h3>
        </div>
        <div class="hidden-xs col-sm-5 col-md-5">
            <img src="<c:url value='/static/img/photo.jpg'/>"/>
        </div>
        <div class="col-xs-12 col-sm-5 col-md-5">
            <div class="visible-xs">
                <div><small>День недели: </small><h3 class = "day"></h3></div>
                <div><small>Дата: </small><h4 class = "date"></h4></div>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>№</th>
                        <th>Время</th>
                        <th>Название пары</th>
                        <th>Аудитория</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>8.15</td>
                        <td>БД</td>
                        <td>420</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="visible-xs"><img src="<c:url value='/static/img/photo.jpg'/>"/></div>
            <div>
                <label>Фамилия : ${lector.user.lastName}</label>
            </div>
            <div>
                <label>Имя : ${lector.user.firstName}</label>
            </div>
            <div>
                <label>Отчество : ${lector.user.middleName}</label>
            </div>
            <div>
                <label>Электронная почта : ${lector.user.login}</label>
            </div>
            <div>
                <label>Ученая степень : ${lector.degree}</label>
            </div>
            <div>
                <label>Должност : ${lector.position}</label>
            </div>
            <div>
                <label>Кафедра университета : ${lector.departmentName}</label>
            </div>
        </div>
        <div class=" hidden-xs col-sm-2 col-md-2">
            <div><small>День недели: </small><h3 class = "day"></h3></div>
            <div><small>Дата: </small><h4 class = "date"></h4></div>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>№</th>
                    <th>Время</th>
                    <th>Название пары</th>
                    <th>Аудитория</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>8.15</td>
                    <td>БД</td>
                    <td>420</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class=" col-sm-1 col-md-2"></div>
</div>
</body>
</html>
