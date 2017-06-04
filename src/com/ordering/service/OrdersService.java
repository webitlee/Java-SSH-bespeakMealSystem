package com.ordering.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ordering.dao.OrdersDao;
import com.ordering.entity.Orders;

@Service
public class OrdersService {
	@Autowired
	private OrdersDao ordersDao;
	
	//提交订单
	public Integer save(String username, String idcard, String phone, String trainNumber, String seatNumber, String payment, int sum, float spend){
		return ordersDao.save(username, idcard, phone, trainNumber, seatNumber, payment, sum, spend);
	}
	
	//获取订单信息
	public Orders getOrder(Integer id){
		return ordersDao.getOrder(id);
	}
}
