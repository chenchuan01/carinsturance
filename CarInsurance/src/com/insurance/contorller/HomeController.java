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
	 * ������ҳ
	 * @return
	 */
	@RequestMapping("")
	public String home(){
		return "home";
	}
	/**
	 * �ҵĳ���
	 * @return
	 */
	@RequestMapping("/myInsurance")
	public String myInsurance(Integer custom_id){
		LogUtil.info(getClass(), "�ҵĳ��գ��û�ID=>{0}", custom_id);
		return "custom/myInsurance";
	}
	/**
	 * �ҵĳ���
	 * @return
	 */
	@RequestMapping("/insuranceList")
	public String insuranceList(Integer admin_id){
		LogUtil.info(getClass(), "Ͷ����ѯ���û�ID=>{0}", admin_id);
		return "custom/myInsurance";
	}
	/**
	 * �ҵĳ���
	 * @return
	 */
	@RequestMapping("/userList")
	public String userList(Integer superAdmin_id){
		LogUtil.info(getClass(), "�û������û�ID=>{0}", superAdmin_id);
		return "custom/myInsurance";
	}
	
}
