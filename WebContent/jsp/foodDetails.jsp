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
            <a id="btn_back" href="javascript:;">
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
                <a href="/ordering/getComments">
                    <span>评论信息</span>
                </a>
                <img src="/ordering/image/rightArrow.png " alt="" class="commentRight">
            </div>
            <div class='demos-content-padded'>
                <div class="addShopCarContainer">
                    <a id="btn_shopping_cart" href="javascript:;" class="weui_btn weui_btn_mini weui_btn_warn" class="addShopCar">
                      	 加入购物车
                    </a>
                    <a href="/ordering/jsp/shopCart.jsp" class="shopCar">
                        <img src="/ordering/image/shopCar.png " alt="">
                        <i id="quantity" class="pos-ab top-n10 right-0 tc-red ts-12" data-id="${requestScope.food.id}"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <script>
	  	//后退按钮
		$('#btn_back').click(function(){
			history.back();
		})
    
    	//轮播图
        $(".swiper-container").swiper({
            loop: true,
            autoplay: 2000
        });
    	
    	//购物车显示套餐数
		if(sessionStorage.getItem('id')){
			var sum = 0;
			var foodData = JSON.parse(sessionStorage.getItem('id'));
			for(var i = 0; i < foodData.length; i++){
				sum += parseInt(foodData[i].quantity);
			}
			$('#quantity').text(sum);
		}
    	
    	//加入购物车
    	$('#btn_shopping_cart').click(function(){
    		var $quantity = $('#quantity');
    		var quantity = parseInt($.trim($quantity.text()));
    		var id = $quantity.attr('data-id');
    		if(!quantity){
    			$quantity.text(1);
    		}else{
    			$quantity.text(quantity + 1);
    		}
    		var foodIds = null;
    		var foodData = null;
    		var jsonData = null;
    		var flag = false;
    		if(sessionStorage.getItem('id')){
    			foodIds = JSON.parse(sessionStorage.getItem('id'));
    			for(var i = 0; i < foodIds.length; i++){
    				if(foodIds[i].id == id){
    					foodIds[i].quantity = parseInt(foodIds[i].quantity) + 1;
    					flag = true;
    					break;
    				}
    			}
    			if(!flag){
    				foodData = {id : id, quantity : 1};
    				foodIds.push(foodData);
    			}
    		}else{
    			foodIds = [];
    			foodData = {id : id, quantity : parseInt($quantity.text())};
    			foodIds.push(foodData);
    		}
    		jsonData = jsonData = JSON.stringify(foodIds);
    		sessionStorage.setItem('id', jsonData);
    	})
    </script>
</body>
</html>
