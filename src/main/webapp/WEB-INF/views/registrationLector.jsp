<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Registration Form</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
    <script src="<c:url value='/static/js/jquery-2.2.3.js'/>"></script>
</head>

<body>
<div class="generic-container">
    <%@include file="authheader.jsp" %>

    <div class="well lead">User Registration Form</div>

    <div class="col-sm-2 col-md-3"></div>
    <div id="textReg" class="col-xs-12 col-sm-8 col-md-6">
        <form  id="userForm" class="form-horizontal">
            <h4>Введите пожалуйста данные для регистрации</h4>

            <div>
                <input type="txt" class="form-control" id="lastName"  placeholder="Фамилия"/>
            </div>
            <div>
                <input type="txt" class="form-control" id="firstName"placeholder="Имя"/>
            </div>
            <div>
                <input type="txt" class="form-control" id="middleName"  placeholder="Отчество"/>
            </div>
            <div>
                <input type="txt" class="form-control" id="email"   placeholder="Email" />
            </div>
            <div>
                <input type="password" class="form-control" id="password"  placeholder="Пароль"/>
            </div>
            <div>
                <input type="password" class="form-control" id="repetPassword"  placeholder="Повторите пароль"/>
                <div>
                    <style id ="colorAlertPas"></style>
                    <h4 id ="alertPas"></h4>
                </div>
            </div>

            <div>

            </div>
            <div>
                <label>Ученая степень</label>
                <select id="academicDegree" class="form-control">
                    <option>Кандидат наук</option>
                    <option>Доктор наук</option>
                    <option>_</option>
                </select>

                <label>Должност</label>
                <select id="post" class="form-control">
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
                <select id="departmentOfTheUniversity" class="form-control">
                </select>
            </div>
            <div>
                <button id="submit" type="submit" class="btn btn-default">Зарегистрироваться</button>
            </div>
        </form>
    </div>
    <div class=" col-sm-2 col-md-3"></div>

</div>

<script>
    jQuery(document).ready(function($) {

        $("#userForm").submit(function(event) {

            // Disble the search button
            enableSearchButton(false);

            // Prevent the form from submitting via the browser.
            event.preventDefault();

            if(checkPassword()==true){
                searchViaAjax();
            }


        });

    });

    function searchViaAjax() {

        var user = {}
        user["firstName"] = $("#firstName").val();
        user["middleName"] = $("#middleName").val();
        user["lastName"]= $("#lastName").val();
        user["login"]= $("#email").val();
        user["password"]= $("#password").val();
        user["primaryRole"]= 'LECTOR'
        var student={}
        student['academicDegree']=$("#academicDegree").val();
        student['semester']=$("#post").val();
        student['departmentOfTheUniversity']=$("#departmentOfTheUniversity").val();
        student['userId']=user;

        $.ajax({
            type : "POST",
            contentType : "application/json",
//            url : "/epss/reg",
            data : JSON.stringify(student),
            dataType : 'json',
            timeout : 100000,
            success : function(data) {
                console.log("SUCCESS: ", data);
                display(data);
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

    function display(data) {
        var json = "<h4>Ajax Response</h4><pre>"
                + JSON.stringify(data, null, 4) + "</pre>";
        $('#feedback').html(json);
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

</script>
<div id="feedback"></div>

</body>
</html>