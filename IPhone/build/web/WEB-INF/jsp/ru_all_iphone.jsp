<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link href="<c:url value = "/resources/css/login_button.css"/>" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
<script src="/resources/bootstrap/js/login_form.js"></script>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="MediaCenter, Template, eCommerce">
        <meta name="robots" content="all">
        
        <%@ include file="in_iphone/nav.jsp" %>
        <%@ include file="in_iphone/header.jsp" %>
        
        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
        
        <!-- Customizable CSS -->
        <link rel="stylesheet" href="resources/assets/css/main.css">
        <link rel="stylesheet" href="resources/assets/css/green.css">
        <link rel="stylesheet" href="resources/assets/css/owl.carousel.css">
        <link rel="stylesheet" href="resources/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="resources/assets/css/animate.min.css">
        <link rel="stylesheet" href="resources/css/cells_for_product.css">
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
        
       
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="container">
            <div class="col-lg-3">
                <div class="widget">
                <h1>Фильтр</h1>
                
                    
                <form action="filter.htm">
                    
                    <b><a data-toggle="collapse" style="cursor:pointer" data-target="#demo">Название таблички</a></b>
                        <ul id="demo" class="collapse">
                            <c:forEach items="${listTitle}" var="varTitle">
                                <li>
                                    <input type="checkbox" name="filter_title" value="${varTitle}">${varTitle}
                                </li>
                            </c:forEach>
                        </ul>  
                    
                    
                    <h2>Цена</h2>
                    
                    От: <input id="from" name="from" type="text" size="10" maxlength="10" onkeydown = "javascript: return ((event.keyCode>47)&&(event.keyCode<58)||(event.keyCode==8)||(event.keyCode==127))" onkeyup="doAjax()" >
                    <br><br>
                    До: <input id="to" name="to" type="text" size="10" maxlength="10" onkeydown = "javascript: return ((event.keyCode>47)&&(event.keyCode<58)||(event.keyCode==8)||(event.keyCode==127))" onkeyup="doAjax()">
                     <span id="insert"></span>
                    <hr>
                    <input  type="submit" value="Выбрать Сувениры"/>
                </form>
                </div>
            </div>          
            
         
            <div class="col-lg-9">
              
                
                
            <div class="tab-content">
            <div id="grid-view" class="products-grid fade tab-pane in active">
                
                <div class="product-grid-holder"> 
                        <c:forEach items="${listSouvenir}" var="souvenir"> 
                            <div id="del" class="content"> 
                              <div class="col-xs-12 col-sm-4 no-margin product-item-holder hover"><!--  -->      
                                  <div class="image">
                                        <img  alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/${souvenir.photo1}" width="246" height="186" />
                                    </div>
                                    
                                    <center>
                                        <b> <a  href="iphone-${souvenir.id}.htm">${souvenir.title}</a>
                                        <br>
                                        Цена: ${souvenir.price}</b>
                                    </center>
                                    <center>
                                        <a href="add-product-to-customer-basket.htm?id=${souvenir.id}" class="le-button">в корзину</a>
                                    </center>
                                    <center>
                                        <a class="btn-add-to-wishlist" href="add-product-to-wish-list.htm?id=${souvenir.id}">в понравившиеся</a>
                                        <a class="btn-add-to-compare" href="add-product-to-compare-list.htm?id=${souvenir.id}">сравнить</a>
                                    </center>
                                </div><!-- /.product-item-holder -->
                            </div>
                        </c:forEach>
                        
                        
 <!----------------------End ----------------->
                    <!-- /.row -->
                </div><!-- /.product-grid-holder -->
                <!-- /.pagination-holder -->
            </div><!-- /.products-grid #grid-view -->

            <div id="list-view" class="products-grid fade tab-pane ">
                <div class="products-list">
                    </div>
                <!-- /.products-list -->
            </div>
            <!-- /.products-grid #list-view -->

        </div><!-- /.tab-content -->
    </div><!-- /.grid-list-products -->
    
    </div>
        
         <%@ include file="in_iphone/footer.jsp" %>
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
  <!--  <script type="text/javascript">
        function doAjax(){
            $.ajax({
                url:'filter.htm',
                data:({
                    from : $('#from').val(),
                    to: $('#to').val()
                   
                }),
                success:function(data){
                        $("div.content").empty();
                        var dat=jQuery.parseJSON(data);
                        console.log(dat);
                            $('#del').append('<div class="col-xs-12 col-sm-4 product"></div>');
                          //  $('#del').append('<table>')
                        for (var index = 0; index < dat.length; index++) {
                            
                            $('.product').append('<div class="image"><img  alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/'+dat[index].photo1+'" width="246" height="186" /></div>');  
                            $('.product').append('<center><b> <a  href="iphone-'+dat[index].id+'.htm">'+dat[index].title+'</a><br>Цена:'+dat[index].price+'</b></center>');       
                            $('.product').append('<center><a href="add-product-to-customer-basket.htm?id='+dat[index].id+'&page=ru-index" class="le-button">в корзину</a></center>');                 
                            $('.product').append('<center><a class="btn-add-to-wishlist" href="add-product-to-wish-list.htm?id='+dat[index].id+'">в понравившиеся</a><a class="btn-add-to-compare" href="add-product-to-compare-list.htm?id='+dat[index].id+'">сравнить</a></center>');
                        }
                    }  
            });
        }
    </script>-->
    
    <!-- For demo purposes â can be removed on production : End -->

    <script src="http://w.sharethis.com/button/buttons.js"></script>
    </body>
   
</html>
