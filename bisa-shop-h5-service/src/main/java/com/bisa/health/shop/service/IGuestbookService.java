package com.bisa.health.shop.service;

import java.util.List;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Guestbook;

public interface IGuestbookService {
	

    /**
     * 留言表的id,加载留言数据
     * @param id
     * @return
     */
    public Guestbook getGuestbookById(int id);
    
     
     /**
      * 留言分页
      * @param 
      * @return
      */
     public Pager<Guestbook> getPageGuestbook(int offset,String vKey, String vVal);
    
    /**
     * 查询所有
     * @param
     * @return
     */
    public List<Guestbook> listGuestbook();
    
    /**
     * 增加留言
     * @param Guestbook
     * @return
     */
    public Guestbook addGuestbook(Guestbook guestbook);
    
    /**
     * 更新留言
     * @param Guestbook
     * @return
     */
    public Guestbook updateGuestbook(Guestbook guestbook);
    
    /**
     * 删除留言
     * @param id
     */
    public void deleteGuestbook(int id);
    

}
