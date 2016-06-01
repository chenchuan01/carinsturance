package com.insurance.db.entity;

import com.sys.base.BaseEntity;

/**
 *InsurRecord.java
 */
public class InsurRecord extends BaseEntity{
	private Integer user_id;
	
	private Integer car_id;
	
	private Integer type_id;
	
	private String creatime;
	
	private String duetime;
	
	private String status;
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getCar_id() {
		return car_id;
	}
	public void setCar_id(Integer car_id) {
		this.car_id = car_id;
	}
	public Integer getType_id() {
		return type_id;
	}
	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}
	public String getCreatime() {
		return creatime;
	}
	public void setCreatime(String creatime) {
		this.creatime = creatime;
	}
	public String getDuetime() {
		return duetime;
	}
	public void setDuetime(String duetime) {
		this.duetime = duetime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
