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

import com.ordering.entity.Foods;
import com.ordering.service.FoodsService;

@Controller
public class FoodsController {
	@Autowired
	private FoodsService foodsService;
	
	//套餐列表
	@RequestMapping("/foodsList")
	public String getFoods(HttpServletRequest request){
		List<Object> foods = foodsService.getFoods();
		request.setAttribute("foods", foods);
		return "foodList";
	}
	
	//套餐详情
	@RequestMapping("/foodDetails")
	public String getFoodById(@RequestParam("id")Integer id, HttpServletRequest request){
		Foods food = foodsService.getFoodById(id);
		request.setAttribute("food", food);
		return "foodDetails";
	}
	
	//购物车
	@ResponseBody
	@RequestMapping("/shopCart")
	public Map<String, Object> shopCart(@RequestParam("id")Integer id, HttpServletRequest request){
		Map<String, Object> map = new HashMap<>();
		try{
			Foods food = foodsService.getFoodById(id);
			map.put("food", food);
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
}
