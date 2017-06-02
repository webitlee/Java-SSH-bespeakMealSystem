package com.ordering.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ordering.dao.FoodsDao;
import com.ordering.entity.Foods;

@Service
public class FoodsService {
	@Autowired
	private FoodsDao foodsDao;
	
	//获取所有套餐
	public List<Object> getFoods(){
		return foodsDao.getFoods();
	}
	
	//根据id获取套餐详情
	public Foods getFoodById(Integer id){
		return foodsDao.getFoodById(id);
	}
}
