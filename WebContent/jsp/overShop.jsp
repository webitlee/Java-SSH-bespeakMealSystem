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
    <div class="weui_tab_bd">
    	<p>尊敬的旅客：${requestScope.order.name}</p>
    	<p>您于${requestScope.order.time}  购买了 ${requestScope.order.sum}份套餐</p>
    	<p>您的位置为：${requestScope.order.trainNumber}${requestScope.order.seatNumber}</p>
    	<p>本次消费：共计${requestScope.order.spend}元</p>
    	<p>您选择了${requestScope.order.payment}支付</p>
    	<c:if test="${requestScope.order.payment == '现金'}">
    		<p>注：请您备好零钱，食物30分钟内送到。</p>
    	</c:if>
    	<c:if test="${requestScope.order.payment != '现金'}">
    		<p>注：食物30分钟内送到。</p>
    	</c:if>
        <div class='demos-content-padded'>
            <a id="btn_home_page" href="javascript:;" class="weui_btn weui_btn_primary">返回主页面</a>
        </div>
    </div>
</div>
</body>
<script>
	$(function(){
		//返回主界面
		$('#btn_home_page').click(function(){
			sessionStorage.clear();
			location.href = '/ordering/foodsList';
		})
	})
</script>
</html>
