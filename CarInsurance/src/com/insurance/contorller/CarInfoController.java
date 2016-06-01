package com.insurance.contorller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insurance.db.entity.CarInfo;
import com.insurance.db.service.CarInfoService;
import com.sys.base.BaseController;
import com.sys.base.dto.PageResult;
import com.sys.base.dto.QueryParam;
import com.sys.common.AppExpection;
import com.sys.common.LogConstants;
import com.sys.common.util.LogUtil;
import com.sys.common.util.SessionUtil;
import com.sys.db.DBConstants;
import com.sys.db.entity.User;

/**
 *CarInfoController.java
 */
@Controller
@RequestMapping("/car")
public class CarInfoController extends BaseController {
	@Resource
	CarInfoService carInfoService;
	
	
	/**
	 * 我的车辆查询
	 * @param custom_id
	 * @return
	 */
	@RequestMapping(value="myCarInfos")
	public @ResponseBody List<CarInfo> myCarinfos(Integer custom_id){
		CarInfo query = new CarInfo();
		query.setUser_id(custom_id);
		QueryParam<CarInfo> sortQuery = new QueryParam<CarInfo>(1);
		sortQuery.setOrderFiled("id");
		sortQuery.setOrderType(DBConstants.DML_ORDER_DESC);
		sortQuery.setParam(query);
		return carInfoService.pageQuery(sortQuery).getTotalReslt();
	}

	/**
	 * 车辆信息分页
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "carInfoPage")
	public @ResponseBody
	PageResult<CarInfo> carInfoListPage(QueryParam<CarInfo> params, Model m, CarInfo carInfo) {
		params.setParam(carInfo);
		PageResult<CarInfo> result = carInfoService.pageQuery(params);
		return result;
	}
	/**
	 * 车辆信息详情
	 * 
	 * @param id
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "carInfoForm")
	public String carInfoForm(Integer id, Model m) {
		CarInfo carInfo = carInfoService.findById(id);
		m.addAttribute("carInfo", carInfo);
		return "custom/carInfoForm";
	}
	/**
	 * 车辆信息修改
	 * 
	 * @param carInfo
	 * @return
	 */
	@RequestMapping(value = "carInfoModify")
	public @ResponseBody CarInfo carInfoModify(CarInfo carInfo, HttpSession session) {
		User sysUser =SessionUtil.sysUser(session);
		try {
			if(carInfo!=null&&carInfo.getId()!=null){
				CarInfo dbCarInfo = carInfoService.findById(carInfo.getId());
				carInfoService.updateEntity(carInfo);
				LogUtil.infoDB(getClass(), sysUser.getUserName(),
						LogConstants.OP_TYPE_UPD,
						"SystemController.carInfoModify(CarInfo)", "车辆信息修改",dbCarInfo, carInfo);
			}else{
				carInfoService.saveEntity(carInfo, sysUser);
				LogUtil.infoDB(getClass(), sysUser.getUserName(),
						LogConstants.OP_TYPE_UPD,
						"SystemController.carInfoModify(CarInfo)", "车辆信息新增",null, carInfo);
			}
			
			
		} catch (AppExpection e) {
			
			LogUtil.infoDB(getClass(), sysUser.getUserName(),
					LogConstants.LEVEL_EXP,
					"SystemController.carInfoModify(CarInfo)", 
					e.getMessage(), carInfo,e);
		}

		return carInfo;
	}

	/**
	 * 车辆信息删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "carInfoDelete")
	public @ResponseBody CarInfo carInfoDelete(Integer id) {
		CarInfo carInfo = carInfoService.findById(id);
		carInfoService.deleteEntity(carInfo);
		return carInfo;
	}

}
