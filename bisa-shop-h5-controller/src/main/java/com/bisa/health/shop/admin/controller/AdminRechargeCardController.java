package com.bisa.health.shop.admin.controller;

import com.bisa.health.basic.entity.Pager;
import com.bisa.health.basic.entity.SystemContext;
import com.bisa.health.client.entity.Service;
import com.bisa.health.client.entity.User;
import com.bisa.health.client.remote.RemoteInterface;
import com.bisa.health.common.entity.ResultData;
import com.bisa.health.common.utils.RandomUtils;
import com.bisa.health.shiro.web.bind.CurrentUser;
import com.bisa.health.shop.component.InternationalizationUtil;
import com.bisa.health.shop.entity.SysErrorCode;
import com.bisa.health.shop.entity.SysStatusCode;
import com.bisa.health.shop.enumerate.ActivateEnum;
import com.bisa.health.shop.model.GoodsCoupon;
import com.bisa.health.shop.model.RechargeCard;
import com.bisa.health.shop.service.IRechargeCardService;
import com.bisa.health.shop.service.IRechargeCardService;

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

@Controller
@RequestMapping(value = "/admin/card")
@RequiresRoles(value = { "ROLE_ADMIN", "ROLE_CUSTOMER" }, logical = Logical.OR)
public class AdminRechargeCardController {

	@Autowired
	private IRechargeCardService rechargeCardService;

	@Autowired
	private RemoteInterface remoteService;

	@Autowired
	private InternationalizationUtil i18nUtil;

	/**
	 * 进去 bisa 新闻列表 页面
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "admin/card/list";
	}

	@RequestMapping(value = "/ajax/load", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> loadAjaxGoods(@RequestParam(required = true) int id) {
		RechargeCard mRechargeCard = rechargeCardService.getRechargeCardById(id);
		if (mRechargeCard != null) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), mRechargeCard),
					HttpStatus.OK);
		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail), mRechargeCard),
				HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/del/{mId}", method = RequestMethod.DELETE, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> delAjaxGoods(@PathVariable int mId) {
		rechargeCardService.deleteRechargeCard(mId);
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> addAjaxGoods(@CurrentUser User user, @Validated RechargeCard card,
			BindingResult br, Model model) {
		if (br.hasErrors()) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.RequestFormat)), HttpStatus.OK);
		}

		Service service = Service.byStoken(remoteService.listService(), card.getService_token());
		if (service == null || !service.getServiceType().equals(card.getCard_unit())) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.RequestFormat)), HttpStatus.OK);
		}

		if (card.getId() == 0){
			for(int i=0;i<card.getVersion();i++){
				RechargeCard mCard=new RechargeCard();
				mCard.setStatus(card.getStatus());
				mCard.setCard_unit(card.getCard_unit());
				mCard.setService_token(card.getService_token());
				mCard.setCard_count(card.getCard_count());
				mCard.setCard_num(RandomUtils.RandomOfDateChar(8));
				mCard.setCard_pwd(RandomUtils.getRandomChar(6));
				mCard.setCreator(user.getUser_guid());
				mCard.setCard_desc(service.getDesc());
				mCard.setOrder_num("0");
				rechargeCardService.addRechargeCard(mCard);
			}
		}
		
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess)), HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Pager<RechargeCard>> lsitAjaxGoods(@CurrentUser User user,@RequestParam(required = false) String vKey,
			@RequestParam(required = false) String vVal) {
		Pager<RechargeCard> list = rechargeCardService.getPageRechargeCard(SystemContext.getPageOffset(),user.getUser_guid(),vKey, vVal);
		return new ResponseEntity<Pager<RechargeCard>>(list, HttpStatus.OK);
	}

	@RequestMapping(value = "/ajax/disable", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> updateDisable(@RequestParam(required = true) int id,
			@RequestParam(required = true) int status) {

		RechargeCard rechargeCard = rechargeCardService.getRechargeCardById(id);
		if (rechargeCard == null) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)), HttpStatus.OK);
		}

		if (status == ActivateEnum.INACTIVATED.getValue() && status != rechargeCard.getStatus()) {
			rechargeCard.setStatus(status);
			rechargeCard.setVersion(rechargeCard.getVersion() + 1);
			rechargeCardService.updateRechargeCard(rechargeCard);

		}
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), rechargeCard),
				HttpStatus.OK);
	}
	
	@RequestMapping(value = "/ajax/activation", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<ResultData> activation(@RequestParam String username,@RequestParam String mUsername,@RequestParam(defaultValue="off") String is_activation, @RequestParam String card_num,@RequestParam String card_pwd) {

		
		RechargeCard rechargeCard = rechargeCardService.getRechargeCardByNumAndPwd(card_num, card_pwd);
		if (rechargeCard == null||!username.equals(mUsername)||rechargeCard.getStatus()==ActivateEnum.INACTIVATED.getValue()) {
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)), HttpStatus.OK);
		}
		
		User user=remoteService.loadUser(username);
		if(user==null){
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)), HttpStatus.OK);
		}
		
		if(is_activation.equals("on")){
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
			rechargeCard.setCreator(user.getUser_guid());
			rechargeCard.setVersion(rechargeCard.getVersion()+1);
			rechargeCardService.updateRechargeCard(rechargeCard);
			return new ResponseEntity<ResultData>(
					ResultData.success(SysStatusCode.SUCCESS, i18nUtil.i18n(SysErrorCode.OptSuccess), rechargeCard),
					HttpStatus.OK);
		}
		
		
		return new ResponseEntity<ResultData>(
				ResultData.success(SysStatusCode.FAIL, i18nUtil.i18n(SysErrorCode.OptFail)), HttpStatus.OK);
		
	}

}
