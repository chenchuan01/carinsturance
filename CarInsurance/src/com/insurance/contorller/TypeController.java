package com.insurance.contorller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.insurance.db.entity.Type;
import com.insurance.db.service.TypeService;
import com.sys.base.BaseController;
import com.sys.base.dto.PageResult;
import com.sys.base.dto.QueryParam;
import com.sys.common.AppExpection;
import com.sys.common.LogConstants;
import com.sys.common.util.LogUtil;
import com.sys.common.util.SessionUtil;
import com.sys.db.entity.User;

/**
 *TypeController.java
 */
@Controller
@RequestMapping("/busys")
public class TypeController extends BaseController {
	@Resource
	TypeService typeService;
	/**
	 * ���������б�
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "typeList")
	public String typeList(Model m) {
		return "sys/typeList";
	}

	/**
	 * �������ͷ�ҳ
	 * 
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "typePage")
	public @ResponseBody
	PageResult<Type> typeListPage(QueryParam<Type> params, Model m, Type type) {
		params.setParam(type);
		PageResult<Type> result = typeService.pageQuery(params);
		return result;
	}
	/**
	 * ������������
	 * 
	 * @param id
	 * @param m
	 * @return
	 * @throws AppExpection
	 */
	@RequestMapping(value = "typeForm")
	public String typeForm(Integer id, Model m) {
		Type type = typeService.findById(id);
		m.addAttribute("type", type);
		return "sys/typeForm";
	}
	/**
	 * ���������޸�
	 * 
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "typeModify")
	public @ResponseBody Type typeModify(Type type, HttpSession session) {
		User sysUser =SessionUtil.sysUser(session);
		try {
			if(type!=null&&type.getId()!=null){
				Type dbType = typeService.findById(type.getId());
				typeService.updateEntity(type);
				LogUtil.infoDB(getClass(), sysUser.getUserName(),
						LogConstants.OP_TYPE_UPD,
						"SystemController.typeModify(Type)", "���������޸�",dbType, type);
			}else{
				typeService.saveEntity(type, sysUser);
				LogUtil.infoDB(getClass(), sysUser.getUserName(),
						LogConstants.OP_TYPE_UPD,
						"SystemController.typeModify(Type)", "������������",null, type);
			}
			
			
		} catch (AppExpection e) {
			
			LogUtil.infoDB(getClass(), sysUser.getUserName(),
					LogConstants.LEVEL_EXP,
					"SystemController.typeModify(Type)", 
					e.getMessage(), type,e);
		}

		return type;
	}

	/**
	 * ��������ɾ��
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "typeDelete")
	public @ResponseBody Type typeDelete(Integer id) {
		Type type = typeService.findById(id);
		typeService.deleteEntity(type);
		return type;
	}

}
