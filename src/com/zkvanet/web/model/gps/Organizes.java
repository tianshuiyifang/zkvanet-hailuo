//*********************************************************************
//系统名称：NARI-AUTOPER 
//Copyright(C)2015-2017 NARI Information and Communication Technology 
//Branch. All rights reserved. 
//版本信息：NARI-AUTOPER-V1.0 
//#作者：feng 权重：100% 手机： 
//版本                                         日期                   作者              变更记录 
//NARI-AUTOPER-V1.0  2017-3-7  feng        新建 
//*********************************************************************
package com.zkvanet.web.model.gps;

import java.util.List;

/**
 * Organizes.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-3-7
 * 类调用特殊情况：无
 */
public class Organizes {

	 private String id;
	 private String organizeCount;
	 private String organizeName="默认组";
	 private List<VehiclesVo> vehicles;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrganizeCount() {
		return organizeCount;
	}
	public void setOrganizeCount(String organizeCount) {
		this.organizeCount = organizeCount;
	}
	public String getOrganizeName() {
		return organizeName;
	}
	public void setOrganizeName(String organizeName) {
		this.organizeName = organizeName;
	}
	public List<VehiclesVo> getVehicles() {
		return vehicles;
	}
	public void setVehicles(List<VehiclesVo> vehicles) {
		this.vehicles = vehicles;
	}
	 
	 
}
