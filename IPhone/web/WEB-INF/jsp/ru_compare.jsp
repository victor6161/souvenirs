<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="MediaCenter, Template, eCommerce">
        <meta name="robots" content="all">

        <title>MediaCenter - Responsive eCommerce Template</title>

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
        
        <!-- Customizable CSS -->
        <link rel="stylesheet" href="resources/assets/css/main.css">
        <link rel="stylesheet" href="resources/assets/css/green.css">
        <link rel="stylesheet" href="resources/assets/css/owl.carousel.css">
        <link rel="stylesheet" href="resources/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="resources/assets/css/animate.min.css">

        <!-- Demo Purpose Only. Should be removed in production -->
        <link rel="stylesheet" href="resources/assets/css/config.css">

        <link href="resources/assets/css/green.css" rel="alternate stylesheet" title="Green color">
        <link href="resources/assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
        <link href="resources/assets/css/red.css" rel="alternate stylesheet" title="Red color">
        <link href="resources/assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
        <link href="resources/assets/css/navy.css" rel="alternate stylesheet" title="Navy color">
        <link href="resources/assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
        <!-- Demo Purpose Only. Should be removed in production : END -->

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
        
        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
        
        <!-- Favicon -->
        <link rel="shortcut icon" href="resources/assets/images/favicon.ico">

        <!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
        <!--[if lt IE 9]>
            <script src="resources/assets/js/html5shiv.js"></script>
            <script src="resources/assets/js/respond.min.js"></script>
        <![endif]-->
    </head>
<body>
    
  

        
<!-- ============================================================= TOP NAVIGATION ============================================================= -->
<%@include file="in_iphone/nav.jsp" %>        
<!-- ============================================================= TOP NAVIGATION : END ============================================================= -->       <!-- ============================================================= HEADER ============================================================= -->
<%@include file="in_iphone/header.jsp" %>
<!-- ============================================================= HEADER : END ============================================================= --><div class="animate-dropdown"><!-- ========================================= BREADCRUMB ========================================= -->

 
  
    
    
    
<%@include file="in_iphone/dropdown le-dropdown.jsp" %>

<div class="row" id="content">
                        <div class="table-responsive">
                            <div class="col-lg-12">
                                <table class="table table-striped table-bordered table-hover table-condensed">
                                    <thead>
                                            <tr>
                                                <th></th>
                                                <c:forEach var="o" items="${object}"> 
                                                <td><center><img  alt="" src="resources/assets/images/products/${o.photo1}" width="246" height="186" /> </center> </td>
                                                    
                                                </c:forEach>
                                            </tr>
                                        
                                             <tr>
                                                <th>title</th> 
                                                <c:forEach var="o" items="${object}">
                                                    <td><center>${o.title}</center></td>
                                                </c:forEach>
                                            </tr>
                                             <tr>
                                                <th>price</th> 
                                                <c:forEach var="o" items="${object}">
                                                    <td><center>${o.price}</center></td>
                                                </c:forEach>
                                            </tr>
                                             <tr>
                                                <th>lacquer</th> 
                                                <c:forEach var="o" items="${object}">
                                                    <td><center>${o.lacquer}</center></td>
                                                </c:forEach>
                                            </tr>
                                            <tr>
                                                <th>fastening</th> 
                                                <c:forEach var="o" items="${object}">
                                                    <td><center>${o.fastening}</center></td>
                                                </c:forEach>
                                            </tr>
                                            <tr>
                                                <th>bevel</th> 
                                                <c:forEach var="o" items="${object}">
                                                    <td><center>${o.bevel}</center></td>
                                                </c:forEach>
                                            </tr>
                                            <tr>
                                                <th>length</th> 
                                                <c:forEach var="o" items="${object}">
                                                    <td><center>${o.length}</center></td>
                                                </c:forEach>
                                            </tr>
                                            <tr>
                                                <th>weight</th> 
                                                <c:forEach var="o" items="${object}">
                                                    <td><center>${o.weight}</center></td>
                                                </c:forEach>
                                            </tr>
                                            <tr>
                                                <th>thickness</th> 
                                                <c:forEach var="o" items="${object}">
                                                    <td><center>${o.thickness}</center></td>
                                                </c:forEach>
                                            </tr>
                                            
                                            <tr>
                                                <th></th>
                                                <c:forEach var="o" items="${object}">
                                                <td><center><a style="cursor: pointer" href="del-product-from-compare-list.htm?id=${o.id}">Убрать из сравнения</a></center></td>
                                                </c:forEach>
                                            </tr>
                                            
                                    </thead>
                            </table>

                            </div>
                        </div>
                    </div>   
                
             

    <!-- For demo purposes â can be removed on production : End -->

    <!-- JavaScripts placed at the end of the document so the pages load faster -->
    <script src="resources/assets/js/jquery-1.10.2.min.js"></script>
    <script src="resources/assets/js/jquery-migrate-1.2.1.js"></script>
    <script src="resources/assets/js/bootstrap.min.js"></script>
    <script src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
    <script src="resources/assets/js/gmap3.min.js"></script>
    <script src="resources/assets/js/bootstrap-hover-dropdown.min.js"></script>
    <script src="resources/assets/js/owl.carousel.min.js"></script>
    <script src="resources/assets/js/css_browser_selector.min.js"></script>
    <script src="resources/assets/js/echo.min.js"></script>
    <script src="resources/assets/js/jquery.easing-1.3.min.js"></script>
    <script src="resources/assets/js/bootstrap-slider.min.js"></script>
    <script src="resources/assets/js/jquery.raty.min.js"></script>
    <script src="resources/assets/js/jquery.prettyPhoto.min.js"></script>
    <script src="resources/assets/js/jquery.customSelect.min.js"></script>
    <script src="resources/assets/js/wow.min.js"></script>
    <script src="resources/assets/js/scripts.js"></script>

    <!-- For demo purposes â can be removed on production -->
    
    <script src="resources/assets/switchstylesheet/switchstylesheet.js"></script>
    
    <script>
        $(document).ready(function(){ 
            $(".changecolor").switchstylesheet( { seperator:"color"} );
            $('.show-theme-options').click(function(){
                $(this).parent().toggleClass('open');
                return false;
            });
        });

        $(window).bind("load", function() {
           $('.show-theme-options').delay(2000).trigger('click');
        });
    </script>
    <!-- For demo purposes â can be removed on production : End -->

    <script src="http://w.sharethis.com/button/buttons.js"></script>

</body>
</html>