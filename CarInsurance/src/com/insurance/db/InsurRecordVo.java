package com.insurance.db;

import com.insurance.db.entity.CancelInsur;
import com.insurance.db.entity.CarInfo;
import com.insurance.db.entity.InsurRecord;
import com.insurance.db.entity.Type;
import com.sys.db.entity.User;

/**
 *InsurRecordVo.java
 */
public class InsurRecordVo {
	private InsurRecord info;
	
	private User user;
	
	private CarInfo car;
	
	private Type type;
	
	private CancelInsur cancel;
	public InsurRecord getInfo() {
		return info;
	}

	public void setInfo(InsurRecord info) {
		this.info = info;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public CarInfo getCar() {
		return car;
	}

	public void setCar(CarInfo car) {
		this.car = car;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public CancelInsur getCancel() {
		return cancel;
	}

	public void setCancel(CancelInsur cancel) {
		this.cancel = cancel;
	}
	
	
}
