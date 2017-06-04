package com.ordering.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ordering.dao.CommentDao;

@Service
public class CommentService {
	@Autowired
	private CommentDao commentDao;
	
	//获取评论内容
	public List<Object> getComments(){
		return commentDao.getComments();
	}
	
	//添加评论
	public void addComment(String content){
		commentDao.addComment(content);
	}
}
