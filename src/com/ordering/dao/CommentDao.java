package com.ordering.dao;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ordering.entity.Comment;
import com.ordering.util.GetSessionUtil;

@Repository
public class CommentDao {
	@Resource
	private Comment comment;
	@Autowired
	private GetSessionUtil getSessionUtil;
	
	//获取评论内容
	public List<Object> getComments(){
		String hql = "from Comment";
		Query query = getSessionUtil.getSession().createQuery(hql);
		System.out.println(query.list());
		List<Object> comments = query.list();
		return comments;
	}
	
	//添加评论
	public void addComment(String content){
		comment.setContent(content);
		comment.setTime(new Date());
		getSessionUtil.getSession().save(comment);
	}
}
