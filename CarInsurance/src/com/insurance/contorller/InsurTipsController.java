package com.insurance.contorller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insurance.db.InsurRecordVo;
import com.insurance.db.entity.InsurTips;
import com.insurance.db.service.CancelInsurService;
import com.insurance.db.service.CarInfoService;
import com.insurance.db.service.InsurTipsService;
import com.insurance.db.service.TypeService;
import com.sys.base.BaseController;
import com.sys.base.dto.PageResult;
import com.sys.base.dto.QueryParam;
import com.sys.common.AppExpection;
import com.sys.common.LogConstants;
import com.sys.common.util.AuthUtil;
import com.sys.common.util.LogUtil;
import com.sys.common.util.SessionUtil;
import com.sys.db.DBConstants;
import com.sys.db.entity.User;
import com.sys.db.service.UserService;

/**
 *InsurTipsController.java
 */
@Controller
@RequestMapping("/insurTips")
public class InsurTipsController extends BaseController {
	@Resource
	InsurTipsService insurTipsService;
	@Resource
	UserService userService;
	@Resource
	CarInfoService carInfoService;
	@Resource
	TypeService typeService;
	@Resource
	CancelInsurService cancelInsurService;
	/**
	 * 报险记录列表
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "insurTipsList")
	public String insurTipsList(Model m) {
		return "insurance/insurTipsList";
	}

	/**
	 * 报险记录分页
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "insurTipsPage")
	public @ResponseBody
	PageResult<InsurRecordVo> insurTipsListPage(QueryParam<InsurTips> params, Model m, InsurTips insurTips) {
		params.setParam(insurTips);
		params.setOrderFiled("recno");
		params.setOrderType(DBConstants.DML_ORDER_DESC);
		PageResult<InsurTips> result = insurTipsService.pageQuery(params);
		
		return genInsurTipsVo(result);
	}
	private PageResult<InsurRecordVo> genInsurTipsVo(
			PageResult<InsurTips> result) {
		PageResult<InsurRecordVo> voRsult = new PageResult<InsurRecordVo>(result);
		List<InsurRecordVo> voContent = new ArrayList<InsurRecordVo>();
		List<InsurRecordVo> voTotal = new ArrayList<InsurRecordVo>();
		for (InsurTips tip : result.getContent()) {
			voContent.add(genInsurVo(tip));
		}
		voRsult.setContent(voContent);
		for (InsurTips tip : result.getTotalReslt()) {
			voTotal.add(genInsurVo(tip));
		}
		voRsult.setTotalReslt(voTotal);
		return voRsult;
	}

	/**
	 * 报险记录详情
	 * 
	 * @param id
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "insurTipsForm")
	public String insurTipsForm(Integer id, Model m) {
		if(id!=null){
			InsurTips insurTips = insurTipsService.findById(id);
			m.addAttribute("vo", genInsurVo(insurTips));
		}
		selectUsers(m);
		return "insurance/insurTipsForm";
	}

	private InsurRecordVo genInsurVo(InsurTips insurTips) {
		InsurRecordVo vo = new InsurRecordVo();
		vo.setTips(insurTips);
		vo.setCar(carInfoService.findById(insurTips.getCar_id()));
		vo.setUser(userService.findById(insurTips.getUser_id()));
		return vo;
	}

	private void selectUsers(Model m) {
		User query = new User();
		query.setRoles(AuthUtil.AU_USER);
		List<User> list = new ArrayList<User>();
		for (User user : userService.find(query)) {
			list.add(user);
		}
		m.addAttribute("userList", list);
	}
	/**
	 * 报险记录修改
	 * 
	 * @param insurTips
	 * @return
	 */
	@RequestMapping(value = "insurTipsModify")
	public @ResponseBody InsurTips insurTipsModify(InsurTips insurTips, HttpSession session) {
		User sysUser =SessionUtil.sysUser(session);
		try {
			if(insurTips!=null&&insurTips.getId()!=null){
				InsurTips dbInsurTips = insurTipsService.findById(insurTips.getId());
				insurTipsService.updateEntity(insurTips);
				LogUtil.infoDB(getClass(), sysUser.getUserName(),
						LogConstants.OP_TYPE_UPD,
						"SystemController.insurTipsModify(InsurTips)", "报险记录修改",dbInsurTips, insurTips);
			}else{
				insurTips.setRecno(genRecon());
				insurTipsService.saveEntity(insurTips, sysUser);
				LogUtil.infoDB(getClass(), sysUser.getUserName(),
						LogConstants.OP_TYPE_UPD,
						"SystemController.insurTipsModify(InsurTips)", "报险记录新增",null, insurTips);
			}
			
			
		} catch (AppExpection e) {
			
			LogUtil.infoDB(getClass(), sysUser.getUserName(),
					LogConstants.LEVEL_EXP,
					"SystemController.insurTipsModify(InsurTips)", 
					e.getMessage(), insurTips,e);
		}

		return insurTips;
	}

	private String genRecon() {
		String date = new SimpleDateFormat("yyMMddHHmm").format(new Date());
		date = date+new Random(System.currentTimeMillis()).nextInt(10);
		return date;
	}

	/**
	 * 报险记录删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "insurTipsDelete")
	public @ResponseBody InsurTips insurTipsDelete(Integer id) {
		InsurTips insurTips = insurTipsService.findById(id);
		insurTipsService.deleteEntity(insurTips);
		return insurTips;
	}

}
