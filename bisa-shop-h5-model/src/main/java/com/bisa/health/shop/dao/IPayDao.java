package com.bisa.health.shop.dao;

import java.util.List;

import com.bisa.health.basic.dao.IBaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Pay;

public interface IPayDao extends IBaseDao<Pay>{


    /**
     * 支付表的id,加载支付数据
     * @param id
     * @return
     */
    public Pay getPayById(int id);
    
     
     /**
      * 支付分页
      * @param 
      * @return
      */
     public Pager<Pay> getPagePay(String vKey, String vVal);

    
    
    /**
     * 查询所有
     * @param
     * @return
     */
    public List<Pay> listPay();
    
  
    
}
