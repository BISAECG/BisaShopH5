package com.bisa.health.shop.service;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.shop.dao.INewsDao;
import com.bisa.health.shop.dao.INewsInLinkDao;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsInLink;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@CacheConfig(cacheNames = "NewsServiceImpl")
public class NewsServiceImpl implements INewsService {

    @Autowired
    private INewsDao iNewsDao;
    
    @Autowired
    private INewsInLinkDao iNewsInLinkDao;

    @Override
    @Cacheable(key = "targetClass.name+methodName+#id")
    public News getNewsById(int id) {
        return iNewsDao.getNewsById(id);
    }
    @Override
    @Cacheable(key = "targetClass.name+methodName+#news_num")
	public List<News> listNewsByNewsnum(String news_num) {
		return iNewsDao.listNewsByNewsnum(news_num);
	}

    @Override
    @CacheEvict(value = "NewsServiceImpl", allEntries = true)
    public News addNews(News news) {
        return iNewsDao.add(news);
    }


    @Override
    @CacheEvict(value = "NewsServiceImpl", allEntries = true)
    public void deleteNewsById(int id) {
         iNewsDao.delete(id);
    }
    
    @Override
    @CacheEvict(value = "NewsServiceImpl", allEntries = true)
    public boolean deleteNewsByNewsnum(String news_num) {
        return iNewsDao.deleteNewsByNewsnum(news_num);
    }

    
	@Override
	public News getNewsByNewsnumAndLanguage(String news_num, String language) {
		return iNewsDao.getNewsByNewsnumAndLanguage(news_num, language);
	}

	
	@Override
	public List<News> listNews() {
		return iNewsDao.listNews();
	}
	 /**
     * 这里的方法是，增加阅读量，就不删除缓存了
     */
    @Override
    @CacheEvict(value = "NewsServiceImpl", allEntries = true)
    public News updateNews(News news) {
        return iNewsDao.updateNews(news);
    }


    @Override
    @Cacheable(key = "targetClass.name+methodName+#offset")
    public Pager<News> getPageNewsGroupNum(Integer offset) {
        //获取的是新闻表的数据，在去判断要不要回去，国际化的语言
        Pager<News> pagerNews = iNewsDao.getPageNewsGroupNum();
        return pagerNews;
    }
    
	@Override
	public Pager<News> getPageNewsGroupNum(String vKey, String vVal,int offset) {
		  Pager<News> pagerNews = iNewsDao.getPageNewsGroupNum(vKey,vVal);
	      return pagerNews;
	}
    @Override
    @Cacheable(key = "targetClass.name+methodName+#language+#vKey+#vVal+#offset")
    public Pager<News> getPageNews(String language, String vKey, String vVal,int offset){
        //获取的是新闻表的数据，在查询过程中已经国际化
        Pager<News> pagerNews = iNewsDao.getPageNews(language, vKey, vVal);
        return pagerNews;
    }
	@Override
	   @Cacheable(key = "targetClass.name+methodName+#language+#vKey+#vVal+#is_pc+#offset")
	public Pager<News> getPageNews(String language, String vKey, String vVal, int is_pc, int offset) {
		 //获取的是新闻表的数据，在查询过程中已经国际化
        Pager<News> pagerNews = iNewsDao.getPageNews(language, vKey, vVal,is_pc);
        return pagerNews;
	}

    @Override
    @Cacheable(key = "targetClass.name+methodName+#language+#is_pc")
    public List<News> getTop4ListNews(String language,int is_pc) {
        List<News> listNews = iNewsDao.getTop4ListNews(language,is_pc);
        return listNews;
    }

    @Override
    @Cacheable(key = "targetClass.name+methodName+#language")
    public List<News> getListNews(String language) {
        List<News> listNews = iNewsDao.getListNews(language);
        return listNews;
    }

    /**
     * 获取置顶新闻
     */
    @Override
    public List<News> getPlacementNews(String language) {
        List<News> listNews = iNewsDao.getPlacementNews(language);
        return listNews;
    }

    
	@Override
	public List<NewsInLink> listLink() {
		return iNewsInLinkDao.listLink();
	}
	@Override
	public Pager<NewsInLink> listPageLink(int offset) {
		return iNewsInLinkDao.listPageLink();
	}

    @Override
    public void delectInnerChain(int id) {
    	iNewsInLinkDao.delete(id);
    }

    @Override
    public NewsInLink addInnerChain(NewsInLink newsInnerChain) {
        return iNewsInLinkDao.add(newsInnerChain);
    }
    
	@Override
	public NewsInLink getNewsInLink(int id) {
		return iNewsInLinkDao.loadNewsInLink(id);
	}
	@Override
	public NewsInLink updateInnerChain(NewsInLink newsInnerChain) {
		 iNewsInLinkDao.update(newsInnerChain);
		 return newsInnerChain;
	}
	@Override
	public Pager<News> selectAllNews(Integer page, Integer limit, String incontent, String searchabout) {
		return null;
	}


}
