<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="/ordering/js/weixin-1.2.0.js"></script>
    <title></title>
    <style>
        .num{
            text-align: center ;
        }
        .num span{
            display: inline-block ;
            width:30px;
            height:30px;
            line-height: 30px;
            border:1px solid #3d4145;
            text-align: center ;

        }
    </style>
</head>
<body ontouchstart>
    <div class="weui_tab">
        <div class="back">
            <a id="btn_back" href="javascript:;">
                <img src="/ordering/image/back.png " alt="">
            </a>
            <span>购物车</span>
        </div>
        <div class="weui_tab_bd">
            <div>
                <ul>
                    <li id="shopCart">
	                    <!-- <div class="foodList">
	                        <div class="foodImg">
	                            <img src="/ordering/img/sbj.jpg" alt="">
	                        </div>
	                        <div class="foodInfo">
	                            <br>
	                            <span class="sbj">三杯鸡套餐</span><br><br>
	                            <span class="presentPrice">￥40</span><br>
	                                <p class="num">
	                                    <span class="minus" >-</span>
	                                    <span class="show_num" >1</span>
	                                    <span class="plus">+</span>
	                                </p>
	                        </div>
	                    </div> -->
                    </li>
                </ul>
            </div>
            <div class="paymoney">
                您需支付 <span>￥</span> <span class="numMoney">0元</span>
            </div>
            <div class='demos-content-padded'>
                <a href="/ordering/html/userInfo.html" class="weui_btn weui_btn_primary" id="toUserInfo">结算</a>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function(){
        	//后退按钮
        	$('#btn_back').click(function(){
        		history.back();
        	})
        	
        	//显示购物车信息
        	var foodsData = JSON.parse(sessionStorage.getItem('id'));
        	var sumPrice = 0;
        	for(var i = 0; i < foodsData.length; i++){
        		$.get('/ordering/shopCart', {id : foodsData[i].id}, function(data){
        			if(data.error){
        				alert(data.error);
        			}else{
        				var sum = null;
        				for(var j = 0; j < foodsData.length; j++){
        					if(foodsData[j].id == data.food.id){
        						sum = foodsData[j].quantity;
        					}
        				}
        				var images = data.food.images;
        				var image = null;
        				for(var i = 0; i < images.length; i++){
        					if(images[i].listImage){
        						image = images[i].url;
        					}
        				}
        				var name = data.food.name;
        				var price = data.food.price;
        				sumPrice += parseInt(price) * sum;
        				var originPrice = data.food.originPrice;
        				var shtml ='<div class="foodList">'+
        		    	'	<div class="foodImg">'+
        		    	'		<img src="'+image+'" alt="">'+
        		    	'	</div>'+
        		    	'	<div class="foodInfo">'+
        		    	'	    <br>'+
        		    	'		<span class="sbj">￥'+ price + 
        		    	'		</span>'+
        		    	'		<br>'+
        		    	'		<br>'+
        		    	'		<span class="presentPrice">￥'+ originPrice + 
        		    	'		</span>'+
        		    	'		<br>'+
        		    	'		<p class="num">'+
        		    	'			<span class="minus" >-'+
        		    	'			</span>'+
        		    	'			<span class="show_num" >'+ sum + 
        		    	'			</span>'+
        		    	'			<span class="plus">+'+
        		    	'			</span>'+
        		    	'		</p>'+
        		    	'	</div>'+
        		    	'</div>';
        		    	$('#shopCart').append(shtml);
        		    	//共需支付金额
        	        	$('.numMoney').text(sumPrice + '元');
        			}
        			
        		})
        	}
        	
        });
        
        //数量加
        $(document).on('click', '.plus', function(){
        	var $quantity = $(this).prev();
        	var num = parseInt($.trim($quantity.text()));
        	$quantity.text(num + 1);
        	changePrice();
        })
        
        //数量减
        $(document).on('click', '.minus', function(){
        	var $quantity = $(this).next();
        	var num = parseInt($.trim($quantity.text()));
    		if(num <= 1){
    			if(confirm('确定删除该套餐吗？')){
    				$(this).parent().parent().parent().remove();
    			}
    		}else{
    			$quantity.text(num - 1);
    		}
    		changePrice();
        	
        })
        
        function changePrice(){
        	var sumPrice = 0;
        	$('.sbj').each(function(){
        		var price = parseFloat($.trim($(this).text()).substring(1));
        		var num = parseInt($.trim($(this).siblings('.num').children('.show_num').text()));
        		sumPrice += price * num;
        	})
        	$('.numMoney').text(sumPrice);
        }
        
        //结算
        $('#toUserInfo').click(function(){
        	var sum = 0;
        	$('.show_num').each(function(){
        		sum += parseInt($.trim($(this).text()));
        	})
        	var charge = parseInt($.trim($('.numMoney').text()));
        	sessionStorage.setItem('sum', sum);
        	sessionStorage.setItem('charge', charge);
        })
    </script>
</body>
</html>