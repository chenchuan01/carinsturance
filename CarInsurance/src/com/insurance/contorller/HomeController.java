package com.insurance.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.common.util.LogUtil;

/**
 *HomeController.java
 */
@Controller
@RequestMapping("/home")
public class HomeController {
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
	 * 我的车险
	 * @return
	 */
	@RequestMapping("/insuranceList")
	public String insuranceList(Integer admin_id){
		LogUtil.info(getClass(), "投保查询，用户ID=>{0}", admin_id);
		return "custom/myInsurance";
	}
	/**
	 * 我的车险
	 * @return
	 */
	@RequestMapping("/userList")
	public String userList(Integer superAdmin_id){
		LogUtil.info(getClass(), "用户管理，用户ID=>{0}", superAdmin_id);
		return "custom/myInsurance";
	}
	
}
