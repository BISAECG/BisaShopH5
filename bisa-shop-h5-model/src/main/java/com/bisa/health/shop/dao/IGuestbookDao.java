package com.bisa.health.shop.dao;

import java.util.List;

import com.bisa.health.basic.dao.IBaseDao;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Guestbook;

public interface IGuestbookDao extends IBaseDao<Guestbook>{


	

    /**
     *留言表的id,加载订单数据
     * @param id
     * @return
     */
    public Guestbook getGuestbookById(int id);
    
     
     /**
      *留言分页
      * @param 
      * @return
      */
     public Pager<Guestbook> getPageGuestbook(String vKey, String vVal);

    
    
    /**
     * 查询所有
     * @param
     * @return
     */
    public List<Guestbook> listGuestbook();
    
  
    
}
