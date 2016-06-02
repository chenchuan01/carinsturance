package com.insurance.contorller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insurance.BusConstans;
import com.insurance.db.InsurRecordVo;
import com.insurance.db.entity.CancelInsur;
import com.insurance.db.entity.InsurRecord;
import com.insurance.db.entity.Type;
import com.insurance.db.service.CancelInsurService;
import com.insurance.db.service.CarInfoService;
import com.insurance.db.service.InsurRecordService;
import com.insurance.db.service.TypeService;
import com.sys.base.BaseController;
import com.sys.base.dto.PageResult;
import com.sys.base.dto.QueryParam;
import com.sys.common.AppExpection;
import com.sys.common.LogConstants;
import com.sys.common.util.DateUtil;
import com.sys.common.util.LogUtil;
import com.sys.common.util.SessionUtil;
import com.sys.db.DBConstants;
import com.sys.db.entity.User;
import com.sys.db.service.UserService;

/**
 * InsurRecordController.java
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
	@Resource
	CancelInsurService cancelInsurService;

	/**
	 * 保险办理
	 * 
	 * @param custom_id
	 * @param carInfo_id
	 * @param type_id
	 * @param m
	 * @return
	 */
	@RequestMapping(value = "handleInsur")
	public String handleInsur(Integer custom_id, Integer carInfo_id,
			Integer type_id, Model m) {
		m.addAttribute("user", userService.findById(custom_id));
		m.addAttribute("carInfo", carInfoService.findById(carInfo_id));
		m.addAttribute("type", typeService.findById(type_id));
		m.addAttribute("today", DateUtil.getToday());
		return "insurance/handleInsur";
	}
	@RequestMapping(value = "viewInsur")
	public String  detailInsur(Integer id,Model m){
		m.addAttribute("vo",  queryByIndex(insurRecordService.findById(id)));
		return "insurance/viewInsur";
	}
	@RequestMapping(value = "payInsur")
	public @ResponseBody
	InsurRecord saveInsurRcd(InsurRecord newRecord) {
		Type type = typeService.findById(newRecord.getType_id());
		newRecord.setCreatime(DateUtil.getToday());
		newRecord.setDuetime(DateUtil.calculateDate(newRecord.getCreatime(),
				Integer.valueOf(type.getExpdate()), DateUtil.METRIC_Y));
		newRecord.setStatus(BusConstans.INSUR_STATUS_ACTIVE);
		newRecord=insurRecordService.saveEntity(newRecord).get(0);
		return newRecord;
	}

	/**
	 * 投保记录列表
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
	 * 投保记录分页
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "insurRecordPage")
	public @ResponseBody
	PageResult<InsurRecordVo> insurRecordListPage(QueryParam<InsurRecord> params,
			Model m, InsurRecord insurRecord) {
		params.setParam(insurRecord);
		params.setOrderFiled("creatime");
		params.setOrderType(DBConstants.DML_ORDER_DESC);
		PageResult<InsurRecord> result = insurRecordService.pageQuery(params);
		return convertToRecordVo(result);
	}

	private PageResult<InsurRecordVo> convertToRecordVo(
			PageResult<InsurRecord> result) {
		PageResult<InsurRecordVo> voList = new PageResult<InsurRecordVo>(result);
		voList.setContent(genInsurRecordVo(result.getContent()));
		voList.setTotalReslt(genInsurRecordVo(result.getTotalReslt()));
		return voList;
	}

	public List<InsurRecordVo> genInsurRecordVo(List<InsurRecord> contentList) {
		InsurRecordVo vo;
		List<InsurRecordVo> voContent = new ArrayList<InsurRecordVo>();
		for (InsurRecord record : contentList) {
			vo = queryByIndex(record);
			voContent.add(vo);
		}
		return voContent;
	}

	private InsurRecordVo queryByIndex(InsurRecord record) {
		InsurRecordVo vo = new InsurRecordVo();
		vo.setInfo(record);
		vo.setCar(carInfoService.findById(record.getCar_id()));
		vo.setType(typeService.findById(record.getType_id()));
		vo.setUser(userService.findById(record.getUser_id()));
		CancelInsur query = new CancelInsur();
		query.setInsur_id(record.getId());
		vo.setCancel(cancelInsurService.findEntity(query));
		return vo;
	}

	/**
	 * 投保记录详情
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
	 * 投保记录修改
	 * 
	 * @param insurRecord
	 * @return
	 */
	@RequestMapping(value = "insurRecordModify")
	public @ResponseBody
	InsurRecord insurRecordModify(InsurRecord insurRecord, HttpSession session) {
		User sysUser = SessionUtil.sysUser(session);
		try {
			if (insurRecord != null && insurRecord.getId() != null) {
				InsurRecord dbInsurRecord = insurRecordService
						.findById(insurRecord.getId());
				insurRecordService.updateEntity(insurRecord);
				LogUtil.infoDB(getClass(), sysUser.getUserName(),
						LogConstants.OP_TYPE_UPD,
						"SystemController.insurRecordModify(InsurRecord)",
						"投保记录修改", dbInsurRecord, insurRecord);
			} else {
				insurRecordService.saveEntity(insurRecord, sysUser);
				LogUtil.infoDB(getClass(), sysUser.getUserName(),
						LogConstants.OP_TYPE_UPD,
						"SystemController.insurRecordModify(InsurRecord)",
						"投保记录新增", null, insurRecord);
			}

		} catch (AppExpection e) {

			LogUtil.infoDB(getClass(), sysUser.getUserName(),
					LogConstants.LEVEL_EXP,
					"SystemController.insurRecordModify(InsurRecord)",
					e.getMessage(), insurRecord, e);
		}

		return insurRecord;
	}

	/**
	 * 投保记录删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "insurRecordDelete")
	public @ResponseBody
	InsurRecord insurRecordDelete(Integer id) {
		InsurRecord insurRecord = insurRecordService.findById(id);
		insurRecordService.deleteEntity(insurRecord);
		return insurRecord;
	}

}
