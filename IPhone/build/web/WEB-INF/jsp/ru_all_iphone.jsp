<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
            <script src="assets/js/html5shiv.js"></script>
            <script src="assets/js/respond.min.js"></script>
        <![endif]-->
    </head>
    
    
    
    
<body>

    
    <div class="wrapper">
        <!-- ============================================================= TOP NAVIGATION ============================================================= -->

<!-- ============================================================= TOP NAVIGATION ============================================================= -->
<%@include file="in_iphone/nav.jsp" %>        
<!-- ============================================================= TOP NAVIGATION : END ============================================================= -->       <!-- ============================================================= HEADER ============================================================= -->
<%@include file="in_iphone/header.jsp" %>
<!-- ============================================================= HEADER : END ============================================================= --><div class="animate-dropdown"><!-- ========================================= BREADCRUMB ========================================= -->
  
        
<!-- ============================================================= HEADER : END ============================================================= --><div class="animate-dropdown"><!-- ========================================= BREADCRUMB ========================================= -->






<!-- ========================================= BREADCRUMB : END ========================================= --></div>     <section id="category-grid">
    <div class="container">
     
        <!-- ========================================= SIDEBAR ========================================= -->
        <div class="col-xs-12 col-sm-3 no-margin sidebar narrow">

            <!-- ========================================= PRODUCT FILTER ========================================= -->
<div class="widget">
    
     <h1>Filter</h1>
     <form action="filter.htm">
                    
                    <b><a data-toggle="collapse" style="cursor:pointer" data-target="#demo">Sort</a></b>
                        <ul id="demo" class="collapse">
                            <c:forEach items="${listTitle}" var="varTitle">
                                <li>
                                    <input type="checkbox" name="filter_title" value="${varTitle}">${varTitle}
                                </li>
                            </c:forEach>
                        </ul>  
                    
                    
                    <h2>Price</h2>
                    
                    From: <input id="from" name="from" type="text" size="10" maxlength="10" onkeydown = "javascript: return ((event.keyCode>47)&&(event.keyCode<58)||(event.keyCode==8)||(event.keyCode==127))" onkeyup="doAjax()" >
                    <br><br>
                    To: <input id="to" name="to" type="text" size="10" maxlength="10" onkeydown = "javascript: return ((event.keyCode>47)&&(event.keyCode<58)||(event.keyCode==8)||(event.keyCode==127))" onkeyup="doAjax()">
                     <span id="insert"></span>
                    <hr>
                    <input  type="submit" value="Choose"/>
                </form>
    
</div><!-- /.widget -->
<!-- ========================================= PRODUCT FILTER : END ========================================= -->

<!-- ========================================= FEATURED PRODUCTS : END ========================================= -->
        </div>
                                <!--ok-->
        <!-- ========================================= SIDEBAR : END ========================================= -->

        <!-- ========================================= CONTENT ========================================= -->

        <div class="col-xs-12 col-sm-9 no-margin wide sidebar">





            <section id="gaming">
    <div class="grid-list-products">
        <!--<h2 class="section-title">Gaming</h2>-->
        
        <div class="control-bar">
<!--        <div id="popularity-sort" class="le-select" >
                <select data-placeholder="sort by popularity">
                    <option value="1">1-100 players</option>
                    <option value="2">101-200 players</option>
                    <option value="3">200+ players</option>
                </select>
            </div>
            
            <div id="item-count" class="le-select">
                <select>
                    <option value="1">24 per page</option>
                    <option value="2">48 per page</option>
                    <option value="3">32 per page</option>
                </select>
            </div>-->

            <div class="grid-list-buttons">
                <ul>
                    <li class="grid-list-button-item active"><a data-toggle="tab" href="#grid-view"><i class="fa fa-th-large"></i> Grid</a></li>
                    <li class="grid-list-button-item "><a data-toggle="tab" href="#list-view"><i class="fa fa-th-list"></i> List</a></li>
                </ul>
            </div>
        </div><!-- /.control-bar -->
                                
        <div class="tab-content">
            <div id="grid-view" class="products-grid fade tab-pane in active">
                
                <div class="product-grid-holder">
                    <div class="row no-margin">
                       
                       
                        

          <!------------***************--------------**********-->   
          
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
                                       <a href="add-product-to-customer-basket.htm?id=${souvenir.id}" class="le-button">Add To Cart</a>
                                        
                                    </center>
                                    <center>
                                        <a class="btn-add-to-wishlist" href="add-product-to-wish-list.htm?id=${souvenir.id}">Add To Wishlist</a>
                                        <a class="btn-add-to-compare" href="add-product-to-compare-list.htm?id=${souvenir.id}">Add To Compare</a>
                                    </center>
                                </div><!-- /.product-item-holder -->
                            </div>
                        </c:forEach>
                        
 <!----------------------End ----------------->
                        
                        
                        
  


                    </div><!-- /.row -->
                </div><!-- /.product-grid-holder -->
                
                <div class="pagination-holder">
                    <div class="row">
                        
                        <div class="col-xs-12 col-sm-6 text-left">
                            <ul class="pagination ">  
                               
                                <c:forEach var="i" begin="1" end="${kol_vo_page}">
                                                <c:choose>
                                                    <c:when test="${i == page}">
                                                        <li class="current" ><a href="ru-index.htm?page_nomber=${i}"><c:out value="${i}"/></a></li>
                                                    </c:when>                                                  
                                                    <c:otherwise>
                                                        <li><a href="ru-index.htm?page_nomber=${i}"><c:out value="${i}"/></a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                     
                                </c:forEach>   
                                
