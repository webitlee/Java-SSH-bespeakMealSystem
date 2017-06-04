package com.ordering.dao;

import java.io.Serializable;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ordering.entity.Orders;
import com.ordering.util.GetSessionUtil;

@Repository
public class OrdersDao {
	@Autowired
	private GetSessionUtil getSessionUtil;
	@Resource
	private Orders orders;
	
	//提交订单
	public Integer save(String username, String idcard, String phone, String trainNumber, String seatNumber, String payment, int sum, float spend){
		orders.setName(username);
		orders.setIdcard(idcard);
		orders.setPhone(phone);
		orders.setTrainNumber(trainNumber);
		orders.setSeatNumber(seatNumber);
		orders.setPayment(payment);
		orders.setSum(sum);
		orders.setSpend(spend);
		orders.setTime(new Date());
		Serializable serializable =  getSessionUtil.getSession().save(orders);
		return (Integer)serializable;
	}
	
	//获取订单信息
	public Orders getOrder(Integer id){
		Orders order = (Orders) getSessionUtil.getSession().get(Orders.class, id);
		return order;
	}
}
