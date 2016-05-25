<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Registration Form</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
</head>

<body>
<div class="generic-container">
    <%@include file="authheader.jsp" %>

    <div class="well lead">User Registration Form</div>

    <div class="col-sm-2 col-md-3"></div>
    <div id="textReg" class="col-xs-12 col-sm-8 col-md-6">
        <form:form method="POST" modelAttribute="user" class="form-horizontal">
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

            <div>
                <form:input type="number" class="form-control" id="numberRecordBook" path="numberRecordBook"
                            placeholder="Номер зачетки"/>
            </div>
            <div>
                <label>Семестр</label>
                <form:select id="semester" path="semester" class="form-control">
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
                </form:select>

                <label>Кафедра университета</label>
                <form:select id="departmentOfTheUniversity" path="departmentOfTheUniversity" class="form-control">
                </form:select>

                <label>Группа</label>
                <form:select id="group" path="group" class="form-control">
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