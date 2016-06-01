package com.insurance.contorller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insurance.db.entity.InsurRecord;
import com.insurance.db.service.CarInfoService;
import com.insurance.db.service.InsurRecordService;
import com.insurance.db.service.TypeService;
import com.sys.base.BaseController;
import com.sys.base.dto.PageResult;
import com.sys.base.dto.QueryParam;
import com.sys.common.AppExpection;
import com.sys.common.LogConstants;
import com.sys.common.util.LogUtil;
import com.sys.common.util.SessionUtil;
import com.sys.db.entity.User;
import com.sys.db.service.UserService;

/**
 *InsurRecordController.java
 */
@Controller
@RequestMapping("/insur")
public class InsurRecordController extends BaseController {
	@Resource
	InsurRecordService insurRecordService;
	@Resource
	UserService userService;
	@Resource
	CarInfoService carInfoService;
	@Resource
	TypeService typeService;
	
	/**
	 * ���հ���
	 * @param custom_id
	 * @param carInfo_id
	 * @param type_id
	 * @param m
	 * @return
	 */
	@RequestMapping(value="handleInsur")
	public String handleInsur(Integer custom_id,Integer carInfo_id,Integer type_id,Model m){
		m.addAttribute("user", userService.findById(custom_id));
		m.addAttribute("carInfo", carInfoService.findById(carInfo_id));
		m.addAttribute("type", typeService.findById(type_id));
		return "insurance/handleInsur";
	}
	/**
	 * Ͷ����¼�б�
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "insurRecordList")
	public String insurRecordList(Model m) {
		return "insurance/insurRecordList";
	}

	/**
	 * Ͷ����¼��ҳ
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "insurRecordPage")
	public @ResponseBody
	PageResult<InsurRecord> insurRecordListPage(QueryParam<InsurRecord> params, Model m, InsurRecord insurRecord) {
		params.setParam(insurRecord);
		PageResult<InsurRecord> result = insurRecordService.pageQuery(params);
		return result;
	}
	/**
	 * Ͷ����¼����
	 * 
	 * @param id
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "insurRecordForm")
	public String insurRecordForm(Integer id, Model m) {
		InsurRecord insurRecord = insurRecordService.findById(id);
		m.addAttribute("insurRecord", insurRecord);
		return "insurance/insurRecordForm";
	}
	/**
	 * Ͷ����¼�޸�
	 * 
	 * @param insurRecord
	 * @return
	 */
	@RequestMapping(value = "insurRecordModify")
	public @ResponseBody InsurRecord insurRecordModify(InsurRecord insurRecord, HttpSession session) {
		User sysUser =SessionUtil.sysUser(session);
		try {
			if(insurRecord!=null&&insurRecord.getId()!=null){
				InsurRecord dbInsurRecord = insurRecordService.findById(insurRecord.getId());
				insurRecordService.updateEntity(insurRecord);
				LogUtil.infoDB(getClass(), sysUser.getUserName(),
						LogConstants.OP_TYPE_UPD,
						"SystemController.insurRecordModify(InsurRecord)", "Ͷ����¼�޸�",dbInsurRecord, insurRecord);
			}else{
				insurRecordService.saveEntity(insurRecord, sysUser);
				LogUtil.infoDB(getClass(), sysUser.getUserName(),
						LogConstants.OP_TYPE_UPD,
						"SystemController.insurRecordModify(InsurRecord)", "Ͷ����¼����",null, insurRecord);
			}
			
			
		} catch (AppExpection e) {
			
			LogUtil.infoDB(getClass(), sysUser.getUserName(),
					LogConstants.LEVEL_EXP,
					"SystemController.insurRecordModify(InsurRecord)", 
					e.getMessage(), insurRecord,e);
		}

		return insurRecord;
	}

	/**
	 * Ͷ����¼ɾ��
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "insurRecordDelete")
	public @ResponseBody InsurRecord insurRecordDelete(Integer id) {
		InsurRecord insurRecord = insurRecordService.findById(id);
		insurRecordService.deleteEntity(insurRecord);
		return insurRecord;
	}

}
