<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Registration Form</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
    <script src="<c:url value='/static/js/jquery-2.2.3.js'/>"></script>
</head>

<body>
<%@include file="head.jsp" %>
<div class="generic-container">
    <div class="col-sm-2 col-md-3"></div>
    <div id="textReg" class="col-xs-12 col-sm-8 col-md-6">

        <form  id="userForm" class="form-horizontal">
            <h4>Введите пожалуйста данные для регистрации преподавателя</h4>

            <div>
                <label>Фамилия</label>
                <input type="txt" class="form-control" id="lastName"  placeholder="Фамилия" required/>
            </div>
            <div>
                <label>Имя</label>
                <input type="txt" class="form-control" id="firstName"placeholder="Имя" required/>
            </div>
            <div>
                <label>Отчество</label>
                <input type="txt" class="form-control" id="middleName"  placeholder="Отчество" required/>
            </div>
            <div>
                <label>Электронная почта</label>
                <style id ="loginStyle" type="text/css"></style>
                <input type="email" class="form-control" id="login"   placeholder="Email" required/>
            </div>
            <div>
                <label>Пароль</label>
                <input type="password" class="form-control" id="password"  placeholder="Пароль" required/>
            </div>
            <div>
                <label>Повторите пароль</label>
                <input type="password" class="form-control" id="repetPassword"  placeholder="Повторите пароль" required/>
                <div>
                    <style id ="colorAlertPas"></style>
                    <h4 id ="alertPas"></h4>
                </div>
            </div>

            <div>
                <label>Ученая степень</label>
                <select id="academicDegree" class="form-control">
                    <option>Кандидат наук</option>
                    <option>Доктор наук</option>
                    <option>_</option>
                </select>

                <label>Должност</label>
                <select id="position" class="form-control">
                    <option>Аспирант</option>
                    <option>Ассистент</option>
                    <option>Ведущий научный сотрудник</option>
                    <option>Главный научный сотрудник</option>
                    <option>Доктор</option>
                    <option>Доцент</option>
                    <option>Младший научный сотрудник</option>
                    <option>Научный сотрудник</option>
                    <option>Преподаватель</option>
                    <option>Профессор</option>
                    <option>Старший преподаватель</option>
                    <option>Стажер</option>
                    <option>Старший научный сотрудник</option>
                </select>

                <label>Кафедра университета</label>
                <select id="departmentOfTheUniversity"  class="form-control">
                    <c:forEach items="${departments}" var="department">
                        <option value="${department.id}">${department.name}</option>
                    </c:forEach>
                </select>

            </div>
                <label></label>
                <label></label>
                <label></label>
            <div>
                <button id="submit" type="submit" class="btn btn-default" data-toggle="modal" data-target="#myModal"3>Зарегистрироваться</button>
            </div>
        </form>
        <div id="json"></div>
        <div id="feedback"></div>

    </div>
    </div>
    <div class=" col-sm-2 col-md-3"></div>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <p id="modal"></p>
                <a href="<c:url value='/login' />" class="btn btn-default" role="button">Перейти на вход в систему</a>
                <a href="<c:url value='/registrationLector' />" class="btn btn-default" role="button">Зарегистрировать нового участника</a>
            </div>
        </div>
    </div>
</div>

<script>
    jQuery(document).ready(function($) {

        $("#userForm").submit(function(event) {

            // Disble the search button
            enableSearchButton(false);

            // Prevent the form from submitting via the browser.
            event.preventDefault();

            if(checkPassword()==true){
                lectorRegAjax();
            }


        });

    });

    function lectorRegAjax(){

        var user = {};
        user["firstName"] = $("#firstName").val();
        user["middleName"] = $("#middleName").val();
        user["lastName"]= $("#lastName").val();
        user["login"]= $("#login").val();
        user["password"]= $("#password").val();
        user["primaryRole"]= 'LECTOR';
        var lector={};
        lector['degree']=$("#academicDegree").val();
        lector['position']=$("#position").val();
        lector['departmentId']=$("#departmentOfTheUniversity").val();
        lector['user']=user;

        $.ajax({
            type : "POST",
            contentType : "application/json",
             url : "/epss/regLector",
            data : JSON.stringify(lector),
            dataType : 'json',
            timeout : 100000,
            success : function(data) {
                console.log("SUCCESS: ", data);
                display(data,"#feedback");
                display(lector,"#json");
                displayRezultRegistration(data);
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

    function enableSearchButton(flag) {
        $("#submit").prop("disabled", flag);
    }

    function display(data,id) {
        var json = "<h4>Ajax Response</h4><pre>"
                + JSON.stringify(data, null, 4) + "</pre>";
        $(id).html(json);
    }


    function checkPassword(){
        var pas = $('#password').val();
        var rPas = $('#repetPassword').val();
        if((pas != rPas)&(pas != "")){
            $('#alertPas').text("Пароль не совпадает с проверкой или не заполнен!!!");
            $('#colorAlertPas').text("#alertPas{color:red;}");
            return false;
        }
        else{
            $('#alertPas').text("");
            $('#colorAlertPas').text("");
            return true;
        }
    }

    function displayRezultRegistration(data){
        $('#modal').text(data.message);
        if(data.success == false){
            $('#loginStyle').text(" #login{border-color: #ff0000 ;}");
        }
        else{
            $('#loginStyle').text(" #login{border-color: #ccc ;}");
        }
    }

</script>

</body>
</html>