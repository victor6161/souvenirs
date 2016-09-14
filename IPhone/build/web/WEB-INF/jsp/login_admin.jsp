<%@page contentType="text/html" pageEncoding="UTF-8" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> </title>
        <link href="<c:url value = "/resources/css/login_button.css"/>" rel="stylesheet">
    </head>
    <body>
        <div style="position: absolute; top:40%;left:40%">
            <form action="j_spring_security_check" id="login" method="POST">


                <input id="username" name="username" type="text" placeholder="Логин" autofocus required><br><br>   
                <input id="password" name="password"  type="password" placeholder="Пароль" required><br><br> 


                <div style="position: absolute; left:30%">
                    <input type="submit" id="submit" value="ВОЙТИ">
                </div>

            </form>
        </div>
    </body>
</html>
