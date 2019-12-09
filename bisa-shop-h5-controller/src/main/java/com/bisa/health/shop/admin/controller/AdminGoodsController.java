package com.bisa.health.shop.admin.controller;

import com.bisa.health.shop.service.IGoodsCategoryService;
import com.bisa.health.shop.service.IGoodsService;
import com.bisa.health.shop.utils.TradeNoUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.entity.TreeData;
import com.bisa.health.shop.enumerate.GoodsTypeEnum;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.GoodsCategory;
import com.bisa.health.shop.model.GoodsRecommend;

/**
 * 新闻管理
 *
 * @author Administrator
 */

@Controller
@RequestMapping(value = "/admin/goods")
@RequiresRoles(value = { "ROLE_ADMIN", "ROLE_CUSTOMER" }, logical = Logical.OR)
public class AdminGoodsController {

	@Autowired
	private IGoodsService goodsService;

	@Autowired
	private IGoodsCategoryService goodsCategoryService;

	@Autowired
	private InternationalizationUtil i18nUtil;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("language", i18nUtil.lang());
		return "admin/goods/list";
	}

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String listCategory(Model model) {
		model.addAttribute("language", i18nUtil.lang());
		return "admin/goods/category";
	}
	
	@RequestMapping(value = "/ajax/tree/{goodNumber}", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> lsitTreeGoods(@PathVariable String goodNumber, @RequestBody TreeData[] treeData) {
		
		if(treeData.length>=7){
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)),HttpStatus.OK);
		}
		goodsService.delGoodsRecommendByNum(goodNumber);//删除所有关联
		for(TreeData tree:treeData){//插入关联
			GoodsRecommend goodsRecommend=new GoodsRecommend();
			goodsRecommend.setGoods_number(goodNumber);
			goodsRecommend.setRecommend_num(tree.getId());
			goodsService.addGoodsRecommend(goodsRecommend);
		}
		
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)),
				HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/tree/{goodNumber}", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> lsitTreeGoods(@PathVariable String goodNumber) {

		List<TreeData> list_1 = new ArrayList<TreeData>();
		List<GoodsCategory> listGoodsCategory = goodsCategoryService.listAllByNumber();
		List<GoodsRecommend> listRecommend = goodsService.listRecommendByNum(goodNumber);
		for (GoodsCategory goodsCategory : listGoodsCategory) {
			TreeData tree_1 = new TreeData();
			tree_1.setTitle(goodsCategory.getName());
			tree_1.setId(goodsCategory.getNumber());
			tree_1.setField("s_category");
			tree_1.setDisabled(true);
			List<TreeData> list_2 = new ArrayList<TreeData>();
			List<Goods> lisgGoods = goodsService.listByCategoryNum(goodsCategory.getNumber(),i18nUtil.lang());
			for (Goods goods : lisgGoods) {
				
				if(goods.getNumber().equals(goodNumber)){//不能关联自己
					continue;
				}
				
				TreeData tree_2 = new TreeData();
				for(GoodsRecommend goodsLink:listRecommend){//获取关联的并选中
					if(goods.getNumber().equals(goodsLink.getRecommend_num())){
						tree_2.setChecked(true);
					}
				}
				tree_2.setField("s_goods");
				tree_2.setTitle(goods.getName());
				tree_2.setId(goods.getNumber());
				list_2.add(tree_2);
			}
			tree_1.setChildren(list_2);
			list_1.add(tree_1);
		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), list_1),
				HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/load", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> loadAjaxGoods(@RequestParam(required = true) String number,
			@RequestParam(required = true) String language) {
		Goods mGoods = goodsService.loadByNumAndlanguage(number, language);
		if (mGoods != null) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), mGoods),
					HttpStatus.OK);
		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail), mGoods), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/del/{mId}", method = RequestMethod.DELETE, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> delAjaxGoods(@PathVariable int mId) {
		goodsService.delete(mId);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> addAjaxGoods(@Validated Goods goods, BindingResult br, Model model) {
		if (br.hasErrors()) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.RequestFormat)), HttpStatus.OK);
		}
		
		
		//实体商品不需要服务TOKEN
		if(goods.getType()==GoodsTypeEnum.REAL.getValue()){
			goods.setService_token(null);
		}
		
		if (StringUtils.isEmpty(goods.getNumber()))
			goods.setNumber(TradeNoUtils.getGoodsNoByTime());
		
		if (goods.getId() == 0)
			goodsService.save(goods);
		else
			goodsService.update(goods);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Pager<Goods>> lsitAjaxGoods() {
		Pager<Goods> list = goodsService.listAllGroupNumber(SystemContext.getPageOffset());
		return new ResponseEntity<Pager<Goods>>(list, HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/category/load", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> loadAjaxCategory(@RequestParam(required = true) String number,
			@RequestParam(required = true) String language) {
		GoodsCategory goodsCategory = goodsCategoryService.loadByNumber(number, language);
		if (goodsCategory != null) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), goodsCategory),
					HttpStatus.OK);
		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail), goodsCategory),
				HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/category/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Pager<GoodsCategory>> listAjaxCategory() {
		Pager<GoodsCategory> listPage = goodsCategoryService.listAll(SystemContext.getPageOffset());
		return new ResponseEntity<Pager<GoodsCategory>>(listPage, HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/category/list/{language}", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Pager<GoodsCategory>> listAjaxCategoryByLanguage(@PathVariable String language) {
		Pager<GoodsCategory> listPage = goodsCategoryService.listAll(language, SystemContext.getPageOffset());
		return new ResponseEntity<Pager<GoodsCategory>>(listPage, HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/category/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> addAjaxCategory(@Validated GoodsCategory goodsCategory, BindingResult br,
			Model model) {

		if (br.hasErrors()) {
			model.addAttribute("message", i18nUtil.i18n(SysErrorCode.RequestFormat));
		}

		if (StringUtils.isEmpty(goodsCategory.getNumber()))
			goodsCategory.setNumber(TradeNoUtils.getGoodsNoByTime());

		if (goodsCategory.getId() == 0)
			goodsCategoryService.save(goodsCategory);
		else
			goodsCategoryService.update(goodsCategory);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/category/del/{mId}", method = RequestMethod.DELETE, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> delAjaxCategory(@PathVariable int mId) {
		goodsCategoryService.delete(mId);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

}