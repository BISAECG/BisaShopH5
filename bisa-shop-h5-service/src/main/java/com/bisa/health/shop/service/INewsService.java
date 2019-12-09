package com.bisa.health.shop.service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsInLink;

import java.util.List;

/**
 * news表
 * @author Administrator
 */
public interface INewsService {

    /**
     * 新闻表的id,加载新闻数据
     * @param id
     * @return
     */
    News getNewsById(int id);
    /**
     * 查询3个语言版本
     * @param new_id
     * @return
     */
    public List<News> listNewsByNewsnum(String news_num);
    
    
    /**
     * 查询所有
     * @param new_id
     * @return
     */
    public List<News> listNews();
    
    
    
    
    /**
     * 根据新闻ID和语言ID
     * @param news_id
     * @param language_id
     * @return
     */
    public News getNewsByNewsnumAndLanguage(String news_num,String language);
    /**
     * 添加新闻
     * @param news
     * @return
     */
    News addNews(News news);

    /**
     * 更新新闻信息
     * @param news
     * @return
     */
    News updateNews(News news);
    
    

    /**
     * 删除新闻信息
     * @param id
     * @return
     */
    public void deleteNewsById(int id);
    
    /**
     * 删除新闻信息
     * @param new_id
     * @return
     */
    public boolean deleteNewsByNewsnum(String new_num);

    /**
     * 查询  (所有新闻)
     * @param page        第几页
     * @param limit       每页有多少数据
     * @param incontent   input输入的内容   和下面对应
     * @param searchabout option选择   1 文章标题  2 文章ID
     * @return
     */
    Pager<News> selectAllNews(Integer page, Integer limit, String incontent, String searchabout);

   
    /**
     * 上一篇，本文，下一篇文章
     *
     * @return
     * @param language
     */
    List<News> getTop4ListNews(String language);

    
    /**
     * 根据新闻news_num分类查询
     * @param offset
     * @return
     */
    Pager<News> getPageNewsGroupNum(Integer offset);
    
    
    /**
     * 新闻分页
     * @param language
     * @return
     */
    public Pager<News> getPageNewsGroupNum(String vKey, String vVal,int offset);
    /**
     * 关键字和语言分页查询
     * @param language
     * @param vKey
     * @param vVal
     * @return
     */
    public Pager<News> getPageNews(String language, String vKey, String vVal,int offset);



    /**
     * 获取所有的新闻
     *
     * @return
     * @param language
     */
    List<News> getListNews(String language);

    

    /**
     * 获取置顶新闻
     * @return
     */
    List<News> getPlacementNews(String language);
    
    
    
    /**
     * 查询所有的内链接文本
     * @return
     */
    List<NewsInLink> listLink();
    
    /**
     * 查询所有的内链接文本
     * @return
     */
    Pager<NewsInLink> listPageLink(int offset);
    /**
     * 添加内链接
     * @param newsInnerChain
     * @return
     */
    NewsInLink addInnerChain(NewsInLink newsInnerChain);
    
    /**
     * ID查询内链接
     * @param newsInnerChain
     * @return
     */
    NewsInLink getNewsInLink(int id);
    /**
     * 更新内链接
     * @param newsInnerChain
     * @return
     */
    NewsInLink updateInnerChain(NewsInLink newsInnerChain);
    /**
     * 删除内链接
     * @param id
     * @return
     */
    void delectInnerChain(int id);
    
}
