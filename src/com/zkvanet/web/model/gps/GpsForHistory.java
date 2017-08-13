//*********************************************************************
//系统名称：NARI-AUTOPER 
//Copyright(C)2015-2017 NARI Information and Communication Technology 
//Branch. All rights reserved. 
//版本信息：NARI-AUTOPER-V1.0 
//#作者：feng 权重：100% 手机： 
//版本                                         日期                   作者              变更记录 
//NARI-AUTOPER-V1.0  2017-3-6  feng        新建 
//*********************************************************************
package com.zkvanet.web.model.gps;

/**
 * GgVo.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-3-6
 * 类调用特殊情况：无
 */
public class GpsForHistory {
	private String direction;
	private String gpsSpeed;
	private String gpsTime;
	private String posType;
	private String lat;
	private String lng;
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	
	
	
}
