package com.ordering.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ordering.dao.OrdersDao;
import com.ordering.entity.Orders;
import com.ordering.service.OrdersService;

@Controller
public class OrdersController {
	@Autowired
	private OrdersService ordersService;
	
	//添加订单
	@ResponseBody
	@RequestMapping("/createOrdering")
	public Map<String, Object> save(@RequestParam("username")String username, @RequestParam("idcard")String idcard, @RequestParam("phone")String phone, @RequestParam("trainNumber")String trainNumber, @RequestParam("seatNumber")String seatNumber, @RequestParam("payment")String payment, @RequestParam("sum")Integer sum, @RequestParam("spend")float spend, HttpServletRequest request){
		Map<String, Object> map = new HashMap<>();
		try{
			Integer id = ordersService.save(username, idcard, phone, trainNumber, seatNumber, payment, sum, spend);
			map.put("message", "订单发送成功");
			map.put("id", id);
		}catch(Exception e){
			map.put("error", e.getMessage());
		}
		return map;
	}
	
	//获取订单信息
	@RequestMapping("/getOrder")
	public String getOrder(@RequestParam("id")Integer id, HttpServletRequest request){
		try{
			Orders order = ordersService.getOrder(id);
			request.setAttribute("order", order);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "overShop";
	}
}
