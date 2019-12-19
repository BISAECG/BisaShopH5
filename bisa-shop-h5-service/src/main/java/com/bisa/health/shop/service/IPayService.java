package com.bisa.health.shop.service;

import java.util.List;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Pay;

public interface IPayService {
	

    /**
     * 支付表的id,加载支付数据
     * @param id
     * @return
     */
    public Pay getPayById(int id);
    
    
    /**
     * 订单号码
     * @param order_num
     * @return
     */
	public Pay getPatByOrderNum(String order_num);
    
     
     /**
      * 支付分页
      * @param 
      * @return
      */
     public Pager<Pay> getPagePay(int offset,String vKey, String vVal);
    
    /**
     * 查询所有
     * @param
     * @return
     */
    public List<Pay> listPay();
    
    /**
     * 增加支付
     * @param Pay
     * @return
     */
    public Pay addPay(Pay pay);
    
    /**
     * 更新支付
     * @param Pay
     * @return
     */
    public Pay updatePay(Pay pay);
    
    /**
     * 删除支付
     * @param id
     */
    public void deletePay(int id);
    

}
