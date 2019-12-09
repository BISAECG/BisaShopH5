package com.bisa.health.shop.dao;

import java.util.List;

import com.bisa.health.basic.dao.IBaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Order;

public interface IOrderDao extends IBaseDao<Order>{


	

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
     public Pager<Order> getPageOrder(String vKey, String vVal);

    
    
    /**
     * 查询所有
     * @param
     * @return
     */
    public List<Order> listOrder();
    
    
}
