package com.bisa.health.shop.service;

import java.util.List;
import java.util.Map;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.GoodsRecommend;


public interface IGoodsService {
	
	
	/**
	 * 根据语言和关键字查询
	 * @param language
	 * @param vKey
	 * @param vVal
	 * @return
	 */
	public Pager<Goods> pageAllByLanguage(String language,String vKey,String vVal,int offset);
	
	/**
	 * 获取所有商品
	 * @param language
	 * @return
	 */
	public List<Goods> listAllByLanguage(String language);
	
	/**
	 * 获取所有商品
	 * @param language
	 * @return
	 */
	public List<Goods> listAllByLanguage(String language,Map<String,Object> alias);
	/**
	 * 根据商品编号分组查询数据
	 * @param offset
	 * @return
	 */
	public Pager<Goods> listAllGroupNumber(Integer offset);
	/**
	 * 根据商品编号和语言
	 * @param num
	 * @param language
	 * @return
	 */
	public Goods loadByNumAndlanguage(String num,String language);
	/**
	 * 根据编号查找不同语言版本恩的数据
	 * @param num
	 * @return
	 */
	public List<Goods> listByNum(String num);
	/**
	 * 根据ID查找
	 * @param id
	 * @return
	 */
	public Goods loadById(int id);

	/**
	 * 保存商品
	 * @param goods
	 * @return
	 */
	public Goods save(Goods goods);
	/**
	 * 更新商品
	 * @param goods
	 * @return
	 */
	public Goods update(Goods goods);
	/**
	 * 删除
	 * @param id
	 */
	void delete(int id);
	/**
	 * 所有的编号IN查找
	 * @param alias
	 * @return
	 */
	public List<Goods> listByNum(Map<String, Object> alias);
	
	/**
	 * 根据分类编号查找商品
	 * @param alias
	 * @return
	 */
	public List<Goods> listByCategoryNum(String categoryNum,String language);
	
	
	/**
	 * 查找推荐商品
	 * @param num
	 * @return
	 */
	public List<GoodsRecommend> listRecommendByNum(String num);
	
	/**
	 * 插入关联商品
	 * @param goodsRecommend
	 * @return
	 */
	public GoodsRecommend addGoodsRecommend(GoodsRecommend goodsRecommend);

	
	/**
	 * 删除关联商品
	 * @param num
	 * @return
	 */
	public int delGoodsRecommendByNum(String num);
	
	
}
