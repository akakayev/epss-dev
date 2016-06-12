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
            <h4>Введите пожалуйста данные для регистрации института/факультета</h4>
            <div>
                <label>Учебное заведение</label>
                <select id="institution" path="group" class="form-control">
                    <c:forEach items="${universities}" var="institution">
                        <option value="${institution.id}">${institution.abbreviation}</option>
                    </c:forEach>
                </select>
            </div>

            <div>
                <label>Полное название института/факультета</label>
                <input type="txt" class="form-control errorReg" id="name" placeholder="Полное название института/факультета"
                       required/>
            </div>
            <div>
                <label>Аббревиатура</label>
                <input type="txt" class="form-control errorReg" id="abbreviation" placeholder="Аббревиатура" required/>
            </div>
            <div>
                <label>Градация</label>
                <select id="gradation" class="form-control">
                    <option value="FACULTY">Факультет</option>
                    <option value="INSTITUTE">Институт</option>
                    <option value="OTHER">Другое</option>
                </select>
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
                    Зарегистрировать институт/факультет
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
            facultyRegAjax();
        });
    });

    function facultyRegAjax() {




        var housing={};
        housing["address"]= $("#address").val();
        housing["coordinates"]= $("#coordinates").val();

        var faculties={};
        faculties["name"] = $("#fullTitle").val();
        faculties["abbreviation"] = $("#abbreviation").val();
        faculties["gradation"] = $("#gradation").val();
        faculties["institution"] = $("#institution").val();
        faculties["departmentDetails"]=departmentDetails;
        faculties["housing"]=housing;
        console.log("SUCCESS: ", faculties);

        $.ajax({
            type : "GET",
            contentType : "application/json",
            url : "/epss/addFaculty",
            data : JSON.stringify(facultie),
            dataType : 'json',
            timeout : 100000,
            success : function(data) {
                console.log("SUCCESS: ", data);
                displayResultRegistration(data);
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

    function displayResultRegistration(data){
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

</script>
</body>
</html>
