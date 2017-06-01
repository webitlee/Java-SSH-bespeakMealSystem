package com.ordering.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ordering.util.GetSessionUtil;

@Repository
public class FoodsDao {
	@Autowired
	private GetSessionUtil getSessionUtil;
	
	//获取所有套餐
	public List<Object> getFoods(){
		String hql = "from Foods";
		Query query = getSessionUtil.getSession().createQuery(hql);
		List<Object> foods = query.list();
		return foods;
	}
}
