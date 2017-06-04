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
    <style>
        .publish {
            width: 100%;
            height:40px;
            position: relative ;
        }
        .publish .publishImg {
            position: absolute ;
            top:4px;
            right:10px;
        }
    </style>
</head>
<body ontouchstart>

<div class="weui_tab">
    <div class="back">
        <a id="btn_back" href="javascript:;">
            <img src="/ordering/image/back.png " alt="">
        </a>
        <span>评论信息</span>
    </div>
    <div class="weui_tab_bd">
        <div class="weui_cells weui_cells_form">
            <div class="weui_cell">
                <div class="weui_cell_bd weui_cell_primary">
                    <textarea class="weui_textarea" placeholder="请输入评论" rows="3" id="comment"></textarea>
                    <div class="weui_textarea_counter"><span>0</span>/100</div>
                </div>
            </div>
        </div>
        <div id="btn_publish" class="publish">
            <img src="/ordering/image/publish.png " alt="" class="publishImg ">
        </div>
        <article class="weui_article">
            <section>
            	<c:forEach var="comment" items="${requestScope.comments}">
	            	<h2>${comment.content}</h2>
	                <p>
	                    <span>${comment.time}</span>
	                </p>
	                <p id="addComment">评论内容</p>
            	</c:forEach>
            </section>
        </article>
    </div>
</div>
<script>
	//后退按钮
	$('#btn_back').click(function(){
		history.back();
	})
	
	//添加评论
	$('#btn_publish').click(function(){
		$.post('/ordering/addComment', {content : $('#comment').val()}, function(data){
			if(data.error){
				alert(data.error);
			}else{
				alert(data.message);
				location.reload();
			}
		})
	})
</script>
</body>
</html>