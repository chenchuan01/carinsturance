package com.insurance.db.entity;

import com.sys.base.BaseEntity;

/**
 *CarInfo.java
 */
public class CarInfo extends BaseEntity{
	private String platenum;//����
	
	private String enginenum;//��������
	
	private String framenum;//���ܺ�
	
	private String seatnum;//��λ��
	
	private Integer user_id;//�û�id
	public String getPlatenum() {
		return platenum;
	}
	public void setPlatenum(String platenum) {
		this.platenum = platenum;
	}
	public String getEnginenum() {
		return enginenum;
	}
	public void setEnginenum(String enginenum) {
		this.enginenum = enginenum;
	}
	public String getFramenum() {
		return framenum;
	}
	public void setFramenum(String framenum) {
		this.framenum = framenum;
	}
	public String getSeatnum() {
		return seatnum;
	}
	public void setSeatnum(String seatnum) {
		this.seatnum = seatnum;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	
	
}
