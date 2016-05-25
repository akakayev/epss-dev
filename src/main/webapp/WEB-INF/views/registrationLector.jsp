<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Registration Form</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>

<body>
<div class="generic-container">
    <%@include file="authheader.jsp" %>

    <div class="well lead">User Registration Form</div>
    <div class="col-sm-2 col-md-3"></div>
    <div id="textReg" class="col-xs-12 col-sm-8 col-md-6">
        <form:form method="POST"  commandName="user" modelAttribute="user" class="form-horizontal">
            <h4>Введите пожалуйста данные для регистрации</h4>

            <div>
                <form:input type="txt" class="form-control" id="lastName" path="lastName" placeholder="Фамилия"/>
            </div>
            <div>
                <form:input type="txt" class="form-control" id="firstName" path="firstName" placeholder="Имя"/>
            </div>
            <div>
                <form:input type="txt" class="form-control" id="middleName" path="middleName" placeholder="Отчество"/>
            </div>
            <div>
                <form:input type="txt" class="form-control" id="Email" placeholder="Email" path="Email"/>
            </div>
            <div>
                <form:input type="txt" class="form-control" id="password" path="password" placeholder="Пароль"/>
            </div>
            <div>
                <form:input type="txt" class="form-control" id="repetPassword" path="repetPassword"
                            placeholder="Повторите пароль"/>
            </div>

            <label>Ученая степень</label>
            <form:select id="academicDegree" path="academicDegree" class="form-control">
                <option>Кандидат наук</option>
                <option>Доктор наук</option>
                <option>_</option>
            </form:select>
            <div>
                <label>Должност</label>
                <form:select id="post" path="post" class="form-control">
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
                </form:select>

                <label>Кафедра университета</label>
                <form:select id="departmentOfTheUniversity" path="departmentOfTheUniversity" class="form-control">
                    <%-- в селекте университетов выбран университет , аяксом отправляется
                    выбранный университет , список университетов выдадут --%>
                </form:select>
            </div>
            <div>
                <input type="submit" value="Submit" />
            </div>
        </form:form>
    </div>
    <div class=" col-sm-2 col-md-3"></div>

</div>
</body>
</html>