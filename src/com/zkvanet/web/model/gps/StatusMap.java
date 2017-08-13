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

import net.sf.json.JSONObject;

/**
 * StatusMap.java
 * 概述：
 * 功能： 
 * 作者： feng
 * 创建时间：2017-3-7
 * 类调用特殊情况：无
 */
public class StatusMap {
	
	private  String status;
	private  String order;
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	private  GgVo gg;
	private GpsVo gps;
	private HbVo hb;
	private GgVo bd;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public GgVo getGg() {
		return gg;
	}
	public void setGg(GgVo gg) {
		this.gg = gg;
	}
	public GpsVo getGps() {
		return gps;
	}
	public void setGps(GpsVo gps) {
		this.gps = gps;
	}
	public HbVo getHb() {
		return hb;
	}
	public void setHb(HbVo hb) {
		this.hb = hb;
	}
	public GgVo getBd() {
		return bd;
	}
	public void setBd(GgVo bd) {
		this.bd = bd;
	}
	

}
