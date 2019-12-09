package com.bisa.health.shop.service;

import java.util.List;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Address;

public interface IAddressService {

    /**
     * 地址的id,加载支付数据
     * @param id
     * @return
     */
    public Address getAddressById(int id);
    
    /**
     * 查询所有
     * @param
     * @return
     */
    public List<Address> listAddress(int userId);
    
  
    
    /**
     * 增加
     * @param address
     * @return
     */
    public Address save(Address address);
    
    /**
     * 更新
     * @param address
     * @return
     */
    
    public Address update(Address address);
    
    /**
     * 分页查询
     * @param userId
     * @return
     */
    public Pager<Address> pagerAddress(int userId);
    /**
     * 更新默认
     */
    public void updateByDefault(String def,int userId);
}
