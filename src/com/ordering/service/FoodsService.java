package com.ordering.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ordering.dao.FoodsDao;

@Service
public class FoodsService {
	@Autowired
	private FoodsDao foodsDao;
	
	//获取所有套餐
	public List<Object> getFoods(){
		return foodsDao.getFoods();
	}
}
