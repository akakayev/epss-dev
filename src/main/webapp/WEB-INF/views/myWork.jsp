<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Мои работы</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
    <link href="<c:url value='/static/css/mycss.css' />" rel="stylesheet"/>
    <script src="<c:url value='/static/js/jquery-2.2.3.js'/>"></script>
    <script src="<c:url value='/static/js/bootstrap.js'/>"></script>
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
        <div class="panel-group">
            <%--<c:forEach>  для дисциплин--%>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" href="#collapse1">Дисциплина</a>
                    </h4>
                </div>
                <%--Не забыть динамически именовать id открывающиихся блоков и менять на
                 соответствующие названия адреса переходов.
                --%>
                <div id="collapse1" class="panel-collapse collapse">
                    <div class="panel-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Мои работы</th>
                                <th>Номер</th>
                                <th>Тема работы</th>
                                <th>Оценка</th>
                                <th>Врямя сдачи паботы</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <%--<c:forEach> для работ--%>
                                <tbody>
                                <tr id="1">
                                    <td class="workTr">Привет</td>
                                    <td class="workTr">я </td>
                                    <td class="workTr">разговариваю</td>
                                    <td class="workTr">сам</td>
                                    <td class="workTr">с собой</td>
                                    <td><button class="btn btn-default" onclick="">Скачать</button></td>
                                    <td><button class="btn btn-danger" onclick="">Удалить</button></td>
                               </tr>
                                </tbody>
                            <%--</c:forEach>--%>
                        </table>
                    </div>
                </div>
            </div>
            <%--</c:forEach>--%>
        </div>
    </div>
</div>
<div class="col-sm-1 col-md-2"></div>


<script type="text/javascript">
    $(".workTr").mouseover(function (event) {
        $(".workTr").parent().css({"background":"#eee","cursor":"pointer"});
    });
    $(".workTr").mouseout(function (event) {
        $(".workTr").parent().css("background","#fff");
    });
    $(".workTr").click(function (event) {
        $(".workTr").parent().id;
        window.location.href = "<c:url value='/work'/>";
    });
</script>


</body>
</html>

<!-- слева список  попыток  в попытки ввести  фреймы и снизу комментарий только для пеподавателя и кнопка
для ответа студена
-->
<!-- список -->
<!-- мои работы  номер , тема , оценка, делайн -->