<!--                                <li class="current" ><a href="index.htm?page=1">1</a></li>
                                <li><a href="index.htm?page=2">2</a></li>
                                <li><a href="index.htm?page=3">3</a></li>
                                <li><a href="index.htm?page=4">4</a></li>
                                <li><a href="index.htm?page=5">5</a></li>-->
                                <!--<li><a href="#">next</a></li>-->
                            </ul>
                        </div>

                        <div class="col-xs-12 col-sm-6">
                            <div class="result-counter">
                                tt<!--Показано <span> ${kol_vo_on_page*page_nomber-kol_vo_on_page+1} - ${kol_vo_on_page*page_nomber} </span> из <span>${kol_vo_prod}</span> найденых.-->
                            </div>
                        </div>

                    </div> 
                            <!--/.row--> 
                </div>
                <!-- /.pagination-holder -->
            </div><!-- /.products-grid #grid-view -->

            <div id="list-view" class="products-grid fade tab-pane ">
                <div class="products-list">
                    
                    
       
                    
               
 <c:forEach items="${listSouvenir}" var="iphone">
                        
                  
                    <div class="product-item product-item-holder">
                        <div class="ribbon red"><span>sale</span></div> 
                        <div class="ribbon blue"><span>new!</span></div>
                        <div class="row">
                            <div class="no-margin col-xs-12 col-sm-4 image-holder">
                                <div class="image">
                                    <img alt="" src="resources/assets/images/blank.gif" data-echo="resources/assets/images/products/${iphone.photo1}"  width="246" height="186"/>
                                </div>
                            </div><!-- /.image-holder -->
                            <div class="no-margin col-xs-12 col-sm-5 body-holder">
                                <div class="body">
                                    <div class="label-discount green">-10% sale</div>
                                    <div class="title">
                                        <a href="iphone-${iphone.id}.htm">${iphone.title}</a>
                                    </div>
                                        
                                        <!--<div class="brand"></div>-->
                                  
                                    <div class="addto-compare">
                                        <a class="btn-add-to-compare" href="add-product-to-compare-list.htm?id=${iphone.id}">add to compare list</a>
                                    </div>
                                </div>
                            </div>
                            <div class="no-margin col-xs-12 col-sm-3 price-area">
                                <div class="right-clmn">
<!--                                    <div class="price-current">$1199.00</div>
                                    <div class="price-prev">$1399.00</div>-->
                                    <div class="availability"><label>availability:</label><span class="available">  in stock</span></div>
                                    <a class="le-button" href="add-product-to-customer-basket.htm?id=${iphone.id}">add to cart</a>
                                    <a class="btn-add-to-wishlist" href="add-product-to-wish-list.htm?id=${iphone.id}">add to wishlist</a>
                                </div>
                            </div>
                        </div>
                    </div>

                      </c:forEach> 
                    
                    </div>
                <!-- /.products-list -->
                    
         

            </div>
            <!-- /.products-grid #list-view -->

        </div><!-- /.tab-content -->
    </div><!-- /.grid-list-products -->

</section><!-- /#gaming -->            
        </div><!-- /.col -->
        <!-- ========================================= CONTENT : END ========================================= -->    
    </div><!-- /.container -->
    
    
    
    
    
    
    
</section><!-- /#category-grid -->      <!-- ============================================================= FOOTER ============================================================= -->


<!--f-->


<%@include file="in_iphone/footer.jsp" %>


<!-- ============================================================= FOOTER : END ============================================================= -->   </div><!-- /.wrapper -->

    <!-- For demo purposes â can be removed on production -->
    

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