
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Список сообщений</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
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
<div class="col-sm-2 col-md-3"></div>
<div id="textReg" class="col-xs-12 col-sm-8 col-md-6">
    <div>
        <h3>Данные о дисциплине</h3>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#panel1">Полученные сообщения</a></li>
        <li><a data-toggle="tab" href="#panel2">Отправленные сообщения</a></li>
    </ul>

    <div class="tab-content">
        <div id="panel1" class="tab-pane fade in active">

            <table class="table">
                <thead>
                <tr>
                    <th>Автор</th>
                    <th>Краткое описание</th>
                    <th>Сообщение</th>
                    <th>Прикрепление</th>
                    <th>Данные</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Я</td>
                    <td> Сообщение какое-нибудь</td>
                    <td><form><button type="button" class="btn btn-info " value ="3" id="txtModal" data-toggle="modal" data-target="#myModal">Сообщение</button></form></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div id="panel2" class="tab-pane fade">

            <table class="table">
                <thead>
                <tr>
                    <th>Получатель</th>
                    <th>Краткое описание</th>
                    <th>Сообщение</th>
                    <th>Прикрепление</th>
                    <th>Данные</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Я</td>
                    <td> Сообщение какое-нибудь</td>
                    <td><form><button type="button" class="btn btn-info " value ="3" id="textModal" data-toggle="modal" data-target="#myModal">Сообщение</button></form></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="col-sm-2 col-md-3"></div>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Modal Header</h4>
            </div>
            <div class="modal-body" id ="message">

            </div>
            <div class="modal-footer">
                <form><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></form>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $("#txtModal").click(function (event) {

        });
    });

    function setIdMessage(){
        var message = {};
        message["idMessage"] = $("#txtModal").val();
        $.ajax({
            type : "POST",
            contentType : "application/json",
            url : "/epss/",
            data : JSON.stringify(message),
            dataType : 'json',
            timeout : 100000,
            success : function(data) {
                console.log("SUCCESS: ", lector);
                console.log("SUCCESS: ", data);
                // alert(data.message);
            },
            error : function(e) {
                console.log("ERROR: ", e);

            },
            done : function(e) {
                console.log("DONE");
                enableSearchButton(true);
            }
        });
    }


</script>
</body>
</html>
