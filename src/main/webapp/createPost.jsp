<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="css/main.css">
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Создать объявление</title>

</head>
<body>
<nav>
    <div class="nav-wrapper">
        <div class="container">
            <a class="brand-logo">CarSales</a>
            <ul class="right hide-on-med-and-down">
                <c:if test="${user == null}">
                    <li><a href="<%=request.getContextPath()%>/index">Главная</a></li>
                    <li><a href="<%=request.getContextPath()%>/login.jsp">Войти</a></li>
                </c:if>
                <c:if test="${user != null}">
                    <li><a href="<%=request.getContextPath()%>/index">Главная</a></li>
                    <li><a href="<%=request.getContextPath()%>/myPosts">Мои объявления</a></li>
                    <li><a href="<%=request.getContextPath()%>/login.jsp">Выйти</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <h3 class="center-align">
            Создать объявление
        </h3>
    </div>
    <div class="row">
        <div class="col s12">
            <div class="card-panel">
                <form action="<%=request.getContextPath()%>/createPost" method="post">
                    <div class="row">
                        <div class="input-field col s3">
                            <select id="mark" name="mark">
                                <option value="0" disabled selected>марка</option>
                            </select>
                            <label>Выберете марку</label>

                        </div>
                        <div class="input-field col s3">
                            <select id="model" name="model">
                                <option value="" disabled selected>модель</option>
                            </select>
                            <label>Выберете модель</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="year" type="text" class="validate" name="year" value="1970"
                                   required pattern="^[0-9]+$">
                            <label for="year">Год выпуска</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="mileage" type="text" name="mileage" class="validate" value="0"
                                   required pattern="^[0-9]+$">
                            <label for="mileage">Пробег</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="color" type="text" name="color" class="validate"
                                   required>
                            <label for="color">цвет</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <select id="carBody" name="carBody">
                            </select>
                            <label>Выберете кузов</label>
                        </div>
                        <div class="input-field col s6">
                            <select id="transmission" name="transmission">
                            </select>
                            <label>Выберете коробку</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <select id="driveUnit" name="driveUnit">
                                <option value="Передний">Передний</option>
                                <option value="Задний">Задний</option>
                                <option value="Полный">Полный</option>
                            </select>
                            <label>Выберете привод</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="price" type="text" name="price" class="validate"
                                   required pattern="^[0-9]+$">
                            <label for="price">Цена</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <textarea id="desc" name="desc" class="materialize-textarea"
                                      required></textarea>
                            <label for="desc">Комментарий продавца</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <button class="btn waves-effect waves-light" type="submit" name="action">Добавить
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<script src="js/filter.js"></script>

<script>
    $(document).ready(function () {
        $('select').formSelect();
        loadBrands();
        loadTransmissions();
        loadCarBodies();
        $('#mark').change(function () {
            loadMarks()
        })
    });
</script>
</body>
</html>