<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Академический план</title>
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
<div class=" col-sm-1 col-md-2"></div>
<div class="panel-group col-xs-12 col-sm-10 col-md-8 " id="accordion">
    <div>
        <h3>Академический план</h3>
    </div>

</div>
<div class=" col-sm-1 col-md-2"></div>
<script>
    $(document).ready(getAcademicPlanJSON());

    function getAcademicPlanJSON() {
        $.ajax({
            type: "GET",
            url: "/epss/getPlan",
            timeout: 100000,
            success: function (data) {
                console.log("SUCCESS: ", data);
                parserBigJSON(data,1);

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

    function parserBigJSON(data){

        for(var i=1;i<13;i++){
            var array= data[i];

            $("#accordion").append("<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'><a data-toggle='collapse' data-parent='#accordion' href='#collapse"+i+"'>Семестр "+i+"</a></h4></div><div id='collapse"+i+"' class='panel-collapse collapse'><div><table class='table table-bordered'><thead><tr><th>Название предмета</th><th>Количество часов</th><th>Количество лекций</th><th>Количество лабораторных</th><th>Количество практик</th> <th>Вид оценивания</th><th>Оценка идет в диплом</th></tr></thead><tbody id ='tbody"+i+"'></tbody></table></div></div>");

            for(var j = 0 ;j<array.length;j++){
                var evaluat ={"EXAM":"Экзамен","CP":"Курсовой проект","CREDIT":"Зачет","CW":"Курсовая работа"};
                $("#tbody"+i).append("<tr id='tr"+i+""+j+"'>");
                $("#tr"+i+""+j).append("<td>"+array[j].discipline+"</td>");
                $("#tr"+i+""+j).append("<td>"+array[j].hours+"</td>");
                $("#tr"+i+""+j).append("<td>"+array[j].lectures+"</td>");
                $("#tr"+i+""+j).append("<td>"+array[j].labs+"</td>");
                $("#tr"+i+""+j).append("<td>"+array[j].seminars+"</td>");
                $("#tr"+i+""+j).append("<td>"+evaluat[array[j].evaluation]+"</td>");
                $("#tr"+i+""+j).append("<td>"+(array[j].diploma==0?"Не идет":"Идет")+"</td></tr>");

            }
        }
    }


</script>
</body>
</html>
