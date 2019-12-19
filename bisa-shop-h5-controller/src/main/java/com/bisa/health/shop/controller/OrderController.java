package com.bisa.health.shop.controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.client.entity.User;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.common.utils.PhoneTypeUtil;
import com.bisa.health.common.utils.RandomUtils;
import com.bisa.health.shiro.web.bind.CurrentUser;
import com.bisa.health.shop.admin.controller.AdminNewsController;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.entity.WebException;
import com.bisa.health.shop.enumerate.ActivateEnum;
import com.bisa.health.shop.enumerate.CouponEnum;
import com.bisa.health.shop.enumerate.CouponTypeEnum;
import com.bisa.health.shop.enumerate.GoodsTypeEnum;
import com.bisa.health.shop.enumerate.ONOFFEnum;
import com.bisa.health.shop.enumerate.OrderStatusEnum;
import com.bisa.health.shop.enumerate.PayEnum;
import com.bisa.health.shop.model.Address;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.GoodsCoupon;
import com.bisa.health.shop.model.News;
import com.bisa.health.shop.model.NewsClassify;
import com.bisa.health.shop.model.NewsInLink;
import com.bisa.health.shop.model.Order;
import com.bisa.health.shop.service.IAddressService;
import com.bisa.health.shop.service.IGoodsCouponService;
import com.bisa.health.shop.service.IGoodsService;
import com.bisa.health.shop.service.INewsClassifyService;
import com.bisa.health.shop.service.INewsService;
import com.bisa.health.shop.service.IOrderService;
import com.bisa.health.shop.service.NewsServiceImpl;
import com.bisa.health.shop.utils.TradeNoUtils;

@Controller
public class OrderController {

	@Autowired
	private InternationalizationUtil i18nUtil;

	@Autowired
	private IGoodsService goodService;

	@Autowired
	private IOrderService orderService;

	@Autowired
	private IAddressService addressService;

	@Autowired
	private IGoodsCouponService goodsCouponService;
	

	private final static Logger log = LogManager.getLogger(AdminNewsController.class);
	
	/**
	 * 支付处理
	 * @param request
	 * @param model
	 * @param language
	 * @param order
	 * @return
	 */
	@RequestMapping(value = "/html/{language}/order", method = RequestMethod.POST)
	public String index(HttpServletRequest request, RedirectAttributes  mModel,@CurrentUser User user, @PathVariable String language,@Validated Order order,BindingResult br) {
		if(br.hasErrors()){
			throw new WebException(SysErrorCode.SystemError);
		}
		Goods goods = goodService.loadById(order.getGoods_id());
		if(goods==null){//商品
			throw new WebException(SysErrorCode.SystemError);
		}
		double order_total=order.getGoods_count()*order.getGoods_price();
		if(order.getOrder_total()!=order_total){//总价
			throw new WebException(SysErrorCode.SystemError);
		}
		
		double emd_postage=0;
		
		if(order.getEmd_postage()!=0){
			emd_postage=50;//默认港澳台邮费50
		}
		
		double disprice = 0;
		GoodsCoupon goodsCoupon=null;
		if(!StringUtils.isEmpty(order.getCoupon_num())){//优惠券
			goodsCoupon=goodsCouponService.getGoodsCouponByNum(order.getCoupon_num(),ActivateEnum.ACTIVATE.getValue());
			if (goodsCoupon.getCoupon_type() == CouponTypeEnum.TOTAL.getValue()) {
				if (order_total >= goodsCoupon.getCoupon_total()) {
					disprice = goodsCoupon.getCoupon_disprice();
				}
			} else if (goodsCoupon.getCoupon_type() == CouponTypeEnum.DISRATE.getValue()) {
				disprice = order_total - order_total * goodsCoupon.getCoupon_disrate();
			} else if (goodsCoupon.getCoupon_type() == CouponTypeEnum.DISPRICE.getValue()) {

			}
			order.setIs_coupon(CouponEnum.COUPON.getValue());
		}
		
		double order_price=order_total-disprice+emd_postage;
		if(order_price!=order.getOrder_price()){//优惠价
			throw new WebException(SysErrorCode.SystemError);
		}
		
		//地址
		if(StringUtils.isEmpty(order.getOrder_address())||order.getAddress_id()==0){
			throw new WebException(SysErrorCode.SystemError);
		}
		Address address=addressService.getAddressById(order.getAddress_id());
		if(address==null||!order.getOrder_address().equals(address.getCity()+address.getDetail_address())){
			throw new WebException(SysErrorCode.SystemError);
		}
		order.setOrder_name(address.getConsignee());
		order.setOrder_phone(address.getPhone());
		order.setOrder_area(address.getArea());
		order.setIs_pay(PayEnum.NOT_PAY.getValue());
		order.setOrder_status(OrderStatusEnum.UNSHIPPED.getValue());
		order.setOrder_num(RandomUtils.RandomOfMillisecond());
		order.setUser_id(user.getUser_guid());
		order.setStatus(ActivateEnum.ACTIVATE.getValue());
		if(orderService.addOrder(order)!=null&&goodsCoupon!=null){//更新优惠券状态
			goodsCoupon.setCoupon_status(ActivateEnum.INACTIVATED.getValue());
			goodsCoupon.setVersion(goodsCoupon.getVersion()+1);
			goodsCouponService.updateGoodsCoupon(goodsCoupon);
		}
		mModel.addAttribute("orderNum", order.getOrder_num());
		mModel.addAttribute("timestamp", System.currentTimeMillis());
		return "redirect:/html/"+language+"/pay";
	}
	
