<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Создание работы</title>
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



        <div class="form-group">
            <label> Выберите вид загрузки файла</label>
            <p><label>
                <input id = "checkboxLoad" type="checkbox"  checked> Использовать файл / ссылку
            </label></p>
            <input type="file"  id="fileLoad" placeholder="выберите файл" required />
            <input type="txt" class="form-control " id="hrefLoad"  placeholder="Введите ссылку"  disabled="true" required />
        </div>

        <button id="submit" id="submit" type="submit" class="btn btn-default" >Создать работу</button>

    </form>
</div>
<div class="col-sm-2 col-md-3"></div>
<script>
    jQuery(document).ready(function($){
        $("#checkboxLoad").click(function(event){
            if($("#checkboxLoad").prop("checked")){
                $('#hrefLoad').prop('disabled', true);
                $('#fileLoad').prop('disabled', false);
            }
            else{
                $('#hrefLoad').prop('disabled', false);
                $('#fileLoad').prop('disabled', true);
            }
        });

        $("#submit").submit(function(event){

        });
    });

    function createWork(){
        var work={};

        work["discipline"] =  $('#discipline').val();
        work["kindWork"] =  $('#kindWork').val();
        work["workNumber"] =  $('#workNumber').val();
        work["themeWork"] =  $('#themeWork').val();
        work["data"] = getData();
        console.log("SUCCESS: ", work);

        $.ajax({
            type : "POST",
            contentType : "application/json",
            url : "",
            data : JSON.stringify(work),
            dataType : 'json',
            timeout : 100000,
            success : function(data) {
                console.log("SUCCESS: ", data);


            },
            error : function(e) {
                console.log("ERROR: ", e);
                display(e);
            },
            done : function(e) {
                console.log("DONE");
                enableSearchButton(true);
            }
        });
    }

    function getData(){
        var data;
        if($("#checkboxLoad").prop("checked")){
            data=$('#fileLoad').val();
        }
        else{
            data=$('#hrefLoad').val();
        }
        return data;
    }

</script>
</body>
</html>
