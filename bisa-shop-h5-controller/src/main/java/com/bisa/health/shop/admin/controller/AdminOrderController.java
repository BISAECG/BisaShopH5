package com.bisa.health.shop.admin.controller;




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
import org.springframework.web.bind.annotation.PathVariable;
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
import com.bisa.health.shop.enumerate.OrderStatusEnum;
import com.bisa.health.shop.model.Order;
import com.bisa.health.shop.service.IOrderService;
import com.bisa.health.shop.utils.TradeNoUtils;


/**
 * bisa管理系统后台   页面生成
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/admin/order")
@RequiresRoles(value = {"ROLE_ADMIN", "ROLE_CUSTOMER", "ROLE_STORE"}, logical = Logical.OR)
public class AdminOrderController {
	
	@Autowired
	private IOrderService orderService;
	
	
	@Autowired
	private InternationalizationUtil i18nUtil;
	
	 
    /**
     * 进去 bisa 新闻列表 页面
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list() {
        return "admin/order/list";
    }
    
    
	@RequestMapping(value = "/ajax/load", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> loadAjaxGoods(@RequestParam(required = true) int id) {
		Order mOrder = orderService.getOrderById(id);
		if (mOrder != null) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), mOrder),
					HttpStatus.OK);
		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail), mOrder), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/del/{mId}", method = RequestMethod.DELETE, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> delAjaxGoods(@PathVariable int mId) {
		orderService.deleteOrder(mId);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/ajax/address", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> updateAjaxOrderAdr(@RequestParam(required=true) int id,@RequestParam(required=true) String order_address,@RequestParam(required=true) String order_phone) {
		
		Order order=orderService.getOrderById(id);
		
		if(order==null||order.getOrder_status()!=OrderStatusEnum.UNSHIPPED.getValue()){
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.MODIFY_ADDRESS_UNSHIPPED)), HttpStatus.OK);
		}
		order.setOrder_address(order_address);
		order.setOrder_phone(order_phone);
		orderService.updateOrder(order);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/ajax/ems", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> updateAjaxOrderAdr(@RequestParam(required=true) int id,@RequestParam(required=true) int order_status ,@RequestParam(required=true) String ems_num) {
		
		Order order=orderService.getOrderById(id);
		
		if(order==null||(order.getOrder_status()==OrderStatusEnum.DELIVERRY.getValue()&&StringUtils.isEmpty(ems_num))){
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.MODIFY_ADDRESS_UNSHIPPED)), HttpStatus.OK);
		}
		
		order.setEms_num(ems_num);
		order.setOrder_status(order_status);;
		orderService.updateOrder(order);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> addAjaxGoods(@Validated Order order, BindingResult br, Model model) {
		if (br.hasErrors()) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.RequestFormat)), HttpStatus.OK);
		}
		if (order.getId() == 0)
			orderService.addOrder(order);
		else
			orderService.updateOrder(order);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Pager<Order>> lsitAjaxGoods(@RequestParam(required=false) String vKey,@RequestParam(required=false) String vVal) {
		Pager<Order> list = orderService.getPageOrder(SystemContext.getPageOffset(),vKey, vVal);
		return new ResponseEntity<Pager<Order>>(list, HttpStatus.OK);
	}
}
