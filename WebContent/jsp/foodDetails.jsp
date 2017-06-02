<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/ordering/css/jquery-weui.css">
    <link rel="stylesheet" href="/ordering/css/weui.css ">
    <link rel="stylesheet" href="/ordering/css/mycss.css ">
    <script src="/ordering/js/jquery-2.1.4.js"></script>
    <script src="/ordering/js/jquery-weui.js "></script>
    <script scr="/ordering/js/weixin-1.2.0.js"></script>
    <script src="/ordering/js/swiper.js "></script>
    <title></title>
</head>
<body ontouchstart>
    <div class="weui_tab">
        <div class="back">
            <a href="/ordering/foodsList">
                <img src="/ordering/image/back.png " alt="">
            </a>
            <span> 商品详情</span>
        </div>
        <div class="weui_tab_bd">
            <div class="swiper-container">
                <div class="swiper-wrapper">
               		<c:forEach var="image" items="${requestScope.food.images}">
               			<c:if test="${!image.listImage}">
		                    <div class="swiper-slide"><img src="${image.url}" /></div>
               			</c:if>
               		</c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <div class="container">
                <div class="foodName">${requestScope.food.name}</div>
                <div class="foodPrice">
                    <span class="presentPrice">￥${requestScope.food.price}</span>
                    <span class="originalPrice">原价 ￥${requestScope.food.originPrice}</span>
                </div>
            </div>
            <div class="comment">
                <img src="/ordering/image/discuss.png " alt="" class="commentLeft">
                <a href="commentInfo.html ">
                    <span>评论信息</span>
                </a>
                <img src="/ordering/image/rightArrow.png " alt="" class="commentRight">
            </div>
            <div class='demos-content-padded'>
                <div class="addShopCarContainer">
                    <a id="btn_shopping_cart" href="javascript:;" class="weui_btn weui_btn_mini weui_btn_warn" class="addShopCar">
                        加入购物车
                    </a>
                    <a href="shopCar.html " class="shopCar">
                        <img src="/ordering/image/shopCar.png " alt="">
                        <i id="quantity" class="pos-ab top-n10 right-0 tc-red ts-12"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <script>
    	//轮播图
        $(".swiper-container").swiper({
            loop: true,
            autoplay: 2000
        });
    	
    	//购物车
    	$('')
    </script>
</body>
</html>