	/**
	 * 重新支付
	 * @param request
	 * @param mModel
	 * @param user
	 * @param language
	 * @param order_num
	 * @return
	 */
	@RequestMapping(value = "/html/{language}/order_reset", method = RequestMethod.GET)
	public String index(HttpServletRequest request, RedirectAttributes  mModel,@CurrentUser User user, @PathVariable String language,@RequestParam String order_num) {
		Order order=orderService.getOrderByNum(order_num);
		if(order==null){
			throw new WebException(SysErrorCode.SystemError);
		}
		
		order.setOrder_num(RandomUtils.RandomOfMillisecond());
		order.setUser_id(user.getUser_guid());
		order.setVersion(order.getVersion()+1);
		orderService.updateOrder(order);
		mModel.addAttribute("orderNum", order.getOrder_num());
		mModel.addAttribute("timestamp", System.currentTimeMillis());
		return "redirect:/html/"+language+"/pay";
	}

	
	@RequestMapping(value = "/html/{language}/order", method = RequestMethod.GET)
	public String index(@CurrentUser User user, Model model, @PathVariable String language,
			@RequestParam int goods_id,
			@RequestParam int goods_count) {
		Goods goods = goodService.loadById(goods_id);
		model.addAttribute("language", language);
		model.addAttribute("goods", goods);
		model.addAttribute("goods_count", goods_count);
		return "order/details";
	}


	@RequestMapping(value = "/order/ajax/coupan", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> coupan(@RequestParam(required=true) String coupon_num, @RequestParam(required=true) double order_total) {

		double disprice = 0;

		GoodsCoupon goodsCoupon = goodsCouponService.getGoodsCouponByNum(coupon_num,ActivateEnum.ACTIVATE.getValue());
		if (goodsCoupon != null) {
			if (goodsCoupon.getCoupon_type() == CouponTypeEnum.TOTAL.getValue()) {
				if (order_total >= goodsCoupon.getCoupon_total()) {
					disprice = goodsCoupon.getCoupon_disprice();
				}
			} else if (goodsCoupon.getCoupon_type() == CouponTypeEnum.DISRATE.getValue()) {
				disprice = order_total - order_total * goodsCoupon.getCoupon_disrate();
			} else if (goodsCoupon.getCoupon_type() == CouponTypeEnum.DISPRICE.getValue()) {

			}
		}
		if(disprice!=0){
			BigDecimal bg = new BigDecimal(disprice);
	        double d3 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess),d3),
					HttpStatus.OK);
		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.NOT_COUPON), disprice),
				HttpStatus.OK);
	}
	

	@RequestMapping(value = "/order/ajax/address", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> address(@CurrentUser User user) {
		List<Address> list = addressService.listAddress(user.getUser_guid());
		if (list.size() > 0) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), list.get(0)),
					HttpStatus.OK);
		}

		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)),
				HttpStatus.OK);

	}
	
	@RequestMapping(value = "/order/ajax/address", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> addAjaxAddress(@CurrentUser User user, @Validated Address address,
			BindingResult br, Model model) {
		if (br.hasErrors()) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.RequestFormat)), HttpStatus.OK);
		}

		address.setUser_id(user.getUser_guid());
		if (address.getIs_default().equals(ONOFFEnum.getByValue("on").getValue())) {
			addressService.updateByDefault(ONOFFEnum.getByValue("off").getValue(), user.getUser_guid());
		}

		if (address.getId() == 0)
			addressService.save(address);
		else
			addressService.update(address);

		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess),address), HttpStatus.OK);
	}
	
	
}
