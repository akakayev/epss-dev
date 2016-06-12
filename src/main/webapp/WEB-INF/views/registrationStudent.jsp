<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Registration Form</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"/>
    <link href="<c:url value='/static/css/mycss.css' />" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
    <script src="<c:url value='/static/js/jquery-2.2.3.js'/>"></script>
    <script src="<c:url value='/static/js/ajax_university.js'/>"></script>

</head>

<body>
<%@include file="head.jsp" %>
<div class="generic-container">
    <div class="col-sm-2 col-md-3"></div>
    <div id="textReg" class="col-xs-12 col-sm-8 col-md-6">
        <form  id="userForm" class="form-horizontal">
            <h4>Введите пожалуйста данные для регистрации студента</h4>
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
                <label>Фамилия</label>
                <input type="txt" class="form-control" id="lastName"  placeholder="Фамилия" required/>
            </div>
            <div>
                <label>Имя</label>
                <input type="txt" class="form-control" id="firstName" placeholder="Имя" required/>
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
                <label>Зачетка</label>
                <style id ="recordBookNumberStyle" type="text/css"></style>
                <input type="number" class="form-control" id="recordBookNumber"
                            placeholder="Номер зачетки" required/>
                <style>
                    input[type=number]::-webkit-inner-spin-button,
                    input[type=number]::-webkit-outer-spin-button {
                    -webkit-appearance: none;
                    margin: 0;
                }
                </style>
            </div>
            <div>
                <label>Семестр</label>
                <select id="semester"  class="form-control">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                </select>
                <div>
                <label>Группа</label>
                <select id="group" path="group" class="form-control">
                    <c:forEach items="${groups}" var="group">
                    <option value="${group.id}">${group.groupName}</option>
                    </c:forEach>
                </select>
                </div>
            </div>
                <label></label>
                <label></label>
                <label></label>
            <div>
                <button id="submit" type="submit" class="btn btn-default" data-toggle="modal" data-target="#myModal">Зарегистрироваться</button>
            </div>
            <div id="json"></div>
            <div id="feedback"></div>
        </form>
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
                    <a href="<c:url value='/registrationStudent' />" class="btn btn-default" role="button">Зарегистрировать нового участника</a>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    jQuery(document).ready(function($) {

        $("#userForm").submit(function(event) {

            enableSearchButton(false);
            event.preventDefault();
            if(checkPassword()==true){
                studentRegAjax();
            }


        });

        $("#university").change(function (event) {
            setIdUniversity($("#university").val(),"faculty");
        });

    });


    function studentRegAjax() {

        var user = {};
        user["firstName"] = $("#firstName").val();
        user["middleName"] = $("#middleName").val();
        user["lastName"]= $("#lastName").val();
        user["login"]= $("#login").val();
        user["password"]= $("#password").val();
        user["primaryRole"]= 'STUDENT';
        var student={};
        student['recordBookNumber']=$("#recordBookNumber").val();
        student['semester']=$("#semester").val();
        student['group']=$("#group").val();
        student['user']=user;
        $.ajax({
            type : "POST",
            contentType : "application/json",
            url : "/epss/reg",
            data : JSON.stringify(student),
            dataType : 'json',
            timeout : 100000,
            success : function(data) {
                console.log("SUCCESS: ", data);
                display(data,"#feedback");
                display(student,"#json");
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

    function checkInput(){
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
            $('#recordBookNumberStyle').text("#recordBookNumber{border-color: #ff0000 ;}");
        }
        else{
            $('#loginStyle').text(" #login{border-color: #ccc ;}");
            $('#recordBookNumberStyle').text(" #recordBookNumber{border-color: #ccc ;}");
        }
    }

</script>
</body>
</html>