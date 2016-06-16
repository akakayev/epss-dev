<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Электронная зачетка</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
    <link href="<c:url value='/static/css/mycss.css' />" rel="stylesheet"/>
    <script src="<c:url value='/static/js/jquery-2.2.3.js'/>"></script>
</head>
<body>
<%@include file="head.jsp" %>
<div><label>_</label></div>
<div><label>_</label></div>
<div class="col-sm-1 col-md-2"></div>
<div class="col-xs-12 col-sm-10 col-md-8">
    <div>
        <h3>Электронная зачетка</h3>
    </div>
    <!--  -->

    <div class="panel-group" id ="recordBook">

    </div>
</div>
    <div class="col-sm-1 col-md-2"></div>
    <script>
        $(document).ready(getAcademicPlanJSON());

        function getAcademicPlanJSON() {
            $.ajax({
                type: "GET",
                url: "/epss/getRecordBook",
                timeout: 100000,
                success: function (data) {
                    console.log("SUCCESS: ", data);
                    addTable(data);
                },
                error: function (e) {
                    console.log("ERROR: log", e);
                },
                done: function (e) {
                    console.log("DONE");
                    enableSearchButton(true);
                }
            });
        }
        function addTable(data) {
            var evaluat ={"EXAM":"Экзамен","CP":"Курсовой проект","CREDIT":"Зачет","CW":"Курсовая работа"};
            for(var i=1;i<13;i++){

                $("#recordBook").append("<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'><a data-toggle='collapse' data-parent='#accordion' href='#collapse"+i+"'>Семестр "+i+"</a></h4></div><div id='collapse"+i+"' class='panel-collapse collapse'><div><table id='table"+i+"'class='table table-bordered'><thead><tr><th>Дисциплина</th><th>Вид оценивания</th><th>Оценка</th><th>Преподаватель</th><th>Дата сдачи</th></tr></thead></table></div></div>");
                if(data[i]==undefined){

                }
                else{
                    var array= data[i];
                    $("#table"+i).append("<tbody id ='tbody"+i+"'></tbody>");
                    for(var j = 0 ; j < array.length ; j++){
                        var unityDate = new Date(array[j].date);
                        $("#tbody"+i).append("<tr id = 'tr"+i+""+j+"'></tr>");
                        $("#tr"+i+""+j).append("<td>"+array[j].disciplineName+"</td>");
                        $("#tr"+i+""+j).append("<td>"+evaluat[array[j].evaluation]+"</td>");
                        $("#tr"+i+""+j).append("<td>"+array[j].score+"</td>");
                        $("#tr"+i+""+j).append("<td>"+array[j].lector+"</td>");
                        $("#tr"+i+""+j).append("<td>"+unityDate.getDate()+"-"+(unityDate.getMonth()+1)+"-"+unityDate.getFullYear()+"</td>");
                    }
                }
            }


        }
    </script>
</body>
</html>
