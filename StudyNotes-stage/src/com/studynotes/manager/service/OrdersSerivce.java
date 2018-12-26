package com.studynotes.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.bean.Order_detail;
import com.common.bean.Orders;
import com.studynotes.manager.dao.OrdersDao;

@Service
@Transactional
public class OrdersSerivce {
	@Autowired
	private OrdersDao ordersDao;
	
	public List<Orders> selectAllOrders(){
		return ordersDao.selectAllOrders();
	}
	
	public Orders selectOrderById(Integer order_id) {
		return ordersDao.selectOrderById(order_id);
	}
	
	public List<Order_detail> selectOrderDetailById(Integer order_id){
		return (List<Order_detail>) ordersDao.selectOrderDetailById(order_id);
	}
	public List<Orders> selectOrdersById(Integer user_id) {
		return ordersDao.selectOrdersById(user_id);
	}
}
