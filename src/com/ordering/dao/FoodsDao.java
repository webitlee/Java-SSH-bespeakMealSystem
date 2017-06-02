package com.ordering.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ordering.entity.Foods;
import com.ordering.util.GetSessionUtil;

@Repository
public class FoodsDao {
	@Autowired
	private GetSessionUtil getSessionUtil;
	@Resource
	private Foods foods;
	
	//获取所有套餐
	public List<Object> getFoods(){
		String hql = "from Foods";
		Query query = getSessionUtil.getSession().createQuery(hql);
		List<Object> foods = query.list();
		return foods;
	}
	
	//根据id获取套餐详情
	public Foods getFoodById(Integer id){
		Foods food = (Foods) getSessionUtil.getSession().get(Foods.class, id);
		return food;
	}
}
