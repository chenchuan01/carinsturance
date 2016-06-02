package com.insurance.db.entity;

import com.sys.base.BaseEntity;

/**
 *CancelInsur.java
 */
public class CancelInsur extends BaseEntity{
	private Integer insur_id;
	private String reason;
	private String creatime;
	private String passtime;
	private String remarks;
	public Integer getInsur_id() {
		return insur_id;
	}
	public void setInsur_id(Integer insur_id) {
		this.insur_id = insur_id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getCreatime() {
		return creatime;
	}
	public void setCreatime(String creatime) {
		this.creatime = creatime;
	}
	public String getPasstime() {
		return passtime;
	}
	public void setPasstime(String passtime) {
		this.passtime = passtime;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
}
