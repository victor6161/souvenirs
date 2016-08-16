<%@page contentType="text/html" pageEncoding="UTF-8" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css "/>">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap-theme.css "/>">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap-theme.min.css "/>">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css "/>">

        <script type="text/javascript" src="/resources/bootstrap/js/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="/resource/bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/admin.css "/>">
        <title>JSP Page</title>
    </head>

    <body>

        <div class="row" id="header">


            <div class="row">
                <div class="col-lg-10"> 

                </div>
                contact@gmail.com<br>
                <div class="col-lg-10"></div>
                +375 29 255-88-88
            </div>



            <div class="row">
                <div class="col-lg-10"></div>
                <form action="index.htm">
                    <input type="submit"  value="Выйти">
                </form>
            </div>
        </div>

        <div class="row" id="content">
            <div class="table-responsive">
                <div class="col-lg-12">
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                            <tr>
                                <th>id</th>
                                <th>title</th>
                                <th>lacquer</th>
                                <th>fastening</th>
                                <th>bevel</th>
                                <th>length</th>
                                <th>weight</th>
                                <th>thickness</th>
                                <th>price</th>
                                <th>photo1</th>
                                <th>photo2</th>
                                <th>photo3</th>
                                <th>photo4</th>
                                <th>description</th>   
                            </tr>
                        </thead>
                        <tbody>
                        <form action="generatePDF.htm" method="POST" accept-charset="UTF-8" >
                        
                            <c:forEach var="o" items="${objects}">
                                <tr>
                                    <td>${o.id} <input type="checkbox" name="print" value="${o.id}"></td>
                                    <td>${o.title}</td>
                                    <td>${o.lacquer}</td>
                                    <td>${o.fastening}</td>
                                    <td>${o.bevel}</td>
                                    <td>${o.length}</td>
                                    <td>${o.weight}</td>
                                    <td>${o.thickness}</td>
                                    <td>${o.price}</td>
                                    <td>${o.photo1}</td>
                                    <td>${o.photo2}</td>
                                    <td>${o.photo3}</td>
                                    <td>${o.photo4}</td>
                                    <td>${o.description}</td>
                                </tr>
                            </c:forEach>
                           
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <div class="row" id="buttons">

            <div class="col-lg-5">
                <div class="row">
                       <!-- Название предприятия: <input type="text" name="factory" maxlength="30"   ><br><br>-->
                        <input type="submit" value="Сделать предложение">
                            
                        </form>
                     


                </div>
                
            </div>
            <div class="col-lg-2"></div>
            <div class="col-lg-5">
                <div class="row">
                    <form method="POST" action="uploadFile.htm" enctype="multipart/form-data">
                        <input type="file" name="file"> <br>
                        <input type="submit" value="Добавить Сувенир">
                    </form>
                </div>
            </div>



        </div>



        <div class="row" id="footer">

            <img src="resources/jpg/eftech.png" alt="eftech"><br>

        </div>


    </body>

</html>