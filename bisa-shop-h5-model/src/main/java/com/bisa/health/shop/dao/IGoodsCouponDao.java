package com.bisa.health.shop.dao;

import java.util.List;

import com.bisa.health.basic.dao.IBaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.GoodsCoupon;

public interface IGoodsCouponDao extends IBaseDao<GoodsCoupon>{


	  /**
     * 优惠券表的号码,加载优惠券数据
     * @param num
     * @return
     */
    public GoodsCoupon getGoodsCouponByNum(String num);
    
	

    /**
     * 优惠券表的id,加载优惠券数据
     * @param id
     * @return
     */
    public GoodsCoupon getGoodsCouponById(int id);
    
     
     /**
      * 优惠券分页
      * @param 
      * @return
      */
     public Pager<GoodsCoupon> getPageGoodsCoupon(String vKey, String vVal);

    
    
    /**
     * 查询所有
     * @param
     * @return
     */
    public List<GoodsCoupon> listGoodsCoupon();
    
  
    
}
