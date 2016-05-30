<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>План дисциплины</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
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
    <div><h3>План дисциплины </h3></div>
    <div>
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                            Материалы по дисциплине
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in">
                    <div class="panel-body">
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
                                <td><button type="button" class="btn btn-default">Скачать</button></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                            Работы по дисциплине
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">
                        <form action="" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <input type="file" cdata-filename-placement="inside" id="file">
                                <input type="submit" class=" btn btn-default" id ="loadFile" value="Создать работу">
                            </div>
                        </form>
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
                                <td><button type="button" class="btn-default">Скачать</button></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-sm-2 col-md-3"></div>


</body>
</html>
