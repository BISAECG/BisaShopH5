package com.bisa.health.shop.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.client.entity.User;
import com.bisa.health.client.remote.RemoteInterface;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.shiro.web.bind.CurrentUser;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.enumerate.ActivateEnum;
import com.bisa.health.shop.enumerate.CouponEnum;
import com.bisa.health.shop.enumerate.OrderStatusEnum;
import com.bisa.health.shop.model.Address;
import com.bisa.health.shop.model.Goods;
import com.bisa.health.shop.model.GoodsCoupon;
import com.bisa.health.shop.model.GoodsRecommend;
import com.bisa.health.shop.model.Order;
import com.bisa.health.shop.model.RechargeCard;
import com.bisa.health.shop.service.IGoodsCouponService;
import com.bisa.health.shop.service.IGoodsService;
import com.bisa.health.shop.service.IOrderService;
import com.bisa.health.shop.service.IRechargeCardService;



@Controller
public class UserController {
	
	@Autowired
	private InternationalizationUtil i18nUtil;
	
	
	@Autowired
	private IRechargeCardService cardService;
	
	@Autowired
	private RemoteInterface remoteService;
	
	@Autowired
	private IRechargeCardService rechargeCardService;
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IGoodsCouponService goodsCouponService;

	
    @RequestMapping(value = "/html/{language}/user", method = RequestMethod.GET)
    public String index(HttpServletRequest request,Model model,@PathVariable String language) {
    	model.addAttribute("language",language);
        return "user/index";
    }
    
    

    @RequestMapping(value = "/html/{language}/user_order", method = RequestMethod.GET)
    public String uesrOrder(HttpServletRequest request,Model model,@PathVariable String language) {
    	model.addAttribute("language", language);
        return "user/order";
    }
    
    @RequestMapping(value = "/html/{language}/user_card", method = RequestMethod.GET)
    public String uesrCard(HttpServletRequest request,Model model,@PathVariable String language) {
        return "user/card";
    }
    
    @RequestMapping(value = "/user/order/ajax/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Pager<Order>> lsitAjaxOrder(@CurrentUser User user, @RequestParam(required=false) String vKey,@RequestParam(required=false) String vVal) {
    	SystemContext.setSort("c_time");
		SystemContext.setOrder("desc");
    	Pager<Order> list = orderService.getPageOrder(SystemContext.getPageOffset(),user.getUser_guid(),vKey, vVal);
		return new ResponseEntity<Pager<Order>>(list, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/user/order/ajax/ok/{mId}", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> okAjaxOrder(@PathVariable int mId) {
		Order order=orderService.getOrderById(mId);
		order.setOrder_status(OrderStatusEnum.RECEIVED.getValue());
		order.setVersion(order.getVersion()+1);
		orderService.updateOrder(order);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/user/order/ajax/cancel/{mId}", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> cancelAjaxOrder(@PathVariable int mId) {
		Order order=orderService.getOrderById(mId);
		if(order.getOrder_status()==OrderStatusEnum.UNSHIPPED.getValue()&&order.getIs_coupon()==CouponEnum.COUPON.getValue()&&!StringUtils.isEmpty(order.getCoupon_num())){
			GoodsCoupon goodsConpon=goodsCouponService.getGoodsCouponByNum(order.getCoupon_num(),ActivateEnum.INACTIVATED.getValue());
			goodsConpon.setCoupon_status(ActivateEnum.ACTIVATE.getValue());
			goodsConpon.setVersion(goodsConpon.getVersion()+1);
			goodsCouponService.updateGoodsCoupon(goodsConpon);
		}
		
		order.setStatus(ActivateEnum.INACTIVATED.getValue());
		order.setVersion(order.getVersion()+1);
		orderService.updateOrder(order);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/user/order/ajax/del/{mId}", method = RequestMethod.DELETE, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> delAjaxOrder(@PathVariable int mId) {
		orderService.deleteOrder(mId);
		
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}
	
    @RequestMapping(value = "/user/card/ajax/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Pager<RechargeCard>> lsitAjaxCard(@CurrentUser User user, @RequestParam(required=false) String vKey,@RequestParam(required=false) String vVal) {
		SystemContext.setSort("status");
		SystemContext.setOrder("desc");
    	Pager<RechargeCard> list = cardService.getPageRechargeCard(SystemContext.getPageOffset(),user.getUser_guid(),vKey, vVal);
		return new ResponseEntity<Pager<RechargeCard>>(list, HttpStatus.OK);
	}
	

	@RequestMapping(value = "/user/card/ajax/del/{mId}", method = RequestMethod.DELETE, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> delAjaxCard(@PathVariable int mId) {
		cardService.deleteRechargeCard(mId);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}
	
	  
    @RequestMapping(value = "/user/ajax/load", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> ajaxLoadUser(@RequestParam String username) {
    	
		User user = remoteService.loadUser(username);
		if (user!=null) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), username),
					HttpStatus.OK);
		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)),
				HttpStatus.OK);

	}
	
	@RequestMapping(value = "/user/ajax/activation", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> activation(@CurrentUser User mUser,  String username, String mUsername,@RequestParam(defaultValue="off") String is_activation, @RequestParam String card_num,@RequestParam String card_pwd) {

		
		RechargeCard rechargeCard = rechargeCardService.getRechargeCardByNumAndPwd(card_num, card_pwd);
		if (rechargeCard == null||rechargeCard.getStatus()==ActivateEnum.INACTIVATED.getValue()) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)), HttpStatus.OK);
		}
	
		
		if(is_activation.equals("on")&&!StringUtils.isEmpty(username)){
			
			User user=remoteService.loadUser(username);
			if(user==null){
				return new ResponseEntity<ResultData>(
						ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)), HttpStatus.OK);
			}
			if(remoteService.addService(rechargeCard.getService_token(), user.getUsername(), rechargeCard.getCard_unit(), rechargeCard.getCard_count())){
				rechargeCard.setStatus(ActivateEnum.INACTIVATED.getValue());
				rechargeCard.setUser_id(user.getUser_guid());
				rechargeCard.setVersion(rechargeCard.getVersion()+1);
				rechargeCardService.updateRechargeCard(rechargeCard);
				return new ResponseEntity<ResultData>(
						ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), rechargeCard),
						HttpStatus.OK);
			}
		}else{
			if(remoteService.addService(rechargeCard.getService_token(), mUser.getUsername(), rechargeCard.getCard_unit(), rechargeCard.getCard_count())){
				rechargeCard.setStatus(ActivateEnum.INACTIVATED.getValue());
				rechargeCard.setUser_id(mUser.getUser_guid());
				rechargeCard.setVersion(rechargeCard.getVersion()+1);
				rechargeCardService.updateRechargeCard(rechargeCard);
				return new ResponseEntity<ResultData>(
						ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), rechargeCard),
						HttpStatus.OK);
			}
		}
		
		
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)), HttpStatus.OK);
		
	}
    
}
