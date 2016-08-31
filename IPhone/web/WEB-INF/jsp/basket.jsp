<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link href="<c:url value = "/resources/css/login_button.css"/>" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
<script src="/resources/bootstrap/js/login_form.js"></script>


<!DOCTYPE html>
<html>
    <head>
        <%@ include file="in_iphone/nav.jsp" %>
        <%@ include file="in_iphone/header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

   


        <!-- Customizable CSS -->
        <link rel="stylesheet" href="resources/assets/css/main.css">
        <link rel="stylesheet" href="resources/assets/css/blue.css">
        <link rel="stylesheet" href="resources/assets/css/owl.carousel.css">
        <link rel="stylesheet" href="resources/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="resources/assets/css/animate.min.css">

        <!-- Demo Purpose Only. Should be removed in production -->
        <link rel="stylesheet" href="resources/assets/css/config.css">




        <!-- Demo Purpose Only. Should be removed in production : END -->

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>

        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">

        <!-- Favicon -->
        <link rel="shortcut icon" href="resources/assets/images/favicon.ico">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css "/>">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap-theme.css "/>">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap-theme.min.css "/>">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css "/>">


        <title>Basket</title>
    </head>
    <body>


        <div class="container">
            <h1>Basket</h1>
            <div class="row"> </div>
            <div class="col-lg-9"> 
                <div class="tab-content">
                    <div id="grid-view" class="products-grid fade tab-pane in active">
                        <div class="product-grid-holder"> 
                            <c:forEach items="${arrayList}" var="souvenir"> 
                                <div id="del" class="content"> 
                                    <div class="col-xs-12 col-sm-4 no-margin product-item-holder hover"><!--  -->      
                                        <div class="image">
                                            <img  alt="" src="resources/assets/images/products/${souvenir.photo1}" width="246" height="186" />
                                        </div>
                                        <center>
                                            <b>
                                                <a  href="iphone-${souvenir.id}.htm">${souvenir.title}</a>
                                                <br>
                                                Price: ${souvenir.price}
                                                <p>
                                                    Amount:
                                                    <INPUT TYPE="NUMBER" MIN="0" MAX="20" STEP="1" VALUE="1" SIZE="6">
                                                </p>
                                            </b>
                                        </center>  
                                    </div>

                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="widget">
            <div class="row">
                <div style="margin:10px"> 
                <form>
                    <h3>Customer:</h3>
                    <h5>Enter your full name:</h5>
                    <input type="text" name="username"><br><br>
                    <h5>Phone:</h5>
                    <input type="text" name="phone"><br><br>
                    <h5>e-mail:</h5>
                    <input type="text" name="email"><br><br>
                    <input type="submit" class="btn"  value="order it">
                </form>
               </div>
            </div>
            </div>
        </div>



    </body>
    <%@ include file="in_iphone/footer.jsp" %>
</html>
