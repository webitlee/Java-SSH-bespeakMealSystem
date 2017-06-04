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
    <script src="/ordering/js/weixin-1.2.0.js"></script>
    <title></title>
</head>
<body ontouchstart>
    <div class="weui_tab">
        <div class="back">
            <a id="btn_back" href="javascript:;">
                <img src="/ordering/image/back.png " alt="">
            </a>
            <span> 点餐</span>
         </div>
        <div class="weui_tab_bd">
            <ul>
            	<c:forEach var="food" items="${requestScope.foods}">
            		<li>
                    <a href="/ordering/foodDetails?id=${food.id}">
                        <div class="foodList">
                            <div class="foodImg">
                            	<c:forEach var="image" items="${food.images}">
                            		<c:if test="${image.listImage}">
                            			<img src="${image.url}" alt="">
                            		</c:if>
                            	</c:forEach>
                            </div>
                            <div class="foodInfo">
                                <br>
                                <span class="foodName">${food.name}</span><br><br>
                                <span class="presentPrice">￥${food.price}</span>
                                <span class="originalPrice">原价￥${food.originPrice}</span>
                            </div>
                        </div>
                    </a>
                </li>
            	</c:forEach>
            </ul>
        </div>
    </div>
</body>
<script>
	//后退按钮
	$('#btn_back').click(function(){
		history.back();
	})
</script>
</html>