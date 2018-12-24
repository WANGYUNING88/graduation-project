package com.studynotes.manager.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.common.bean.Order_detail;
import com.common.bean.Orders;

@Repository
public class OrdersDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	/*
	 * 检索全部ORDERS
	 */
	public List<Orders> selectAllOrders(){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Orders");
		List<Orders> orderlist = query.list();
		return orderlist;
	}
	/*
	 * 检索目标OREDER
	 * ORDER_ID
	 */
	public Orders selectOrderById(Integer order_id) {
		Session session = sessionFactory.getCurrentSession();
		Orders order = session.get(Orders.class, order_id);
		return order;		
	}
	/*
	 * 检索目标ORDER_DETAIL
	 * ORDER_DETAIL_ID
	 */
	public List<Order_detail> selectOrderDetailById(Integer order_id){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Order_detail where order.order_id = ?");
		query.setParameter(0, order_id);
		List<Order_detail> order_detaillist = query.list();
		return order_detaillist;
	}
	/*
	 * 检索目标ORDER
	 * USER_ID
	 */
	public List<Orders> selectOrdersById(Integer user_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Orders where user.user_id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, user_id);
		List <Orders> orderslist = query.list();
		return orderslist;		
	}
}
