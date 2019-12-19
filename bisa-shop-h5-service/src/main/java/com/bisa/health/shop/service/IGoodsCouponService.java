package com.bisa.health.shop.service;

import java.util.List;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.GoodsCoupon;

public interface IGoodsCouponService {
	
	
	
	  /**
     * 优惠券表的号码,加载优惠券数据
     * @param num
     * @return
     */
    public GoodsCoupon getGoodsCouponByNum(String num,int status);

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
     public Pager<GoodsCoupon> getPageGoodsCoupon(int offset,String vKey, String vVal);
    
    /**
     * 查询所有
     * @param
     * @return
     */
    public List<GoodsCoupon> listGoodsCoupon();
    
    /**
     * 增加优惠券
     * @param goodsCoupon
     * @return
     */
    public GoodsCoupon addGoodsCoupon(GoodsCoupon goodsCoupon);
    
    /**
     * 更新优惠券
     * @param goodsCoupon
     * @return
     */
    public GoodsCoupon updateGoodsCoupon(GoodsCoupon goodsCoupon);
    
    /**
     * 删除优惠券
     * @param id
     */
    public void deleteGoodsCoupon(int id);
    

}
