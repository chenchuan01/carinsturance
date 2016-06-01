package com.insurance.contorller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.insurance.db.service.TypeService;
import com.sys.common.util.LogUtil;

/**
 *HomeController.java
 */
@Controller
@RequestMapping("/home")
public class HomeController {
	@Resource
	TypeService typeService;
	/**
	 * 车险首页
	 * @return
	 */
	@RequestMapping("")
	public String home(){
		return "home";
	}
	/**
	 * 我的车险
	 * @return
	 */
	@RequestMapping("/myInsurance")
	public String myInsurance(Integer custom_id){
		LogUtil.info(getClass(), "我的车险，用户ID=>{0}", custom_id);
		return "custom/myInsurance";
	}
	/**
	 * 购买车险
	 * @return
	 */
	@RequestMapping("/insurSale")
	public String insurSale(Integer custom_id,Model m){
		LogUtil.info(getClass(), "购买车险，用户ID=>{0}", custom_id);
		m.addAttribute("types", typeService.findAllEntity());
		return "insurance/insurSale";
	}
	/**
	 * 撤销投保
	 * @return
	 */
	@RequestMapping("/insurCancel")
	public String insurCancel(Integer custom_id){
		LogUtil.info(getClass(), "撤销投保，用户ID=>{0}", custom_id);
		return "insurance/insurCancel";
	}
	/**
	 * 投保查询
	 * @return
	 */
	@RequestMapping("/insurList")
	public String insuranceList(Integer admin_id){
		LogUtil.info(getClass(), "投保查询，用户ID=>{0}", admin_id);
		return "custom/myInsurance";
	}
	/**
	 * 险种设置
	 * @return
	 */
	@RequestMapping("/userList")
	public String userList(Integer superAdmin_id){
		LogUtil.info(getClass(), "用户管理，用户ID=>{0}", superAdmin_id);
		return "sys/userList";
	}
	/**
	 * 用户管理
	 * @return
	 */
	@RequestMapping("/typeList")
	public String typeList(Integer superAdmin_id){
		LogUtil.info(getClass(), "险种设置，用户ID=>{0}", superAdmin_id);
		return "sys/typeList";
	}
	/**
	 * 系统配置
	 * @return
	 */
	@RequestMapping("/configList")
	public String configList(Integer superAdmin_id){
		LogUtil.info(getClass(), "系统配置，用户ID=>{0}", superAdmin_id);
		return "sys/configList";
	}
}
