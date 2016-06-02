package com.insurance.contorller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.SpringContextHolder;
import com.insurance.BusConstans;
import com.insurance.db.entity.CancelInsur;
import com.insurance.db.entity.InsurRecord;
import com.insurance.db.service.CancelInsurService;
import com.insurance.db.service.InsurRecordService;
import com.sys.base.BaseController;
import com.sys.base.dto.PageResult;
import com.sys.base.dto.QueryParam;
import com.sys.common.AppExpection;
import com.sys.common.LogConstants;
import com.sys.common.util.DateUtil;
import com.sys.common.util.LogUtil;
import com.sys.common.util.SessionUtil;
import com.sys.db.entity.User;

/**
 *CancelInsurController.java
 */
@Controller
@RequestMapping("/cancel")
public class CancelInsurController extends BaseController {
	@Resource
	CancelInsurService cancelInsurService;
	@Resource
	InsurRecordService insurRecordService;
	
	@RequestMapping(value="newCancel")
	public @ResponseBody CancelInsur newCancel(CancelInsur cancelInsur) throws AppExpection{
		InsurRecord insurRecord = insurRecordService.findById(cancelInsur.getInsur_id());
		insurRecord.setStatus(BusConstans.INSUR_STATUS_CANCELCHECK);
		cancelInsur.setCreatime(DateUtil.getNow());
		cancelInsur.setRemarks(BusConstans.INSUR_STATUS_CANCELCHECK);
		cancelInsurService.saveEntity(cancelInsur);
		insurRecordService.updateEntity(insurRecord);
		return cancelInsur;
	}
	@RequestMapping(value="view")
	public String view(Integer insur_id,Model m){
		CancelInsur query = new CancelInsur();
		query.setInsur_id(insur_id);
		m.addAttribute("cancel", cancelInsurService.findEntity(query));
		return "cancel/viewCancel";
	}
	@RequestMapping(value="handle")
	public String handle(Integer insur_id,Model m){
		m.addAttribute("insur_id", insur_id);
		return "cancel/handleForm";
	}
	/**
	 * ≥∑±£…Í«Î¡–±Ì
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "cancelInsurList")
	public String cancelInsurList(Model m,Integer custom_id) {
		InsurRecord query = new InsurRecord();
		query.setUser_id(custom_id);
		InsurRecordController insur = (InsurRecordController)SpringContextHolder.getBean("insurRecordController");
		m.addAttribute("list",insur.genInsurRecordVo(insurRecordService.find(query)));
		return "insurance/insurCancel";
	}

	/**
	 * ≥∑±£…Í«Î∑÷“≥
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "cancelInsurPage")
	public @ResponseBody
	PageResult<CancelInsur> cancelInsurListPage(QueryParam<CancelInsur> params, Model m, CancelInsur cancelInsur) {
		params.setParam(cancelInsur);
		PageResult<CancelInsur> result = cancelInsurService.pageQuery(params);
		return result;
	}
	/**
	 * ≥∑±£…Í«ÎœÍ«È
	 * 
	 * @param id
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "cancelInsurForm")
	public String cancelInsurForm(Integer id, Model m) {
		CancelInsur cancelInsur = cancelInsurService.findById(id);
		m.addAttribute("cancelInsur", cancelInsur);
		return "cancel/cancelInsurForm";
	}
	/**
	 * ≥∑±£…Í«Î–ﬁ∏ƒ
	 * 
	 * @param cancelInsur
	 * @return
	 */
	@RequestMapping(value = "cancelInsurModify")
	public @ResponseBody CancelInsur cancelInsurModify(CancelInsur cancelInsur, HttpSession session) {
		User sysUser =SessionUtil.sysUser(session);
		try {
			if(cancelInsur!=null&&cancelInsur.getId()!=null){
				CancelInsur dbCancelInsur = cancelInsurService.findById(cancelInsur.getId());
				cancelInsurService.updateEntity(cancelInsur);
				LogUtil.infoDB(getClass(), sysUser.getUserName(),
						LogConstants.OP_TYPE_UPD,
						"SystemController.cancelInsurModify(CancelInsur)", "≥∑±£…Í«Î–ﬁ∏ƒ",dbCancelInsur, cancelInsur);
			}else{
				cancelInsurService.saveEntity(cancelInsur, sysUser);
				LogUtil.infoDB(getClass(), sysUser.getUserName(),
						LogConstants.OP_TYPE_UPD,
						"SystemController.cancelInsurModify(CancelInsur)", "≥∑±£…Í«Î–¬‘ˆ",null, cancelInsur);
			}
			
			
		} catch (AppExpection e) {
			
			LogUtil.infoDB(getClass(), sysUser.getUserName(),
					LogConstants.LEVEL_EXP,
					"SystemController.cancelInsurModify(CancelInsur)", 
					e.getMessage(), cancelInsur,e);
		}

		return cancelInsur;
	}

	/**
	 * ≥∑±£…Í«Î…æ≥˝
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "cancelInsurDelete")
	public @ResponseBody CancelInsur cancelInsurDelete(Integer id) {
		CancelInsur cancelInsur = cancelInsurService.findById(id);
		cancelInsurService.deleteEntity(cancelInsur);
		return cancelInsur;
	}

}
