package com.insurance.db.entity;

import com.sys.base.BaseEntity;

/**
 *Type.java
 */
public class Type extends BaseEntity{
	private String typename;//��������
	private String account;//���ն��
	private String prerate;//���ַ���
	private String remarks;//����
	private String price;//����۸�
	private String expdate;//����
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPrerate() {
		return prerate;
	}
	public void setPrerate(String prerate) {
		this.prerate = prerate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getExpdate() {
		return expdate;
	}
	public void setExpdate(String expdate) {
		this.expdate = expdate;
	}
}
