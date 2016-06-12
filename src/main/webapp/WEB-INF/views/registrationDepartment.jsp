<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Registration University</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
    <link href="<c:url value='/static/css/mycss.css' />" rel="stylesheet"/>
    <script src="<c:url value='/static/js/jquery-2.2.3.js'/>"></script>
</head>
<body>
<%@include file="head.jsp" %>
<div class="generic-container">
    <div class="col-sm-2 col-md-3"></div>
    <div id="textReg" class="col-xs-12 col-sm-8 col-md-6">
        <form id="universityForm">
            <h4>Введите пожалуйста данные для регистрации кафедры</h4>
            <div>
                <label>Университет</label>
                <select id="university" path="faculty" class="form-control">
                    <c:forEach items="${universities}" var="institution">
                    <option value="${institution.id}">${institution.abbreviation}</option>
                    </c:forEach>
                </select>
            </div>
            <div>
                <label>институт/факультет</label>
                <select id="faculty" path="faculty" class="form-control">
                    <c:forEach items="${faculties}" var="faculty">
                    <option value="${faculty.id}">${faculty.abbreviation}</option>
                    </c:forEach>
                </select>
            </div>

            <div>
                <label>Полное название кафедры</label>
                <input type="txt" class="form-control errorReg" id="name" placeholder="Полное название института/факультета"
                       required/>
            </div>
            <div>
                <label>Аббревиатура</label>
                <input type="txt" class="form-control errorReg" id="abbreviation" placeholder="Аббревиатура" required/>
            </div>
            <div>
                <label>Краткое описание института/факультета</label>
                <textarea class="form-control" id="shortDescription" rows="5" placeholder="Краткое описание учебного заведения"></textarea>
            </div>
            <div>
                <label>Адрес</label>
                <input type="txt" class="form-control" id="address" placeholder="Адрес" required/>
            </div>
            <div>
                <label>Координаты</label>
                <input type="txt" class="form-control" id="coordinates" placeholder="Координаты"/>
            </div>

            <div>
                <button id="submit" type="submit" class="btn btn-default" data-toggle="modal" data-target="#myModal">
                    Зарегистрировать кафедру
                </button>
            </div>
        </form>
    </div>
    <div class="col-sm-2 col-md-3"></div>
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <p id="modal"></p>
                    <a href="<c:url value='/login' />" class="btn btn-default" role="button">Перейти на вход в систему</a>
                    <a href="<c:url value='/registrationDepartment' />" class="btn btn-default" role="button">Перейти на регистрацию кафедры</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    jQuery(document).ready(function ($) {

        $("#universityForm").submit(function (event) {

            enableSearchButton(false);
            event.preventDefault();
            departmentRegAjax();
        });

        $("#university").change(function (event) {
            setIdUniversity($("#university").val());
        });
    });

    function departmentRegAjax() {

        var housing={};
        housing["address"]= $("#address").val();
        housing["coordinates"]= $("#coordinates").val();

        var department={};
        department["idInstitution"] = $("#university").val();
        department["IdFaculty"] = $("#faculty").val();
        department["name"] = $("#name").val();
        department["abbreviation"] = $("#abbreviation").val();
        department["faculty"] = $("#faculty").val();
        department["departmentDetails"]=$("#shortDescription").val();
        department["housing"]=housing;

        $.ajax({
            type : "POST",
            contentType : "application/json",
            url : "/epss/reg",
            data : JSON.stringify(department),
            dataType : 'json',
            timeout : 100000,
            success : function(data) {
                console.log("SUCCESS: ", data);
                displayRezultRegistration(data);
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

    function enableSearchButton(flag) {
        $("#submit").prop("disabled", flag);
    }

    function displayRezultRegistration(data){
        $('#modal').text(data.message);
        if(data.success == false){
            $('#namea').css(" #errorReg{border-color: #ff0000 ;}");
            $('#abbreviation').css(" #errorReg{border-color: #ff0000 ;}");
        }
        else{
            $('#name').css(" #errorReg{border-color: #ccc ;}");
            $('#abbreviation').css(" #errorReg{border-color: #ccc ;}");
        }
    }

    function setIdUniversity(id){
        var university = {};
        university["id"] = id;
        $.ajax({
            type : "GET",
            url : "/epss/getFacultyList",
            data : {id:id},
            timeout : 100000,
            success : function(data) {
                addInstitution(data);
                console.log("SUCCESS: ", university);
                console.log("SUCCESS: ", data);
            },
            error : function(e) {
                console.log("ERROR: log", e);

            },
            done : function(e) {
                console.log("DONE");
                enableSearchButton(true);
            }
        });
    }


    function addInstitution(data){//добавление элементов в select
        var institution = data;
        $("#faculty").empty();
        for(var i = 0 ; i<institution.length ; i++ ){
            $("#faculty").append("<option value ="+institution[i].id+">"+institution[i].abbreviation+"</option>");
        }
    }

</script>
</body>
</html>
