<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>План дисциплины</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
    <link href="<c:url value='/static/css/mycss.css' />" rel="stylesheet"/>
    <script src="<c:url value='/static/js/jquery-2.2.3.js'/>"></script>
    <script src="<c:url value='/static/js/bootstrap.js'/>"></script>
    <script>
        $('input[type=file]').bootstrapFileInput();
        $('.file-inputs').bootstrapFileInput();
    </script>

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
        <h3>Данные о дисциплине</h3>
    </div>
    <!--  -->
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#panel1">Материалы по дисциплине</a></li>
        <li><a data-toggle="tab" href="#panel2">Работы по дисциплине</a></li>
    </ul>

    <div class="tab-content">
        <div id="panel1" class="tab-pane fade in active">

            <div class ="tabBelow">
                <a href="<c:url value='/work' />" class=" btn btn-default">Создать работу</a>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th>Название файла</th>
                    <th>формат</th>
                    <th>Размер</th>
                    <th>Категория материалов</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><a href="#">Реферат</a></td>
                    <td>.doc</td>
                    <td>23КБ</td>
                    <td></td>
                    <td>
                        <button type="button" class="btn btn-default">Скачать</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div id="panel2" class="tab-pane fade">
                    <div class ="tabBelow">
                        <a href="<c:url value='/work' />" class=" btn btn-default">Создать работу</a>
                    </div>
            <table class="table">
                <thead>
                <tr>
                    <th>Название работы</th>
                    <th>Номер работы</th>
                    <th>Тема работы</th>
                    <th>Срок сдачи</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Доклад</td>
                    <td>1</td>
                    <td><a href="#">Оценка безопасности системы управления сервером</a></td>
                    <td>20.07.2019</td>
                    <td>
                        <button type="button" class="btn btn-default">Скачать</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="col-sm-2 col-md-3"></div>


</body>
</html>
