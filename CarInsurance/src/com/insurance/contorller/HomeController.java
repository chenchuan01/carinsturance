package com.insurance.contorller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.SpringContextHolder;
import com.insurance.db.entity.CancelInsur;
import com.insurance.db.entity.InsurRecord;
import com.insurance.db.service.CancelInsurService;
import com.insurance.db.service.InsurRecordService;
import com.insurance.db.service.TypeService;
import com.sys.common.util.AuthUtil;
import com.sys.common.util.LogUtil;
import com.sys.common.util.StringUtil;
import com.sys.db.entity.User;
import com.sys.db.service.UserService;

/**
 *HomeController.java
 */
@Controller
@RequestMapping("/home")
public class HomeController {
	@Resource
	TypeService typeService;
	@Resource
	InsurRecordService insurRecordService;
	@Resource
	CancelInsurService cancelInsurService;
	@Resource
	UserService userService;
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
	public String insurCancel(Integer custom_id,Model m){
		LogUtil.info(getClass(), "撤销投保，用户ID=>{0}", custom_id);
		InsurRecord query = new InsurRecord();
		query.setUser_id(custom_id);
		InsurRecordController insur = (InsurRecordController)SpringContextHolder.getBean("insurRecordController");
		m.addAttribute("list",insur.genInsurRecordVo(insurRecordService.find(query)));
		return "insurance/insurCancel";
	}
	/**
	 * 投保查询
	 * @return
	 */
	@RequestMapping("/insurList")
	public String insuranceList(Integer admin_id,Model m){
		LogUtil.info(getClass(), "投保查询，用户ID=>{0}", admin_id);
		loadInsurQuery(m);
		return "insurance/insurQuery";
	}
	/**
	 * 报险管理
	 * @return
	 */
	@RequestMapping("/insurTips")
	public String insurTips(Integer admin_id,Model m){
		LogUtil.info(getClass(), "报险管理，用户ID=>{0}", admin_id);
		loadInsurQuery(m);
		return "insurance/insurTips";
	}
	/**
	 * 保险过户
	 * @return
	 */
	@RequestMapping("/insurChange")
	public String insurChange(Integer admin_id,Model m){
		LogUtil.info(getClass(), "保险过户，用户ID=>{0}", admin_id);
		InsurRecordController insur = (InsurRecordController)SpringContextHolder.getBean("insurRecordController");
		List<InsurRecord> list = insurRecordService.findAllEntity();
		List<InsurRecord> cancelList= new ArrayList<InsurRecord>();
		for (InsurRecord insurRecord : list) {
			CancelInsur query = new CancelInsur();
			query.setInsur_id(insurRecord.getId());
			CancelInsur rslt = cancelInsurService.findEntity(query);
			if(!rslt.notNull()){
				cancelList.add(insurRecord);
			}
		}
		loadInsurQuery(m);
		m.addAttribute("list",insur.genInsurRecordVo(cancelList));
		return "insurance/insurChange";
	}
	private void loadInsurQuery(Model m) {
		User query = new User();
		query.setRoles(AuthUtil.AU_USER);
		m.addAttribute("userList", userService.find(query));
		m.addAttribute("typeList", typeService.findAllEntity());
	}
	/**
	 * 撤保审核
	 * @return
	 */
	@RequestMapping("/cancelCheck")
	public String cancelCheck(Integer admin_id,Model m){
		LogUtil.info(getClass(), "撤保审核，用户ID=>{0}", admin_id);
		InsurRecordController insur = (InsurRecordController)SpringContextHolder.getBean("insurRecordController");
		List<InsurRecord> list = insurRecordService.findAllEntity();
		List<InsurRecord> cancelList= new ArrayList<InsurRecord>();
		for (InsurRecord insurRecord : list) {
			CancelInsur query = new CancelInsur();
			query.setInsur_id(insurRecord.getId());
			CancelInsur rslt = cancelInsurService.findEntity(query);
			if(rslt.notNull()&&StringUtil.isNull(rslt.getPasstime())){
				cancelList.add(insurRecord);
			}
		}
		m.addAttribute("list",insur.genInsurRecordVo(cancelList));
		return "insurance/cancelCheck";
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
