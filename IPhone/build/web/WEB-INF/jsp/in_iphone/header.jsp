<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link href="<c:url value = "/resources/css/login_button.css"/>" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
<script src="/resources/bootstrap/js/login_form.js"></script>


<header>
    
    <div class="container no-padding">
        
        <div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
            <!-- ============================================================= LOGO ============================================================= -->
<div class="logo">
    <a href="index.htm">
        <img alt="vmc_and_hmc" src="resources/assets/images/logo_lion.jpg" width="75" height="105"/>
        
    </a>
</div><!-- /.logo -->
<!-- ============================================================= LOGO : END ============================================================= -->     </div><!-- /.logo-holder -->

        <div class="col-xs-12 col-sm-12 col-md-6 top-search-holder no-margin">
            <div class="contact-row">
    <div class="phone inline">
        <i class="fa fa-phone"></i>  <span class="le-color">+375 29 255-88-88</span>
    </div>
    <div class="contact inline">
        
        <i class="fa fa-envelope"></i> <span class="le-color">contact@gmail.com</span>
    </div>
    <div class="contact inline">
       <script type="text/javascript" src="http://www.skypeassets.com/i/scom/js/skype-uri.js"></script>
            <div id="SkypeButton_Call_marketing_dm_1">
             <script type="text/javascript">
             Skype.ui({
             "name": "chat",
             "element": "SkypeButton_Call_marketing_dm_1",
             "participants": ["marketing_dm"]
             });
             </script>
            </div>
    </div>
                <div class="login_form">
                    <form action="user.htm"   id="login" >                    
                        <input id="customer" name="customer" type="text" placeholder="Логин"  >   
                        <input id="password" name="password" type="password" placeholder="Пароль" required>
                        
                        <input type="submit"  value="Вход">
                        <span id="customer_name">${customer_name}</span>
                    </form>
                </div>
                                   
</div><!-- /.contact-row -->
<!-- ============================================================= SEARCH AREA ============================================================= -->

<!-- ============================================================= SEARCH AREA : END ============================================================= -->      </div><!-- /.top-search-holder -->

        <div class="col-xs-12 col-sm-12 col-md-3 top-cart-row no-margin">
            <div class="top-cart-row-container">
                 <div class="wishlist-compare-holder">
                     <div class="wishlist ">
                           <a href="wishlist.htm"><i class="fa fa-heart"></i> wishlist <span class="value">${wishlistCart.numberOfItems}</span> </a>
        </div>
        <div class="compare">
            <a href="compare.htm"><i class="fa fa-exchange"></i> compare <span class="value"></span> </a>
        
        </div>
    </div>

    <!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->
  
    <div class="top-cart-holder dropdown animate-dropdown">
       
        <div class="basket">
            
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <div class="basket-item-count">
                    <span class="count">${cart.numberOfItems}</span>
                    <img src="resources/assets/images/icon-cart.png" alt="" />
                </div>

                <div class="total-price-basket"> 
                    <span class="lbl">your cart:</span>
                    <span class="total-price">
                        <span class="sign">$</span><span class="value">${total_price}</span>
                    </span>
                </div>
            </a>

            <ul class="dropdown-menu">
               
<c:forEach var="hmc" items="${cart.items}">
                <li>
                    <div class="basket-item">
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 no-margin text-center">
                                <div class="thumb">
                                    <img alt="" src="resources/assets/images/products/${hmc.product.photo1}" />
                                </div>
                            </div>
                            <div class="col-xs-8 col-sm-8 no-margin">
                                <div class="title">${hmc.product.model}</div>
                                <div class="price">${hmc.product.cost} </div>
                                <div class="price">${hmc.quantity} units</div>
                            </div>
                        </div>
                        <!--<a class="close-btn" href="del-from-basket.htm?id=${hmc.product.id}&page=index"></a>-->
                        <a class="close-btn" href="del-from-basket.htm?id=${hmc.product.id}"></a>
                    </div>
                </li>
</c:forEach>

                <li class="checkout">
                    <div class="basket-item">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <a href="basket.htm" class="le-button inverse">View cart</a>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <a href="#" class="le-button">Checkout</a>
                                <!--<a href="checkout.html" class="le-button">Checkout</a>-->
                            </div>
                        </div>
                    </div>
                </li>

            </ul>
        </div> 
                    <!--/.basket--> 
              </div>
    
    <!-- /.top-cart-holder -->
</div>
                    
                    <!-- /.top-cart-row-container -->
<!-- ============================================================= SHOPPING CART DROPDOWN : END ============================================================= -->       </div><!-- /.top-cart-row -->

 

    </div><!-- /.container -->
    
      
</header>