package com.ordering.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ordering.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/getComments")
	public String getComments(HttpServletRequest request){
		List<Object> comments = commentService.getComments();
		request.setAttribute("comments", comments);
		return "commentInfo";
	}
	
	//添加评论
	@ResponseBody
	@RequestMapping("/addComment")
	public Map<String, Object> addComment(@RequestParam("content")String content){
		Map<String, Object> map = new HashMap<>();
		try{
			commentService.addComment(content);
			map.put("message", "评论添加成功！");
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
}
