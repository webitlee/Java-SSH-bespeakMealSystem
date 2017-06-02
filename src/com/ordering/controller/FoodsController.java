package com.ordering.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ordering.entity.Foods;
import com.ordering.service.FoodsService;

@Controller
public class FoodsController {
	@Autowired
	private FoodsService foodsService;
	
	@RequestMapping("/foodsList")
	public String getFoods(HttpServletRequest request){
		List<Object> foods = foodsService.getFoods();
		request.setAttribute("foods", foods);
		return "foodList";
	}
	
	@RequestMapping("/foodDetails")
	public String getFoodById(@RequestParam("id")Integer id, HttpServletRequest request){
		Foods food = foodsService.getFoodById(id);
		request.setAttribute("food", food);
		return "foodDetails";
	}
}
