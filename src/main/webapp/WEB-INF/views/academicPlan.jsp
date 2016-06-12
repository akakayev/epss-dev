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
<div class="col-xs-1 col-sm-2 col-md-3"></div>
<div class="panel-group col-xs-10 col-sm-8 col-md-6 " id="accordion">
    <div>
        <h3>Академический план</h3>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                    Семестр 1</a>
            </h4>
        </div>
        <div id="collapse1" class="panel-collapse collapse ">
            <div class="">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Название предмета</th>
                        <th>Количество часов</th>
                        <th>Количество лекций</th>
                        <th>Количество лабораторных</th>
                        <th>Количество практик</th>
                        <th>Вид оценивания</th>
                        <th>Оценка идет в диплом</th>
                    </tr>
                    </thead>
                    <tbody>


                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>
<div class="col-xs-1 col-sm-2 col-md-3"></div>
<script>
    $(document).ready(getAcademicPlan());

    function getAcademicPlan(id){
        var departmentId = id;
        $.ajax({
            type : "GET",
            contentType : "application/json",
            url : "/epss/getPlan",
            data : JSON.stringify(departmentId),
            dataType : 'json',
            timeout : 100000,
            success : function(data) {
                console.log("SUCCESS: ", departmentId);
                console.log("SUCCESS: ", data);

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
