package com.studynotes.manager.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.bean.Order_detail;
import com.common.bean.Orders;
import com.studynotes.manager.service.OrdersSerivce;

@Controller
public class OrdersAction {
	@Autowired
	private OrdersSerivce ordersService;
	
	/*
	 * 检索全部ORDERS
	 */
	@RequestMapping("/selectAllOrders")
	public String selectAllOrders(Model model){
		List<Orders> orderslist  = ordersService.selectAllOrders();
		model.addAttribute("orderslist",orderslist);
		return "allOrder";
	}
	/*
	 * 检索目标OREDER
	 * ORDER_ID
	 */
	@RequestMapping("/selectOrderById")
	public String selectOrderById(Model model,Integer order_id){
		Orders order = ordersService.selectOrderById(order_id);
		model.addAttribute("order",order);
		return "order_detail";
		}
	/*
	 * 检索目标ORDER_DETAIL
	 * ORDER_DETAIL_ID
	 */
	@RequestMapping("/selectOrderDetailById")
	public String selectOrderDetailById(Model model,Integer order_id){
		List<Order_detail> order_detaillist = ordersService.selectOrderDetailById(order_id);
		model.addAttribute("order_detaillist",order_detaillist);
		return "order_detail";
		}
	/*
	 * 检索目标ORDER
	 * USER_ID
	 */
	@RequestMapping("/selectOrdersById")
	public String selectOrdersById(Integer user_id,Model model) {
		List<Orders> orderslist = ordersService.selectOrdersById(user_id);
		model.addAttribute("orderslist",orderslist);
		model.addAttribute("id", "1");
		return "allOrder";
	}
}
