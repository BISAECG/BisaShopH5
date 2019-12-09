package com.bisa.health.shop.service;

import java.util.List;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Order;

public interface IOrderService {
	

    /**
     * 订单表的id,加载订单数据
     * @param id
     * @return
     */
    public Order getOrderById(int id);
    
    /**
     * 订单表的编号,加载订单数据
     * @param id
     * @return
     */
    public Order getOrderByNum(String num);
     /**
      * 订单分页
      * @param 
      * @return
      */
     public Pager<Order> getPageOrder(int offset,String vKey, String vVal);
    
    /**
     * 查询所有
     * @param
     * @return
     */
    public List<Order> listOrder();
    
    /**
     * 增加订单
     * @param Order
     * @return
     */
    public Order addOrder(Order order);
    
    /**
     * 更新订单
     * @param Order
     * @return
     */
    public Order updateOrder(Order order);
    
    /**
     * 删除订单
     * @param id
     */
    public void deleteOrder(int id);
    

}
